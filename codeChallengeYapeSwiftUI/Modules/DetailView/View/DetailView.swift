//
//  DetailView.swift
//  codeChallengeYapeSwiftUI
//
//  Created by Sergio Luis Noriega Pita on 13/05/24.
//

import SwiftUI

struct DetailView: View {
    let recipe: RecipeEntity

    var body: some View {
        VStack {
            Text(recipe.nombre ?? "")
            Text(recipe.descripcion ?? "")
            // Aquí puedes mostrar la imagen utilizando una URL
            // También puedes agregar un botón para la pantalla de mapa
        }
        .navigationBarTitle(recipe.nombre ?? "")
    }
}
