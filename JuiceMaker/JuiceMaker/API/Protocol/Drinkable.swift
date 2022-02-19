//
//  Drinkable.swift
//  JuiceMaker
//
//  Created by 박형석 on 2022/02/19.
//

import Foundation

protocol Drinkable {
    var name: String { get }
    var recipe: [Material] { get }
}