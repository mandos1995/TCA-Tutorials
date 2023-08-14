//
//  CounterFeature.swift
//  Counter
//
//  Created by 김민석 on 2023/08/14.
//

import Foundation

import ComposableArchitecture

struct CounterFeature: Reducer {
    
    struct State {
        var count = 0
    }
    
    enum Action {
        case decrementButtonTapped
        case incrementButtonTapped
    }
    
    func reduce(into state: inout State, action: Action) -> ComposableArchitecture.Effect<Action> {
        switch action {
        case .decrementButtonTapped:
            state.count -= 1
            return .none
        case .incrementButtonTapped:
            state.count += 1
            return .none
        }
    }
    
}
