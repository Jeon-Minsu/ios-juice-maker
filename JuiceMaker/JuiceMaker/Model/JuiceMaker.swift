//
//  JuiceMaker - JuiceMaker.swift
//  Created by 수꿍, 바드. 
//  Copyright © yagom academy. All rights reserved.
// 

import UIKit

// 쥬스 메이커 타입
struct JuiceMaker {
    let fruitStore = FruitStore()
    let center = NotificationCenter.default
    func make(_ juice: Juice) {
        do {
            try checkFruitAvailable(for: juice)
            try checkPossibilityOfMaking(juice)
              showSuccessAlert()
            
            
        } catch (let error) {
            fruitStore.handle(error)
        }
    }
    
    func showSuccessAlert() -> UIAlertController {
        let successAlert = UIAlertController(title: "쥬스 나왔습니다!\n맛있게 드세요!",
                                             message: "",
                                             preferredStyle: UIAlertController.Style.alert)
        
        successAlert.addAction(UIAlertAction(title: "OK",
                                             style: .default))
//        present(successAlert, animated: true)
        return successAlert
    }
    
    func checkFruitAvailable(for juice: Juice) throws {
        try fruitStore.goToWarehouse(of: fruitStore.checkFruitKind(_:), juice: juice)
    }
    
    func checkPossibilityOfMaking(_ juice: Juice) throws {
        try fruitStore.checkStock(function: fruitStore.reduceStock(fruit:amount:), juice: juice)
    }
}
