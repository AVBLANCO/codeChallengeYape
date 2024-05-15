//
//  RecipeListViewModelTests.swift
//  codeChallengeYapeSwiftUITests
//
//  Created by Sergio Luis Noriega Pita on 15/05/24.
//

import XCTest
@testable import codeChallengeYapeSwiftUI

class RecipeListViewModelTests: XCTestCase {
    
    var viewModel: RecipeListViewModel!
    var context: NSManagedObjectContext!
    
    override func setUp() {
        super.setUp()
        context = CoreDataStack.shared.persistentContainer.newBackgroundContext()
        viewModel = RecipeListViewModel(context: context)
    }
    
    override func tearDown() {
        viewModel = nil
        context = nil
        super.tearDown()
    }
    
    func testFetchRecipes() {
        let expectation = XCTestExpectation(description: "Fetch recipes from network")
        viewModel.fetchRecipes()
        DispatchQueue.main.asyncAfter(deadline: .now() + 5) {
            XCTAssertFalse(self.viewModel.recipiesList.isEmpty, "La lista de recetas está vacía")
            expectation.fulfill()
        }
    
        wait(for: [expectation], timeout: 10.0)
    }
}
