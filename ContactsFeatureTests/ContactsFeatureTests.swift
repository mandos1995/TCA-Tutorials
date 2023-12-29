////
////  ContactsFeatureTests.swift
////  ContactsFeatureTests
////
////  Created by 김민석 on 12/29/23.
////
//
//import XCTest
//
//import ComposableArchitecture
//
//@testable import TCA_Tutorial
//
//@MainActor
//final class ContactsFeatureTests: XCTestCase {
//    func testAddFlow() async {
//        let store = TestStore(
//            initialState: ContactsFeature.State()) {
//                ContactsFeature()
//            }
//        await store.send(.addButtonTapped) {
//            $0.destiantion = .addContact(
//            )
//        }
//    }
//}
