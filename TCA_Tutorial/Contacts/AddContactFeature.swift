//
//  AddContactFeature.swift
//  TCA_Tutorial
//
//  Created by 김민석 on 12/27/23.
//

import Foundation

import ComposableArchitecture

@Reducer
struct AddContactFeature {
    struct State: Equatable {
        var contact: Contact
    }
    
    enum Action {
        case cancelButtonTapped
        case saveButtonTapped
        case setName(String)
        case delegate(Delegate)
        
        enum Delegate: Equatable {
            case saveContact(Contact)
        }
    }
    @Dependency(\.dismiss) var dismiss
    
    var body: some ReducerOf<Self> {
        Reduce { state, action in
            switch action {
            case .cancelButtonTapped:
                return .run { _ in await self.dismiss() }
            case .saveButtonTapped:
                return .run { [contact = state.contact] send in
                    await send(.delegate(.saveContact(contact)))
                    await self.dismiss()
                }
            case .setName(let name):
                state.contact.name = name
                return .none
            case .delegate:
                return .none
            }
        }
    }
}
