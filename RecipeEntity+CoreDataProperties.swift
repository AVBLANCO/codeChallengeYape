//
//  RecipeEntity+CoreDataProperties.swift
//  codeChallengeYapeSwiftUI
//
//  Created by Sergio Luis Noriega Pita on 13/05/24.
//
//

import Foundation
import CoreData


extension RecipeEntity {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<RecipeEntity> {
        return NSFetchRequest<RecipeEntity>(entityName: "RecipeEntity")
    }

    @NSManaged public var descripcion: String?
    @NSManaged public var id: Int32
    @NSManaged public var imagenReceta: String?
    @NSManaged public var latitudReceta: String?
    @NSManaged public var longitudReceta: String?
    @NSManaged public var nombre: String?

}

extension RecipeEntity : Identifiable {

}
