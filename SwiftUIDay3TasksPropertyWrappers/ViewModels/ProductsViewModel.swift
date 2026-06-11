//
//  ItemViewModel.swift
//  SwiftUIDay3TasksPropertyWrappers
//
//  Created by Mina_Wagdy on 10/06/2026.
//

import Observation
import SwiftData
import SwiftUI

@Observable
class ProductsViewModel {
    private var itemList: [Item] = []
    private var shoppingItems: [ShoppingItemEntity] = []
    private let modelContext: ModelContext
    init(modelContext: ModelContext) {
        self.modelContext = modelContext
        loadData()
    }
    var items: [Item] {
        itemList
    }
    
    func loadData() {
        do {
            let entites = try modelContext.fetch(
                FetchDescriptor<ShoppingItemEntity>())
            itemList = entites.map {
                $0.toDomain()
            }
        } catch {
            print(error.localizedDescription)

        }
    }
    func canAddItem(newItemName: String) -> Bool {
        if validateItemName(of: newItemName) {
            let itemToBeAdded = Item(name: newItemName)
            let item = Item(name: itemToBeAdded.name)
            modelContext.insert(item.toEntity())
            itemList.append(itemToBeAdded)
            print("Item added: \(itemToBeAdded.name)")
            return true
        }

        return false
    }
    func removeItem(at indexSet: IndexSet) {
        for index in indexSet {
            let itemToRemove = itemList[index]
            let name = itemToRemove.name
            let descriptor = FetchDescriptor<ShoppingItemEntity>(
                predicate: #Predicate {
                    $0.name == name
                }
            )
            guard let entity = try? modelContext.fetch(descriptor).first else {
                print("Failed to find entity for item: \(itemToRemove.name)")
                return
            }
            modelContext.delete(entity)
            itemList.remove(at: index)
            print("Item removed at index: \(indexSet)")
        }
    }
    func validateItemName(of itemName: String) -> Bool {
        let trimmedName = itemName.trimmingCharacters(
            in: .whitespacesAndNewlines
        )
        guard !trimmedName.isEmpty else {
            print("Item name cannot be empty.")
            return false
        }
        return true
    }
}
