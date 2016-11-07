//
//  alliases.swift
//  LakestoneRealm
//
//  Created by Taras Vozniuk on 10/13/16.
//
//

#if COOPER

	import io.realm

#else
	
	import RealmSwift
	
#endif


#if COOPER
	
	public typealias Object = RealmObject
	public typealias Results = RealmResults
	public typealias Query = RealmQuery
	public typealias Model = RealmModel
	public typealias List = RealmList
	
    
#else

	
#endif
