//
//  ContentView.swift
//  codeChallengeYapeSwiftUI
//
//  Created by Sergio Luis Noriega Pita on 2/05/24.
//

import SwiftUI
import CoreData

struct ContentView: View {
    @ObservedObject var viewModel: RecipeListViewModel
    
    init() {
        let context = PersistenceController.shared.container.viewContext
        self.viewModel = RecipeListViewModel(context: context)
    }

    var body: some View {
        NavigationView {
            List {
                Text("Recetas")
            }
            NavigationLink(destination: RecipeListView(viewModel: viewModel)) {
                Text("Ver Recetas")
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
