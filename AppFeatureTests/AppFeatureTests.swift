//
//  AppFeatureTests.swift
//  AppFeatureTests
//
//  Created by 김민석 on 12/27/23.
//

import XCTest

import ComposableArchitecture

@testable import TCA_Tutorial

final class AppFeatureTests: XCTestCase {
    func testIncrementInFirstTab() async {
        let store = TestStore(initialState: AppFeature.State()) {
            AppFeature()
        }
        
        await store.send(.tab1(.incrementButtonTapped)) {
            $0.tab1.count = 1
        }
    }

}