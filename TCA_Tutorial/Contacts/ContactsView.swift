//
//  ContactsView.swift
//  TCA_Tutorial
//
//  Created by 김민석 on 12/27/23.
//

import SwiftUI

import ComposableArchitecture

struct ContactsView: View {
    let store: StoreOf<ContactsFeature>
    
    var body: some View {
        NavigationStack {
            WithViewStore(self.store, observe: \.contacts) { viewStore in
                List {
                    ForEach(viewStore.state) { contact in
                        Text(contact.name)
                    }
                }
                .navigationTitle("Contacts")
                .toolbar {
                    ToolbarItem {
                        Button {
                            viewStore.send(.addButtonTapped)
                        } label: {
                            Image(systemName: "plus")
                        }
                    }
                }
                
            }
        }
        .sheet(store: self.store.scope(state: \.$addContact, action: \.addContact)) { store in
            NavigationStack {
                AddContactView(store: store)
            }
        }
    }
}
