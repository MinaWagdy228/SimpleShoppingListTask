//
//  Mapper.swift
//  SwiftUIDay3TasksPropertyWrappers
//
//  Created by Mina_Wagdy on 11/06/2026.
//

import Foundation

extension Item {
    func toEntity() -> ShoppingItemEntity {
        return ShoppingItemEntity(name: name)
    }
}

extension ShoppingItemEntity {
    func toDomain() -> Item {
        return Item(name: name)
    }
}
