//
//  StockError.swift
//  JuiceMaker
//
//  Created by 김동용 on 2022/04/26.
//

enum StockError: Error {
    case invalidSelection
    case outOfStock
}

extension StockError {
    var message: String {
        switch self {
        case .invalidSelection:
            return "해당 상품이 없습니다"
        case .outOfStock:
            return "재고가 부족합니다"
        }
    }
}