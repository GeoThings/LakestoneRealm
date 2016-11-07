//
//  extension_List.swift
//  LakestoneRealm
//
//  Created by Taras Vozniuk on 10/21/16.
//
//

#if COOPER
	
	import io.realm
	
#else
	
	import RealmSwift
	
#endif

extension List {
	
	#if COOPER
	
    public func append(_ object: E){
        self.add(object)
    }
	
	#endif
	
}
