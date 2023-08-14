//
//  CounterFeatureTests.swift
//  CounterFeatureTests
//
//  Created by 김민석 on 2023/08/14.
//

import ComposableArchitecture
import XCTest
@testable import Counter

@MainActor
final class CounterFeatureTests: XCTestCase {
    func testCounter() async {
        let store = TestStore(initialState: CounterFeature.State()) {
            CounterFeature()
        }
        
        await store.send(.incrementButtonTapped) {
            $0.count = 1
        }
        await store.send(.decrementButtonTapped) {
            $0.count = 0
        }
    }
    
    
}
