//
//  ContentView.swift
//  SwiftUIDay3TasksPropertyWrappers
//
//  Created by Mina_Wagdy on 10/06/2026.
//

import SwiftData
import SwiftUI

struct ProductListView: View {
    @Environment(\.modelContext) private var modelContext
    @State var productsViewModel: ProductsViewModel
    init(modelContext: ModelContext) {
        _productsViewModel = State(
            initialValue: ProductsViewModel(
                modelContext: modelContext
            )
        )
    }
    var body: some View {
        VStack {
            Text("Shopping List")
                .font(.largeTitle)
            Divider()
                .frame(width: 250, height: 16, alignment: .center)
            AddItemSubView(productsViewModel: $productsViewModel)
            Divider().padding(.bottom, 32).frame(width: 250)
            ItemListSubView(productsViewModel: $productsViewModel)
        }
        .padding()
    }
}

//#Preview {
//    ProductListView(modelContext: modelContxt)
//}
