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
        guard let url = URL(string: "https://66340f2a9bb0df2359a0a1b3.mockapi.io/recetas") else {
            print("URL inválida")
            return
        }

        URLSession.shared.dataTask(with: url) { [weak self] data, response, error in
            guard let self = self else { return }
            
            if let error = error {
                print("Error de red: \(error.localizedDescription)")
                return
            }
            
            guard let httpResponse = response as? HTTPURLResponse else {
                print("Respuesta de red inválida")
                return
            }
            
            guard (200...299).contains(httpResponse.statusCode) else {
                print("Error de servidor: Código de estado \(httpResponse.statusCode)")
                return
            }
            
            guard let data = data else {
                debugPrint("No se pudo obtener datos")
                return
            }
            
            if let jsonString = String(data: data, encoding: .utf8) {
               // debugPrint("JSON recibido: \(jsonString)")
            }

            do {
                let recipes = try JSONDecoder().decode([RecipeResponse].self, from: data)
                DispatchQueue.main.async {
                    // Save recipes to CoreData
                    debugPrint("response \(recipes)")
                    self.model.saveRecipiesFromEndPoint(recipes)
                }
            } catch {
                print("Error decodificando JSON: \(error)")
            }
        }.resume()
    }
}
