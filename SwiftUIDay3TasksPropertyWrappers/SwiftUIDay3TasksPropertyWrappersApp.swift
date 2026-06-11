//
//  SwiftUIDay3TasksPropertyWrappersApp.swift
//  SwiftUIDay3TasksPropertyWrappers
//
//  Created by Mina_Wagdy on 10/06/2026.
//

import SwiftData
import SwiftUI

@main
struct SwiftUIDay3TasksPropertyWrappersApp: App {
    private let container: ModelContainer = {
        try! ModelContainer(for: ShoppingItemEntity.self)
    }()
    var body: some Scene {
        WindowGroup {
            ProductListView(
                modelContext: container.mainContext
            )
        }
    }
}
