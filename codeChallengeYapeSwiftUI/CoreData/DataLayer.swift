//
//  DataLayer.swift
//  codeChallengeYapeSwiftUI
//
//  Created by Sergio Luis Noriega Pita on 13/05/24.
//

import Foundation
import Combine

class DataLayer {
    private let dataProvider: DataProvider
    private var cancellables = Set<AnyCancellable>()
    @Published var recipieList: [RecipeEntity] = []
    
    init(provider: DataProvider) {
        self.dataProvider = provider
        setup()
    }
    
    private func setup(){
        self.dataProvider.recipiesPublisher
            .assign(to: \.recipieList, on: self)
            .store(in: &cancellables)
    }
    
    func saveRecipiesFromEndPoint(_ recipies: [RecipeResponse]) {
        dataProvider.saveRecipesToCoreData(recipies)
    }
}
