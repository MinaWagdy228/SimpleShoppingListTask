//
//  AddItemSubView.swift
//  SwiftUIDay3TasksPropertyWrappers
//
//  Created by Mina_Wagdy on 10/06/2026.
//

import SwiftUI

struct AddItemSubView: View {
    @Binding var productsViewModel: ProductsViewModel
    @State private var itemToAdd: String = ""
    @State private var showAlert = false
    var body: some View {
        HStack {
            TextField("Add item...", text: $itemToAdd)
            Spacer()
            Button(action: {
                showAlert = !productsViewModel.canAddItem(newItemName: itemToAdd)
                itemToAdd = ""
            }) {
                Image(systemName: "plus")
            }.alert("Invalid item name", isPresented: $showAlert){
                Button("OK", role: .cancel) {
                    showAlert = false
                }
            }
        }
    }
}
//#Preview {
//    AddItemSubView()
//}
