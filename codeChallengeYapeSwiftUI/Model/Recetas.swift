//
//  Recetas.swift
//  codeChallengeYapeSwiftUI
//
//  Created by Sergio Luis Noriega Pita on 2/05/24.
//

import Foundation
import CoreData

class Recetas: NSManagedObject {
    @NSManaged public var id : UUID
    @NSManaged public var nombre : String
    @NSManaged public var imagenReceta : Data
    @NSManaged public var descripcion : String
    @NSManaged public var latitudReceta : String
    @NSManaged public var longitudReceta : String
    
}
