//
//  FruitStockViewController.swift
//  JuiceMaker
//
//  Created by 전민수 on 2022/05/03.
//

import UIKit



class FruitStockViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
//        updateFruitStock()
        
        setMessage()
        synchronizeStock()
    }
    
    @IBOutlet weak var strawberryLabel: UILabel!
    @IBOutlet weak var bananaLabel: UILabel!
    @IBOutlet weak var pineappleLabel: UILabel!
    @IBOutlet weak var kiwiLabel: UILabel!
    @IBOutlet weak var mangoLabel: UILabel!
    
    @IBOutlet weak var strawberryStepper: UIStepper!
    @IBOutlet weak var bananaStepper: UIStepper!
    @IBOutlet weak var pineappleStepper: UIStepper!
    @IBOutlet weak var kiwiStepper: UIStepper!
    @IBOutlet weak var mangoStepper: UIStepper!
    
    var text1 = ""
    var text2 = ""
    var text3 = ""
    var text4 = ""
    var text5 = ""
    
    
    func setMessage() {
        strawberryLabel.text = text1
        bananaLabel.text = text2
        pineappleLabel.text = text3
        kiwiLabel.text = text4
        mangoLabel.text = text5
    }
    
    func synchronizeStock() {
        strawberryStepper.value = Double(Int(juiceMaker.fruitStore.fruitWarehouse[.strawberry] ?? 0))
        bananaStepper.value = Double(Int(juiceMaker.fruitStore.fruitWarehouse[.banana] ?? 0))
        pineappleStepper.value = Double(Int(juiceMaker.fruitStore.fruitWarehouse[.pineapple] ?? 0))
        kiwiStepper.value = Double(Int(juiceMaker.fruitStore.fruitWarehouse[.kiwi] ?? 0))
        mangoStepper.value = Double(Int(juiceMaker.fruitStore.fruitWarehouse[.mango] ?? 0))
    }
    
    @IBAction func strawberryStockStepper(_ sender: UIStepper) {
        guard let fruit = Fruit(rawValue: sender.tag) else { return }
        
        var label: UILabel {
            switch fruit {
            case .strawberry:
                return strawberryLabel
            case .banana:
                return bananaLabel
            case .pineapple:
                return pineappleLabel
            case .kiwi:
                return kiwiLabel
            case .mango:
                return mangoLabel
            }
        }
//        strawberryLabel.text = String((juiceMaker.fruitStore.fruitWarehouse[.strawberry] ?? 0) + Int(sender.value))
        
        label.text = String(Int(sender.value))
        center.post(name: .changeStock, object: nil, userInfo: ["종류": fruit, "재고": label.text])
    }
    
    @IBAction func bananaStockStepper(_ sender: UIStepper) {
        
    }
    
    @IBAction func pineappleStockStepper(_ sender: UIStepper) {
        
    }
    
    @IBAction func kiwiStockStepper(_ sender: UIStepper) {
        
    }
    
    @IBAction func mangoStockStepper(_ sender: UIStepper) {
        
    }
    
//    func updateFruitStock() {
//        strawberryLabel?.text = String(juiceMaker.fruitStore.fruitWarehouse[.strawberry] ?? 0)
//        bananaLabel?.text = String(juiceMaker.fruitStore.fruitWarehouse[.banana] ?? 0)
//        pineappleLabel?.text = String(juiceMaker.fruitStore.fruitWarehouse[.pineapple] ?? 0)
//        kiwiLabel?.text = String(juiceMaker.fruitStore.fruitWarehouse[.kiwi] ?? 0)
//        mangoLabel?.text = String(juiceMaker.fruitStore.fruitWarehouse[.mango] ?? 0)
//    }
    
    
//    extension Fruit {
//        var label: UILabel {
//            switch self {
//            case .strawberry:
//                return strawberryLabel
//            case .banana:
//                return bananaLabel
//            case .pineapple:
//                return pineappleLabel
//            case .kiwi:
//                return kiwiLabel
//            case .mango:
//                return mangoLabel
//            }
//        }
//    }
}
