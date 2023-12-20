//
//  CounterFeature.swift
//  TCA_Tutorial
//
//  Created by 김민석 on 12/20/23.
//

import ComposableArchitecture

@Reducer
struct CounterFeature {
    struct State {
        var count = 0
    }
    
    enum Action {
        case decrementButtonTapped
        case incrementButtonTapped
    }
    
    var body: some ReducerOf<Self> {
        Reduce { state, action in
            switch action {
            case .decrementButtonTapped:
                state.count += 1
                return .none
            case .incrementButtonTapped:
                state.count -= 1
                return .none
            }
            
        }
    }
}
