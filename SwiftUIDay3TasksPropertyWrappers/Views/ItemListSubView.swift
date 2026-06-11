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

    var body: some View {
        VStack {
            List {
                ForEach(productsViewModel.items, id: \.id) { item in
                    ItemRow(item: item)
                }.onDelete(perform: { indexSet in
                    indexSetToDelete = indexSet
                    showAlert = true
                })
            }.alert("Delete Item?", isPresented: $showAlert) {
                Button("Delete", role: .destructive) {
                    guard let indexSetToDelete = indexSetToDelete else {
                        return
                    }
                    productsViewModel.removeItem(at: indexSetToDelete)
                    self.indexSetToDelete = nil
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

//#Preview {
//    ItemListSubView()
//}
