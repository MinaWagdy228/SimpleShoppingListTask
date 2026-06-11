//
//  ShoppingItem.swift
//  SwiftUIDay3TasksPropertyWrappers
//
//  Created by Mina_Wagdy on 11/06/2026.
//

import Foundation
import SwiftData

@Model
final class ShoppingItemEntity {
    @Attribute(.unique) var name: String
    init(name: String) {
        self.name = name
    }
}
