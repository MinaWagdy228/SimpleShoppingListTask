//
//  ItemListSubView.swift
//  SwiftUIDay3TasksPropertyWrappers
//
//  Created by Mina_Wagdy on 10/06/2026.
//

import SwiftUI

struct ItemListSubView: View {
    @Binding var productsViewModel: ProductsViewModel
    @State private var indexSetToDelete: IndexSet?
    @State private var showAlert: Bool = false
    @State private var selectedItem: Item?
    let columns = [
        GridItem(.flexible()),
        GridItem(.flexible()),
    ]
    var body: some View {
        ScrollView {
            VStack {
                LazyVGrid(columns: columns) {
                    ForEach(productsViewModel.items, id: \.id) { item in
                        ItemRow(
                            item: item,
                            onDelete: {
                                selectedItem = item
                                showAlert = true
                            }
                        )
                    }
                }.alert("Delete Item?", isPresented: $showAlert) {
                    Button("Delete", role: .destructive) {
                        guard let item = selectedItem,
                            let index = productsViewModel.items.firstIndex(
                                where: { $0.id == item.id })
                        else { return }

                        productsViewModel.removeItem(
                            at: IndexSet(integer: index))
                    }
                    Button("Cancel", role: .cancel) {
                        indexSetToDelete = nil
                    }
                } message: {
                    Text("Are you sure you want to delete this item?")
                }
            }
        }
    }
}

//#Preview {
//    ItemListSubView()
//}
