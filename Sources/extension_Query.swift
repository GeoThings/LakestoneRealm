//
//  extension_Query.swift
//  LakestoneRealm
//
//  Created by Taras Vozniuk on 10/13/16.
//
//

#if COOPER
    
import io.realm
import lakestonecore.android

/*
 
 public func isNull(_ fieldName: String!) -> RealmQuery<E>!
 public func isNotNull(_ fieldName: String!) -> RealmQuery<E>!
 
 public func `in`(_ fieldName: String!, _ values: Date!![]) -> RealmQuery<E>!
 public func `in`(_ fieldName: String!, _ values: Boolean!![]) -> RealmQuery<E>!
 public func `in`(_ fieldName: String!, _ values: Float!![]) -> RealmQuery<E>!
 public func `in`(_ fieldName: String!, _ values: Double!![]) -> RealmQuery<E>!
 public func `in`(_ fieldName: String!, _ values: Long!![]) -> RealmQuery<E>!
 public func `in`(_ fieldName: String!, _ values: Integer!![]) -> RealmQuery<E>!
 public func `in`(_ fieldName: String!, _ values: Short!![]) -> RealmQuery<E>!
 public func `in`(_ fieldName: String!, _ values: Byte!![]) -> RealmQuery<E>!
 public func `in`(_ fieldName: String!, _ values: String!![], _ casing: Case!) -> RealmQuery<E>!
 public func `in`(_ fieldName: String!, _ values: String!![]) -> RealmQuery<E>!
 public func notEqualTo(_ fieldName: String!, _ value: Date!) -> RealmQuery<E>!
 public func notEqualTo(_ fieldName: String!, _ value: Boolean!) -> RealmQuery<E>!
 public func notEqualTo(_ fieldName: String!, _ value: Float!) -> RealmQuery<E>!
 public func notEqualTo(_ fieldName: String!, _ value: Double!) -> RealmQuery<E>!
 public func notEqualTo(_ fieldName: String!, _ value: Long!) -> RealmQuery<E>!
 public func notEqualTo(_ fieldName: String!, _ value: Integer!) -> RealmQuery<E>!
 public func notEqualTo(_ fieldName: String!, _ value: Short!) -> RealmQuery<E>!
 public func notEqualTo(_ fieldName: String!, _ value: SByte[]) -> RealmQuery<E>!
 public func notEqualTo(_ fieldName: String!, _ value: Byte!) -> RealmQuery<E>!
 public func notEqualTo(_ fieldName: String!, _ value: String!, _ casing: Case!) -> RealmQuery<E>!
 public func notEqualTo(_ fieldName: String!, _ value: String!) -> RealmQuery<E>!
 public func greaterThan(_ fieldName: String!, _ value: Date!) -> RealmQuery<E>!
 public func greaterThan(_ fieldName: String!, _ value: Single) -> RealmQuery<E>!
 public func greaterThan(_ fieldName: String!, _ value: Double) -> RealmQuery<E>!
 public func greaterThan(_ fieldName: String!, _ value: Int64) -> RealmQuery<E>!
 public func greaterThan(_ fieldName: String!, _ value: Integer) -> RealmQuery<E>!
 public func greaterThanOrEqualTo(_ fieldName: String!, _ value: Date!) -> RealmQuery<E>!
 public func greaterThanOrEqualTo(_ fieldName: String!, _ value: Single) -> RealmQuery<E>!
 public func greaterThanOrEqualTo(_ fieldName: String!, _ value: Double) -> RealmQuery<E>!
 public func greaterThanOrEqualTo(_ fieldName: String!, _ value: Int64) -> RealmQuery<E>!
 public func greaterThanOrEqualTo(_ fieldName: String!, _ value: Integer) -> RealmQuery<E>!
 public func lessThan(_ fieldName: String!, _ value: Date!) -> RealmQuery<E>!
 public func lessThan(_ fieldName: String!, _ value: Single) -> RealmQuery<E>!
 public func lessThan(_ fieldName: String!, _ value: Double) -> RealmQuery<E>!
 public func lessThan(_ fieldName: String!, _ value: Int64) -> RealmQuery<E>!
 public func lessThan(_ fieldName: String!, _ value: Integer) -> RealmQuery<E>!
 public func lessThanOrEqualTo(_ fieldName: String!, _ value: Date!) -> RealmQuery<E>!
 public func lessThanOrEqualTo(_ fieldName: String!, _ value: Single) -> RealmQuery<E>!
 public func lessThanOrEqualTo(_ fieldName: String!, _ value: Double) -> RealmQuery<E>!
 public func lessThanOrEqualTo(_ fieldName: String!, _ value: Int64) -> RealmQuery<E>!
 public func lessThanOrEqualTo(_ fieldName: String!, _ value: Integer) -> RealmQuery<E>!
 public func between(_ fieldName: String!, _ from: Date!, _ to: Date!) -> RealmQuery<E>!
 public func between(_ fieldName: String!, _ from: Single, _ to: Single) -> RealmQuery<E>!
 public func between(_ fieldName: String!, _ from: Double, _ to: Double) -> RealmQuery<E>!
 public func between(_ fieldName: String!, _ from: Int64, _ to: Int64) -> RealmQuery<E>!
 public func between(_ fieldName: String!, _ from: Integer, _ to: Integer) -> RealmQuery<E>!
 public func contains(_ fieldName: String!, _ value: String!, _ casing: Case!) -> RealmQuery<E>!
 public func contains(_ fieldName: String!, _ value: String!) -> RealmQuery<E>!
 public func beginsWith(_ fieldName: String!, _ value: String!, _ casing: Case!) -> RealmQuery<E>!
 public func beginsWith(_ fieldName: String!, _ value: String!) -> RealmQuery<E>!
 public func endsWith(_ fieldName: String!, _ value: String!, _ casing: Case!) -> RealmQuery<E>!
 public func endsWith(_ fieldName: String!, _ value: String!) -> RealmQuery<E>!
 public func beginGroup() -> RealmQuery<E>!
 public func endGroup() -> RealmQuery<E>!
 public func or() -> RealmQuery<E>!
 public func not() -> RealmQuery<E>!
 public func isEmpty(_ fieldName: String!) -> RealmQuery<E>!
 public func isNotEmpty(_ fieldName: String!) -> RealmQuery<E>!
*/


