//
//  Reducer.swift
//  Redux
//
//  Created by USER on 2022/10/01.
//

import Combine
import Foundation

struct Reducer<State, Action> {
    let reduce: (inout State, Action) async throws -> Void
}
