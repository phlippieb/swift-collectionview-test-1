//
//  Item.swift
//  Test_CollectionCellLayout
//
//  Created by Phlippie Bosman on 2020/09/23.
//

import Foundation

struct Item {
    init(heading: String) {
        self.id = .init()
        self.heading = heading
    }
    
    let id: UUID
    let heading: String
}
