//
//  TCA_TutorialApp.swift
//  TCA_Tutorial
//
//  Created by 김민석 on 12/20/23.
//

import SwiftUI

import ComposableArchitecture

@main
struct TCA_TutorialApp: App {
    let store = Store(initialState: AppFeature.State()) {
        AppFeature()
            ._printChanges()
    }
    
    let contactStore = Store(initialState: ContactsFeature.State()) {
        ContactsFeature()
            ._printChanges()
    }
    var body: some Scene {
        WindowGroup {
            ContactsView(store: contactStore)
        }
    }
}
