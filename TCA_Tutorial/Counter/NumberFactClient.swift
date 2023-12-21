//
//  NumberFactClient.swift
//  TCA_Tutorial
//
//  Created by 김민석 on 12/21/23.
//

import Foundation

import ComposableArchitecture

struct NumberFactClient {
    var fetch: (Int) async throws -> String
}

extension NumberFactClient: DependencyKey {
    static var liveValue = Self(
        fetch: { number in
            let (data, _) = try await URLSession.shared
                .data(from: URL(string: "http://numbersapi.com/\(number)")!)
            return String(decoding: data, as: UTF8.self)
        }
    )
}
