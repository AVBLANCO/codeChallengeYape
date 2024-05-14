//
//  RecipeListModel.swift
//  codeChallengeYapeSwiftUI
//
//  Created by Sergio Luis Noriega Pita on 13/05/24.
//

import Foundation

struct RecipeResponse: Decodable {
    let id : Int?
    let nombre: String?
    let imagen: String?
    let descripcion: String?
    let latitudImagen: String?
    let longitudImagen: String?
    
    enum CodingKeys: String, CodingKey {
        case id
        case nombre
        case imagen
        case descripcion
        case latitudImagen
        case longitudImagen
    }
}
