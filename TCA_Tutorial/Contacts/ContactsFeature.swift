//
//  ContactsFeature.swift
//  TCA_Tutorial
//
//  Created by 김민석 on 12/27/23.
//

import Foundation

import ComposableArchitecture

struct Contact: Equatable, Identifiable {
    let id: UUID
    var name: String
}

@Reducer
struct ContactsFeature {
    struct State: Equatable {
        @PresentationState var addContact: AddContactFeature.State?
        @PresentationState var alert: AlertState<Action.Alert>?
        var contacts: IdentifiedArrayOf<Contact> = []
    }
    
    enum Action {
        case addButtonTapped
        case addContact(PresentationAction<AddContactFeature.Action>)
        case deleteButtonTapped(id: Contact.ID)
        case alert(PresentationAction<Alert>)
        
        enum Alert: Equatable {
            case confirmDeletion(id: Contact.ID)
        }
    }
    
    var body: some ReducerOf<Self> {
        Reduce { state, action in
            switch action {
            case .addButtonTapped:
                state.addContact = AddContactFeature.State(
                    contact: Contact(id: UUID(), name: "")
                )
                return .none

            case .addContact(.presented(.delegate(.saveContact(let contact)))):
                state.contacts.append(contact)
                return .none
                
            case .deleteButtonTapped(let id):
                state.alert = AlertState {
                    TextState("Are you sure")
                } actions: {
                    ButtonState(
                        role: .destructive, action: .confirmDeletion(id: id)) {
                            TextState("Delete")
                    }
                }
                return .none
                
            case .alert(.presented(.confirmDeletion(let id))):
                state.contacts.remove(id: id)
                return .none
                
            case .alert:
                return .none
                
            case .addContact:
                return .none
            }
        }
        .ifLet(\.$addContact, action: \.addContact) {
            AddContactFeature()
        }
        .ifLet(\.$alert, action: \.alert)
    }
}
