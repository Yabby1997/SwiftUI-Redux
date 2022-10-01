//
//  ReduxApp.swift
//  Redux
//
//  Created by USER on 2022/10/01.
//

import SwiftUI

@main
struct ReduxApp: App {
    let store = Store(
        initialState: AppState(),
        reducer: Reducer.giphyReducer()
    )

    var body: some Scene {
        WindowGroup {
            ContentView().environmentObject(store)
        }
    }
}
