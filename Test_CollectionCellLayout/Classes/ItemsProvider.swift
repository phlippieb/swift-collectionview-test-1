//
//  ItemsProvider.swift
//  Test_CollectionCellLayout
//
//  Created by Phlippie Bosman on 2020/09/23.
//

import LoremIpsum

final class ItemsProvider {
    func getItems() -> [Item] {
        return (0..<20).map { _ in
            let headingWordCount = UInt(1 + arc4random_uniform(2))
            let heading = LoremIpsum.words(withNumber: headingWordCount)
            
            let bodyWordCount = UInt(5 + arc4random_uniform(20))
            let body = LoremIpsum.words(withNumber: bodyWordCount) + "$"
            
            return Item(
                heading: heading,
                body: body)
        }
    }
}
