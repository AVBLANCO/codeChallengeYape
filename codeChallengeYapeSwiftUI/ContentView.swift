//
//  ContentView.swift
//  codeChallengeYapeSwiftUI
//
//  Created by Sergio Luis Noriega Pita on 2/05/24.
//

import SwiftUI
import CoreData

struct ContentView: View {
   
    var body: some View {
        NavigationView {
            List {
                Text("Recetas")
            }
            NavigationLink(destination: AddRecipiesView()) {
//                Image(systemName: String)
            }
        }
    }


}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
