//
//  codeChallengeYapeSwiftUIApp.swift
//  codeChallengeYapeSwiftUI
//
//  Created by Sergio Luis Noriega Pita on 2/05/24.
//

import SwiftUI
import CoreData

@main
struct codeChallengeYapeSwiftUIApp: App {
    let persistenceController = PersistenceController.shared
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
    
    var body: some Scene {
        WindowGroup {
            let context = persistenceController.container.viewContext
            let viewModel = RecipeListViewModel(context: context) // Aquí creamos el ViewModel
            RecipeListView(viewModel: viewModel) // Pasamos el ViewModel a la vista
                .environment(\.managedObjectContext, context)

        }
    }
}
