//
//  CounterFeatureTests.swift
//  CounterFeatureTests
//
//  Created by 김민석 on 12/20/23.
//

import XCTest

import ComposableArchitecture

@testable import TCA_Tutorial

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
