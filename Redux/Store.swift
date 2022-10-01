//
//  Store.swift
//  Redux
//
//  Created by USER on 2022/10/01.
//

import Combine
import Foundation

final class Store<State, Action>: ObservableObject {
    @Published private(set) var state: State
    
    private let reducer: Reducer<State, Action>

    init(initialState: State, reducer: Reducer<State, Action>) {
        self.state = initialState
        self.reducer = reducer
    }

    func send(_ action: Action) {
        DispatchQueue.main.async { [weak self] in
            guard let self else { return }
            Task {
                try await self.reducer.reduce(&self.state, action)
            }
        }
    }
}
