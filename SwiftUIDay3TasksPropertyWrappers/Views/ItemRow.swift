//
//  ItemRow.swift
//  SwiftUIDay3TasksPropertyWrappers
//
//  Created by Mina_Wagdy on 10/06/2026.
//

import SwiftUI

struct ItemRow: View {
    var item: Item
    let onDelete: () -> Void
    var body: some View {
        HStack {
            Text(item.name)
                .font(.title2)
                .padding()
            Spacer()
            Button {
                onDelete()
            } label: {
                Image(systemName: "trash.fill")
                    .frame(width: 30, height: 30)
                    .background(.red)
                    .foregroundColor(Color(.white))
                    .clipShape(Circle())

            }
        }
    }
}

//#Preview {
//    ItemRow()
//}
