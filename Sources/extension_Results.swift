﻿//
//  extension_Results.swift
//  LakestoneRealm
//
//  Created by Taras Vozniuk on 10/13/16.
//
//

#if COOPER
	
	import io.realm
	
#else
	
	import Foundation
	import LakestoneCore
	import RealmSwift
	
#endif


#if !COOPER
extension Results {
	
	public var all: Results<T> {
		return self
	}
    
    public func allSorted(byField field: String, ascending: Bool = true) -> Results<T> {
        return self.sorted(byProperty: field, ascending: ascending)
    }
	
	#if COOPER
	public var count: Int {
		return self.size()
	}
	#endif
	
	/// Until Predicates are not implemented in LakestoneCore
	/// have to use explicit method-predicate approach as in realm-java
	
    public func whereNil(field: String) -> Results<T> {
        return self.filter("\(field) = nil")
    }
    
    public func whereNonNil(field: String) -> Results<T> {
        return self.filter("\(field)!=nil")
    }
    
    public func `where`(field: String, between lowerBound: AnyNumeric, upperBound: AnyNumeric) -> Results<T> {
        return self.filter("\(field) >= \(lowerBound) AND \(field) <= \(upperBound)")
    }
    
	//equalsTo
	public func `where`(field: String, equalsTo dateValue: Date) -> Results<T> {
		return self.filter("\(field) == %@", dateValue)
	}
	
	public func `where`(field: String, equalsTo boolValue: Bool) -> Results<T> {
        
        let boolValueString = (boolValue) ? "YES" : "NO"
		return self.filter("\(field) == \(boolValueString)")
	}
	
	public func `where`(field: String, equalsTo numericValue: AnyNumeric) -> Results<T> {
		return self.filter("\(field) == \(numericValue)")
	}
	
	public func `where`(field: String, equalsTo stringValue: String, caseSensitive: Bool = false) -> Results<T> {
		
		if caseSensitive {
			return self.filter("\(field) == %@", stringValue)
		} else {
			return self.filter("\(field) ==[c] %@", stringValue)
		}
	}

	//notEqualTo
	public func `where`(field: String, notEqualTo dateValue: Date) -> Results<T> {
		return self.filter("\(field) != %@", dateValue)
	}
	
	public func `where`(field: String, notEqualTo boolValue: Bool) -> Results<T> {
		return self.filter("\(field) != \(boolValue)")
	}
	
	public func `where`(field: String, notEqualTo numericValue: AnyNumeric) -> Results<T> {
		return self.filter("\(field) != \(numericValue)")
	}
	
	public func `where`(field: String, notEqualTo stringValue: String, caseSensitive: Bool = false) -> Results<T> {
		
		if caseSensitive {
			return self.filter("\(field) != %@", stringValue)
		} else {
			return self.filter("\(field) !=[c] %@", stringValue)
		}
	}

	//lessThan
	public func `where`(field: String, lessThan dateValue: Date) -> Results<T> {
		return self.filter("\(field) < %@", dateValue)
	}
	
	public func `where`(field: String, lessThan numericValue: AnyNumeric) -> Results<T> {
		return self.filter("\(field) < \(numericValue)")
	}
	
	//greaterThan
	public func `where`(field: String, greaterThan dateValue: Date) -> Results<T> {
		return self.filter("\(field) > %@", dateValue)
	}
	
	public func `where`(field: String, greaterThan numericValue: AnyNumeric) -> Results<T> {
		return self.filter("\(field) > \(numericValue)")
	}

}
#endif