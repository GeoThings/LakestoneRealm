//
//  TestRealm.swift
//  LakestoneXML
//
//  Created by Taras Vozniuk on 10/13/16.
//  Copyright © 2016 GeoThings. All rights reserved.
//
// --------------------------------------------------------
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
// http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.
//


#if COOPER

	import remobjects.elements.eunit
	import lakestonecore.android
	import io.realm
#else

	import XCTest
	import Foundation
	import LakestoneCore
	import RealmSwift

	@testable import LakestoneRealm

#endif

public class TestRealm: Test {

	#if COOPER
	override func Setup(){
		super.Setup()
		self.commonSetup()
	}
	#else
	override public func setUp() {
		super.setUp()
		self.commonSetup()
	}
	#endif

	public func commonSetup() {
	}

	#if COOPER

	public func testRealm(){
	}

	#endif

}