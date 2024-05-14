//
//  CoreDataStack.swift
//  codeChallengeYapeSwiftUI
//
//  Created by Sergio Luis Noriega Pita on 13/05/24.
//

import Foundation
import Combine
import CoreData

protocol DataProvider {
    var recipiesPublisher: Published<[RecipeEntity]>.Publisher { get }
    func saveRecipesToCoreData(_ recipes: [RecipeResponse])
    
}

class CoreDataStack {
    public var managedObjectContext: NSManagedObjectContext
    private var cancellables = Set<AnyCancellable>()
    @Published var recipiesList: [RecipeEntity] = []
    
    init(context: NSManagedObjectContext) {
        self.managedObjectContext = context
        publish()
    }
    
    private func allRecipiest() -> [RecipeEntity] {
        do {
            let fetchRequest : NSFetchRequest<RecipeEntity> = RecipeEntity.fetchRequest()
            return try self.managedObjectContext.fetch(fetchRequest)
        } catch let error as NSError {
            debugPrint("\(error), \(error.userInfo)")
            return []
        }
    }
    
    func saveRecipesToCoreData(_ recipes: [RecipeResponse]) {
        // Delete existing recipes
        let fetchRequest: NSFetchRequest<NSFetchRequestResult> = NSFetchRequest(entityName: "RecipeEntity")
        let deleteRequest = NSBatchDeleteRequest(fetchRequest: fetchRequest)
        _ = try? managedObjectContext.execute(deleteRequest)

        // Save new recipes
        for recipe in recipes {
            let recipeEntity = RecipeEntity(context: managedObjectContext)
            recipeEntity.nombre = recipe.nombre
            recipeEntity.imagenReceta = recipe.descripcion
            recipeEntity.descripcion = recipe.descripcion
            recipeEntity.latitudReceta = recipe.latitudImagen
            recipeEntity.longitudReceta = recipe.longitudImagen
        }

        // Save changes
        do {
            try managedObjectContext.save()
        } catch {
            print("Failed to save recipes to CoreData: \(error)")
        }
    }
    
    private func publish() {
        recipiesList = allRecipiest()
    }
}

extension CoreDataStack: DataProvider {
    var recipiesPublisher: Published<[RecipeEntity]>.Publisher {
        $recipiesList
    }
}
