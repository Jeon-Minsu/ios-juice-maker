//
//  JuiceMaker - ViewController.swift
//  Created by 수꿍, 바드. 
//  Copyright © yagom academy. All rights reserved.
// 

import UIKit

let center = NotificationCenter.default
let juiceMaker = JuiceMaker()

class ViewController: UIViewController {
    

    

    @IBOutlet weak var strawberryLabel: UILabel?
    @IBOutlet weak var bananaLabel: UILabel?
    @IBOutlet weak var pineappleLabel: UILabel?
    @IBOutlet weak var kiwiLabel: UILabel?
    @IBOutlet weak var mangoLabel: UILabel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        updateFruitStock()
        center.addObserver(self, selector: #selector(update), name: .changeStock, object: nil)
    }
    
    @objc func update(_ notification: Notification) {
//        strawberryLabel?.text = controller.text1
        print("success")
        
        guard let userinfo = notification.userInfo else {
            return
        }
        guard let kind = userinfo["종류"] as? Fruit else {
            return
        }
        
        print(kind)
        

        guard let stock = userinfo["재고"] as? String else {
            return
        }

        print(stock)
        
        try? juiceMaker.fruitStore.changeStock(fruit: kind, amount: Int(stock) ?? 0)
        
        var label: UILabel {
            switch kind {
            case .strawberry:
                return strawberryLabel!
            case .banana:
                return bananaLabel!
            case .pineapple:
                return pineappleLabel!
            case .kiwi:
                return kiwiLabel!
            case .mango:
                return mangoLabel!
            }
        }
        
        label.text = String(juiceMaker.fruitStore.fruitWarehouse[kind] ?? 0)
    }
    
    func updateFruitStock() {
        strawberryLabel?.text = String(juiceMaker.fruitStore.fruitWarehouse[.strawberry] ?? 0)
        bananaLabel?.text = String(juiceMaker.fruitStore.fruitWarehouse[.banana] ?? 0)
        pineappleLabel?.text = String(juiceMaker.fruitStore.fruitWarehouse[.pineapple] ?? 0)
        kiwiLabel?.text = String(juiceMaker.fruitStore.fruitWarehouse[.kiwi] ?? 0)
        mangoLabel?.text = String(juiceMaker.fruitStore.fruitWarehouse[.mango] ?? 0)
    }
    
    @IBAction func makeJuiceButton(_ sender: UIButton) {
        guard let juice = Juice(rawValue: sender.currentTitle ?? "") else { return }
        
        make(juice)
        updateFruitStock()
    }
    
    private func make(_ juice: Juice) {
        do {
            try juiceMaker.checkFruitAvailable(for: juice)
            try juiceMaker.checkPossibilityOfMaking(juice)
            showSuccessAlert(juice)
        } catch (let error) {
            juiceMaker.fruitStore.handle(error)
            showFailAlert()
        }
    }

    private func showSuccessAlert(_ juice: Juice) {
        let successAlert = UIAlertController(title: "\(juice.name) 쥬스 나왔습니다!\n 맛있게 드세요!",
                                             message: nil,
                                             preferredStyle: .alert)

        let ok = UIAlertAction(title: "확인", style: .default, handler: nil)

        successAlert.addAction(ok)

        present(successAlert, animated: true)
    }
    
    private func showFailAlert() {
        let failAlert = UIAlertController(title: "재료가 모자라요.\n 재고를 수정할까요?",
                                          message: nil,
                                          preferredStyle: .alert)
        let no = UIAlertAction(title: "아니오", style: .cancel)
        let yes = UIAlertAction(title: "예", style: .default) { action in
            guard let editMenu = self.storyboard?.instantiateViewController(withIdentifier: "FruitStockViewController") else { return }
            
            self.navigationController?.pushViewController(editMenu, animated: true)
        }
        failAlert.addAction(no)
        failAlert.addAction(yes)
        present(failAlert, animated: true)
    }
    
    @IBAction func editStock(_ sender: UIBarButtonItem) {
        guard let controller = self.storyboard?.instantiateViewController(withIdentifier: "FruitStockViewController") as? FruitStockViewController else { return }
        
        controller.text1 = strawberryLabel?.text ?? ""
        controller.text2 = bananaLabel?.text ?? ""
        controller.text3 = pineappleLabel?.text ?? ""
        controller.text4 = kiwiLabel?.text ?? ""
        controller.text5 = mangoLabel?.text ?? ""
        
        self.navigationController?.pushViewController(controller, animated: true)
    
        
    }
    
}

extension Notification.Name {
    static let changeStock = Notification.Name("changeStock")
}
