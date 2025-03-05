//
//  MovieList_NomisoApp.swift
//  MovieList_Nomiso
//
//  Created by Hari Krishna on 05/03/25.
//

import SwiftUI

@main
struct MovieList_NomisoApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            MovieListView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
