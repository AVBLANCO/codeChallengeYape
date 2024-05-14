//
//  RecipeListView.swift
//  codeChallengeYapeSwiftUI
//
//  Created by Sergio Luis Noriega Pita on 13/05/24.
//

import SwiftUI
import Combine
import CoreData

struct RecipeListView: View {
    @ObservedObject var viewModel: RecipeListViewModel

    init(viewModel: RecipeListViewModel) {
        self.viewModel = viewModel
    }

    var body: some View {
        NavigationView {
            List(viewModel.recipes) { recipe in
                Text(recipe.nombre ?? "")
            }
            .navigationBarTitle("Recetas")
        }
    }
}


