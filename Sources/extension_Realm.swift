//
//  extension_Realm.swift
//  LakestoneRealm
//
//  Created by Taras Vozniuk on 10/13/16.
//
//

#if COOPER
    
    import io.realm
    import android.os
#else
    
    import RealmSwift
    
#endif

extension Realm {
    
    public class func `default`() throws -> Realm {
        
        #if COOPER
            return self.getDefaultInstance()
        #else
            return try Realm()
        #endif
    }
    
    public class func unpersistent(withIdentifier identifier: String) throws -> Realm {
            
        #if COOPER
            return Realm.getInstance(RealmConfiguration.Builder().name(identifier).inMemory().build())
        #else
            return try Realm(configuration: Realm.Configuration(inMemoryIdentifier: identifier))
        #endif
    }
    
    public func forceRefresh(){
        
        #if COOPER
        
            // explicit refresh API has been removed from previous realm versions
            // workaround with private APIs
            
            let message = Message.obtain()
            message.what = io.realm.internal.HandlerControllerConstants.LOCAL_COMMIT
            let handlerControllerField = self.getClass().getSuperclass().getDeclaredField("handlerController")
            handlerControllerField.setAccessible(true)
            let handlerController = handlerControllerField.`get`(self) as! Handler.Callback
            handlerController.handleMessage(message)
        
        #else
        
            self.refresh()
            
        #endif
    }
    
    #if COOPER
    
    private class _WriteTransaction: Transaction {
    
        let callback: () -> Void
        init(callback: () -> Void){
            self.callback = callback
        }
    
        public func execute(_ realm: Realm!){
            callback()
        }
    }
    
    public func write(_ closure: @escaping () throws -> Void) throws {
        self.executeTransaction(_WriteTransaction(callback: closure))
    }
    
    public func objects<T: Model>(_ type: Class<T>) -> RealmQuery<T> {
        return self.`where`(type)
    }
    
    #else
    
    public func copyToRealm<T: Object>(_ object: T) -> T {
        self.add(object, update: false)
        return object
    }
    
    public func copyToRealmOrUpdate<T: Object>(_ object: T) -> T {
        self.add(object, update: true)
        return object
    }
    
    public func copyToRealm<S : Sequence where S.Iterator.Element : Object>(_ objects: S) -> S {
        self.add(objects, update: false)
        return objects
    }
    
    public func copyToRealmOrUpdate<S : Sequence where S.Iterator.Element : Object>(_ objects: S) -> S {
        self.add(objects, update: true)
        return objects
    }
    
    #endif
    
}