extension Query {
 
    public var all: Results<E> {
        return self.findAll()
    }
    
    public func allSorted(byField field: String, ascending: Bool = true) -> Results<E> {
        return self.findAllSorted(field, (ascending) ? Sort.ASCENDING : Sort.DESCENDING)
    }
    
    public func whereNil(field: String) -> RealmQuery<E> {
        return self.isNull(field)
    }
    
    public func whereNonNil(field: String) -> RealmQuery<E> {
        return self.isNotNull(field)
    }
    
    public func `where`(field: String, between lowerBound: Float, upperBound: Float) -> RealmQuery<E> {
        return self.between(field, lowerBound, upperBound)
    }
    
    public func `where`(field: String, between lowerBound: Double, upperBound: Double) -> RealmQuery<E> {
        return self.between(field, lowerBound, upperBound)
    }
    
    public func `where`(field: String, between lowerBound: Long, upperBound: Long) -> RealmQuery<E> {
        return self.between(field, lowerBound, upperBound)
    }
    
    public func `where`(field: String, between lowerBound: Integer, upperBound: Integer) -> RealmQuery<E> {
        return self.between(field, lowerBound, upperBound)
    }
    
    public func `where`(field: String, between lowerBound: Short, upperBound: Short) -> RealmQuery<E> {
        return self.between(field, lowerBound, upperBound)
    }
    
    public func `where`(field: String, between lowerBound: Byte, upperBound: Byte) -> RealmQuery<E> {
        return self.between(field, lowerBound, upperBound)
    }
    
    //equalsTo
    public func `where`(field: String, equalsTo value: Date) -> RealmQuery<E> {
        return self.equalTo(field, value)
    }
 
    public func `where`(field: String, equalsTo value: Bool) -> RealmQuery<E> {
        return self.equalTo(field, value)
    }
    
    public func `where`(field: String, equalsTo value: Float) -> RealmQuery<E> {
        return self.equalTo(field, value)
    }
    
    public func `where`(field: String, equalsTo value: Double) -> RealmQuery<E> {
        return self.equalTo(field, value)
    }
    
