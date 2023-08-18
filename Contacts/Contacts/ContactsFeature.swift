//
//  ContactsFeature.swift
//  Contacts
//
//  Created by 김민석 on 2023/08/18.
//

import Foundation

import ComposableArchitecture

struct Contact: Equatable, Identifiable {
    let id: UUID
    var name: String
}

struct ContactsFeature: Reducer {
    struct State: Equatable {
        var contacts: [Contact] = []
    }
    
    enum Action: Equatable {
        case addButtonTapped
    }
    
    var body: some ReducerOf<Self> {
        Reduce { state, action in
            switch action {
            case .addButtonTapped:
                return .none
            }
        }
    }
}
