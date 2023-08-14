//
//  CounterApp.swift
//  Counter
//
//  Created by 김민석 on 2023/08/14.
//

import SwiftUI

import ComposableArchitecture

@main
struct CounterApp: App {
    var body: some Scene {
        WindowGroup {
            CounterView(
              store: Store(initialState: CounterFeature.State()) {
                CounterFeature()
              }
            )
        }
    }
}
