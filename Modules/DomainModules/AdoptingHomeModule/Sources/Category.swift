//
//  Category.swift
//  AdoptingHomeModule
//
//  Created by engin gülek on 13.11.2023.
//

import Foundation

struct Category {
    let id : Int
    let name : String
    
    static var exampleCategory : [Category] = [
        .init(id: 0, name: "Dog"),
        .init(id: 1, name: "Cat"),
        .init(id: 2, name: "Bird"),
        .init(id: 3, name: "Lizards")
    ]
}
