//
//  ItemViewModel.swift
//  SwiftUIDay3TasksPropertyWrappers
//
//  Created by Mina_Wagdy on 10/06/2026.
//

import Observation
import SwiftUI

@Observable
class ProductsViewModel {
    private var itemList: [Item] = []
    var items: [Item] {
        itemList
    }

    func canAddItem(newItemName: String) -> Bool {
        let trimmedName = newItemName.trimmingCharacters(
            in: .whitespacesAndNewlines
        )
        guard !trimmedName.isEmpty else {
            print("Item name cannot be empty.")
            return false
        }
        let itemToBeAdded = Item(name: trimmedName)
        itemList.append(itemToBeAdded)
        print("Item added: \(itemToBeAdded.name)")
        return true
    }
    func removeItem(at indexSet: IndexSet) {
        itemList.remove(atOffsets: indexSet)
        print("Item removed at index: \(indexSet)")
    }
}
