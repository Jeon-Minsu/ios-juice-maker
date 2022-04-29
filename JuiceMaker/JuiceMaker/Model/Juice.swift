//
//  Juice.swift
//  JuiceMaker
//
//  Created by 수꿍, 바드 on 2022/04/26.
//

enum Juice {
    case strawberry
    case banana
    case pineapple
    case kiwi
    case strawberryBanana
    case mango
    case mangoKiwi
}

extension Juice {
    var name: String {
        switch self {
        case .strawberry:
            return "딸기 쥬스"
        case .banana:
            return "바나나 쥬스"
        case .pineapple:
            return "파인애플 쥬스"
        case .kiwi:
            return "키위 쥬스"
        case .strawberryBanana:
            return "딸바 쥬스"
        case .mango:
            return "망고 쥬스"
        case .mangoKiwi:
            return "망키 쥬스"
        }
    }
}
