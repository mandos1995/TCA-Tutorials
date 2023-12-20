//
//  CounterView.swift
//  TCA_Tutorial
//
//  Created by 김민석 on 12/20/23.
//

import ComposableArchitecture
import SwiftUI

struct CounterView: View {
    let store: StoreOf<CounterFeature>
    
    var body: some View {
        VStack {
            Text("0")
                .font(.largeTitle)
                .padding()
                .background(.black.opacity(0.1))
                .cornerRadius(10)
            HStack {
                Button("-") {
                    
                }
                .font(.largeTitle)
                .padding()
                .background(.black.opacity(0.1))
                .cornerRadius(10)
                
                Button("+") {
                    
                }
                .font(.largeTitle)
                .padding()
                .background(.black.opacity(0.1))
                .cornerRadius(10)
            }
        }
    }
}

#Preview {
    CounterView(
        store: Store(initialState: CounterFeature.State()) {
            CounterFeature()
        }
    )
}
