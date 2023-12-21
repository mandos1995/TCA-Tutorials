//
//  DependencyValues + Extension.swift
//  TCA_Tutorial
//
//  Created by 김민석 on 12/21/23.
//

import ComposableArchitecture

extension DependencyValues {
    var numberFact: NumberFactClient {
        get { self[NumberFactClient.self] }
        set { self[NumberFactClient.self] = newValue }
    }
}
