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
        var fact: String?
        var isLoading = false
        var isTimerRunning = false
    }
    
    enum Action {
        case decrementButtonTapped
        case incrementButtonTapped
        case factButtonTapped
        case factResponse(String)
        case toggleTimerButtonTapped
        case timerTick
    }
    
    enum CancelId { case timer }
    
    @Dependency(\.continuousClock) var clock
    @Dependency(\.numberFact) var numberFact
    
    func reduce(into state: inout State, action: Action) -> ComposableArchitecture.Effect<Action> {
        switch action {
        case .decrementButtonTapped:
            state.count -= 1
            return .none
        case .incrementButtonTapped:
            state.count += 1
            return .none
            
        case .factButtonTapped:
            state.fact = nil
            state.isLoading = true
            return .run { [count = state.count] send in
                try await send(.factResponse(self.numberFact.fetch(count)))
            }
            
        case .factResponse(let fact):
            state.fact = fact
            state.isLoading = false
            return .none
            
        case .toggleTimerButtonTapped:
            state.isTimerRunning.toggle()
            if state.isTimerRunning {
                return .run { send in
                    for await _ in self.clock.timer(interval: .seconds(1)) {
                        await send(.timerTick)
                    }
                }
                .cancellable(id: CancelId.timer)
            } else {
                return .cancel(id: CancelId.timer)
            }
   
        case .timerTick:
            state.count += 1
            state.fact = nil
            return .none
        }
    }
    
}

extension CounterFeature.State: Equatable { }
extension CounterFeature.Action: Equatable { }
