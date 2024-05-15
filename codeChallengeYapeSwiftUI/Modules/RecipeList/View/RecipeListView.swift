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

    var body: some View {
        NavigationView {
            List(viewModel.recipes, id: \.id) { recipe in
                NavigationLink(destination: DetailView(recipe: recipe)) {
                    RecipeRow(recipe: recipe)
                }
            }
            .navigationBarTitle("Recetas")
            .onAppear {
                viewModel.fetchRecipes()
            }
        }
    }
}

struct RecipeRow: View {
    @StateObject private var imageLoader = ImageLoader()
    var recipe: RecipeEntity

    var body: some View {
        HStack {
            AsyncImage(url: recipe.imagenReceta ?? "")
                .frame(width: 100, height: 100)
                .cornerRadius(8)
            
            VStack(alignment: .leading) {
                Text(recipe.nombre ?? "")
                    .font(.headline)
                Text(recipe.descripcion ?? "")
                    .font(.subheadline)
                    .foregroundColor(.gray)
            }
            .padding(.leading, 8)
            
            Spacer()
        }
        .padding(8)
    }
}

struct AsyncImage: View {
    @ObservedObject private var imageLoader: ImageLoader
    var url: String
    
    init(url: String) {
        self.url = url
        _imageLoader = ObservedObject(wrappedValue: ImageLoader())
        if let imageUrl = URL(string: url) {
            imageLoader.loadImage(from: imageUrl)
        }
    }
    
    var body: some View {
        if let image = imageLoader.image {
            Image(uiImage: image)
                .resizable()
                .scaledToFit()
        } else {
            Image(systemName: "photo")
                .resizable()
                .scaledToFit()
        }
    }
}

class ImageLoader: ObservableObject {
    @Published var image: UIImage?
    @Published var error: Error?
    
    func loadImage(from url: URL) {
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                DispatchQueue.main.async {
                    self.error = error
                }
                return
            }
            guard let data = data else {
                DispatchQueue.main.async {
                    self.error = NSError(domain: "com.example.ImageLoader", code: -1,
                                         userInfo: [NSLocalizedDescriptionKey: "No data received"])
                }
                return
            }
            DispatchQueue.main.async {
                self.image = UIImage(data: data)
            }
        }.resume()
    }
}


