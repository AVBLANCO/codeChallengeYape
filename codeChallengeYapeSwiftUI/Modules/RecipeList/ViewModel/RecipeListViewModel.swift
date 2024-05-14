//
//  RecipeListViewModel.swift
//  codeChallengeYapeSwiftUI
//
//  Created by Sergio Luis Noriega Pita on 13/05/24.
//

import Foundation
import CoreData

class RecipeListViewModel: ObservableObject {
    private let model: DataLayer
    private var managedObjectContext: NSManagedObjectContext
    @Published var recipes: [RecipeEntity] = []
    
    init(context: NSManagedObjectContext) {
        self.managedObjectContext = context
        self.model = DataLayer(provider: CoreDataStack(context: context))
        fetchRecipes()
    }
    
    func fetchRecipes() {
        guard let url = URL(string: "https://66340f2a9bb0df2359a0a1b3.mockapi.io/recetas") else { return }

        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data else { return }
            do {
                let recipes = try JSONDecoder().decode([RecipeResponse].self, from: data)
                //debugPrint("REsponse \(recipes)")
                DispatchQueue.main.async {
                    // Save recipes to CoreData
                    self.model.saveRecipiesFromEndPoint(recipes)
                }
            } catch {
                print("Error decoding JSON: \(error)")
            }
        }.resume()
    }


}
