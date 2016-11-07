//
//  extension_Object.swift
//  LakestoneRealm
//
//  Created by Taras Vozniuk on 10/27/16.
//
//

#if COOPER
	
	import io.realm
	import lakestonecore.android
#else
	import RealmSwift
#endif


extension Object {
	
	#if COOPER
	
	public var isInvalidated: Bool {
		return !self.isValid()
	}
	
	#endif
	
}
