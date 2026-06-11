//
//  ItemRow.swift
//  SwiftUIDay3TasksPropertyWrappers
//
//  Created by Mina_Wagdy on 10/06/2026.
//

import SwiftUI

struct ItemRow: View {
    var item : Item
    var body: some View {
        HStack{
            Text(item.name)
                .font(.title2)
                .padding()
            
        }
    }
}

//#Preview {
//    ItemRow()
//}
