//
//  WristApp.swift
//  Wrist
//
//  Created by 라주영 on 2023/03/26.
//

import ComposableArchitecture
import SwiftUI

@main
struct WristApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView(
                store: Store(initialState: Content.State(), reducer: Content()._printChanges())
            )
        }
    }
}
