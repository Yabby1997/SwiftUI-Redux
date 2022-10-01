//
//  AppReducer.swift
//  Redux
//
//  Created by USER on 2022/10/01.
//

import Foundation
import URLRequestDataSourceLayer
import GiphyDataLayer
import GiphyDomainLayer

extension Reducer where State == AppState, Action == GiphyAction {
    static func giphyReducer() -> Reducer {
        let networkService = URLRequestBuilderNetworkService()
        let giphyRepository = GiphyRepository(
            apiKey: "rEDEvI1fNspJPNdMNscfdzwLsC3zZRx5",
            networkService: networkService
        )
        let giphyUseCase = GiphyUseCase(repository: giphyRepository)

        return Reducer { state, action in
            switch action {
            case let .search(query):
                state.giphies = try await giphyUseCase.search(query: query)
            case .clear:
                state.giphies = []
            }
        }
    }
}