    public func `where`(field: String, equalsTo value: Long) -> RealmQuery<E> {
        return self.equalTo(field, value)
    }
    
    public func `where`(field: String, equalsTo value: Integer) -> RealmQuery<E> {
        return self.equalTo(field, value)
    }
    
    public func `where`(field: String, equalsTo value: Short) -> RealmQuery<E> {
        return self.equalTo(field, value)
    }
    
    public func `where`(field: String, equalsTo value: Byte) -> RealmQuery<E> {
        return self.equalTo(field, value)
    }
    
    public func `where`(field: String, equalsTo value: String, caseSensitive: Bool = false) -> RealmQuery<E> {
        
        if caseSensitive {
            return self.equalTo(field, value, Case.SENSITIVE)
        } else {
            return self.equalTo(field, value, Case.INSENSITIVE)
        }
    }
    
    //notEqualTo
    public func `where`(field: String, notEqualTo value: Date) -> RealmQuery<E> {
        return self.notEqualTo(field, value)
    }
    
    public func `where`(field: String, notEqualTo value: Bool) -> RealmQuery<E> {
        return self.notEqualTo(field, value)
    }
    
    public func `where`(field: String, notEqualTo value: Float) -> RealmQuery<E> {
        return self.notEqualTo(field, value)
    }
    
    public func `where`(field: String, notEqualTo value: Double) -> RealmQuery<E> {
        return self.notEqualTo(field, value)
    }
    
    public func `where`(field: String, notEqualTo value: Long) -> RealmQuery<E> {
        return self.notEqualTo(field, value)
    }
    
    public func `where`(field: String, notEqualTo value: Integer) -> RealmQuery<E> {
        return self.notEqualTo(field, value)
    }
    
    public func `where`(field: String, notEqualTo value: Short) -> RealmQuery<E> {
        return self.notEqualTo(field, value)
    }
    
    public func `where`(field: String, notEqualTo value: Byte) -> RealmQuery<E> {
        return self.notEqualTo(field, value)
    }
    
    public func `where`(field: String, notEqualTo value: String, caseSensitive: Bool = false) -> RealmQuery<E> {
        
        if caseSensitive {
            return self.notEqualTo(field, value, Case.SENSITIVE)
        } else {
            return self.notEqualTo(field, value, Case.INSENSITIVE)
        }
    }

    //lessThan
    public func `where`(field: String, lessThan value: Date) -> RealmQuery<E> {
        return self.lessThan(field, value)
    }
    
    public func `where`(field: String, lessThan value: Float) -> RealmQuery<E> {
        return self.lessThan(field, value)
    }
    
    public func `where`(field: String, lessThan value: Double) -> RealmQuery<E> {
        return self.lessThan(field, value)
    }
    
    public func `where`(field: String, lessThan value: Long) -> RealmQuery<E> {
        return self.lessThan(field, value)
    }
    
    public func `where`(field: String, lessThan value: Integer) -> RealmQuery<E> {
        return self.lessThan(field, value)
    }
    
    public func `where`(field: String, lessThan value: Short) -> RealmQuery<E> {
        return self.lessThan(field, value)
    }
    
    public func `where`(field: String, lessThan value: Byte) -> RealmQuery<E> {
        return self.lessThan(field, value)
    }

    //greaterThan
    public func `where`(field: String, greaterThan value: Date) -> RealmQuery<E> {
        return self.greaterThan(field, value)
    }
    
    public func `where`(field: String, greaterThan value: Float) -> RealmQuery<E> {
        return self.greaterThan(field, value)
    }
    
    public func `where`(field: String, greaterThan value: Double) -> RealmQuery<E> {
        return self.greaterThan(field, value)
    }
    
    public func `where`(field: String, greaterThan value: Long) -> RealmQuery<E> {
        return self.greaterThan(field, value)
    }
    
    public func `where`(field: String, greaterThan value: Integer) -> RealmQuery<E> {
        return self.greaterThan(field, value)
    }
    
    public func `where`(field: String, greaterThan value: Short) -> RealmQuery<E> {
        return self.greaterThan(field, value)
    }
    
    public func `where`(field: String, greaterThan value: Byte) -> RealmQuery<E> {
        return self.greaterThan(field, value)
    }
    
}

#endif
