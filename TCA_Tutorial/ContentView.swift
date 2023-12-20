//
//  ContentView.swift
//  TCA_Tutorial
//
//  Created by 김민석 on 12/20/23.
//

import SwiftUI
import ComposableArchitecture

struct ContentView: View {
    var body: some View {
        NavigationStack {
            NavigationLink("Counter") {
                CounterView(
                    store: Store(
                        initialState: CounterFeature.State()
                    ) {
                        CounterFeature()
                            ._printChanges()
                    })
            }
        }
    }
}

#Preview {
    ContentView()
}
