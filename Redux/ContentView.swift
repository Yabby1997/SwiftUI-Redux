//
//  ContentView.swift
//  Redux
//
//  Created by USER on 2022/10/01.
//

import SwiftUI

struct ContentView: View {

    @EnvironmentObject private var store: Store<AppState, GiphyAction>

    var body: some View {
        VStack {
            HStack {
                Button("spongebob") {
                    store.send(.search(query: "spongebob"))
                }
                Spacer()
                Button("clear") {
                    store.send(.clear)
                }
            }
            ForEach(store.state.giphies, id: \.name) { item in
                Text(item.name)
            }
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
