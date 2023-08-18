//
//  ContactsApp.swift
//  Contacts
//
//  Created by 김민석 on 2023/08/18.
//

import SwiftUI

import ComposableArchitecture

@main
struct ContactsApp: App {
    static let store = Store(initialState: ContactsFeature.State()) {
        ContactsFeature()
            ._printChanges()
    }
    var body: some Scene {
        WindowGroup {
            ContactsView(store: ContactsApp.store)
        }
    }
}
