//
//  JuiceMaker - ViewController.swift
//  Created by 수꿍, 바드. 
//  Copyright © yagom academy. All rights reserved.
// 

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        navigationController?.navigationBar.topItem?.rightBarButtonItem?.title = "재고수정" // 이름 코드로 바꾸기
        navigationController?.navigationBar.topItem?.backButtonTitle = "뒤로가기"   // 두번째 뷰에서 backButton 타이틀 설정
        updateFruitStock()
    
        
    }
    
    private let someJuiceMaker = JuiceMaker()
    let center = NotificationCenter.default     // 센터 설정
    
    @IBOutlet weak var strawberryStockLabel: UILabel!
    @IBOutlet weak var bananaStockLabel: UILabel!
    @IBOutlet weak var pineappleStockLabel: UILabel!
    @IBOutlet weak var kiwiStockLabel: UILabel!
    @IBOutlet weak var mangoStockLabel: UILabel!
    
    @IBAction func makeStrawberryBananaJuiceButton(_ sender: Any) {
        someJuiceMaker.make(.strawberryBanana)
        updateFruitStock()
        
//        present(someJuiceMaker.showSuccessAlert(), animated: true)
       
        }
        
        
    
    
    @IBAction func makeMangoKiwiJuiceButton(_ sender: Any) {
        someJuiceMaker.make(.mangoKiwi)
        updateFruitStock()
        
    }
    
    @IBAction func makeStrawberryJuiceButton(_ sender: Any) {
        someJuiceMaker.make(.strawberry)
        updateFruitStock()
    }
    
    @IBAction func makeBananJuiceButton(_ sender: Any) {
        someJuiceMaker.make(.banana)
        updateFruitStock()
    }
    
    @IBAction func makePineappleJuiceButton(_ sender: Any) {
        someJuiceMaker.make(.pineapple)
        updateFruitStock()
    }
    
    @IBAction func makeKiwiJuiceButton(_ sender: Any) {
        someJuiceMaker.make(.kiwi)
        updateFruitStock()
    }
    
    @IBAction func makeMangoJuiceButton(_ sender: Any) {
        someJuiceMaker.make(.mangoKiwi)
        updateFruitStock()
    }
    
    // 쥬스 다 못 묶음?
    @IBAction func makeJuice(_ sender: Any) {
//        post(<#T##fruit: Fruit##Fruit#>)
    }
    
    // viewController 각 재고 레이블 업데이트 해주는 함수
    func updateFruitStock() {
        strawberryStockLabel.text = String(someJuiceMaker.fruitStore.fruitWarehouse[.strawberry]!)
        bananaStockLabel.text = String(someJuiceMaker.fruitStore.fruitWarehouse[.banana]!)
        pineappleStockLabel.text = String(someJuiceMaker.fruitStore.fruitWarehouse[.pineapple]!)
        kiwiStockLabel.text = String(someJuiceMaker.fruitStore.fruitWarehouse[.kiwi]!)
        mangoStockLabel.text = String(someJuiceMaker.fruitStore.fruitWarehouse[.mango]!)
    }
    
    
    func make(_ juice: Juice, _ notification: NSNotification) {
        do {
            try someJuiceMaker.checkFruitAvailable(for: juice)
            try someJuiceMaker.checkPossibilityOfMaking(juice)
            showSuccessAlert()
        } catch (let error) {
            someJuiceMaker.fruitStore.handle(error)
            showFailAlert()
        }
    }
    
    func post(_ fruit: Fruit) {
        center.post(name: .makeJuice,
                    object: someJuiceMaker,
                    userInfo: [fruit : someJuiceMaker.fruitStore.fruitWarehouse[fruit.self]!])
    }
    
    func observe() {
        center.addObserver(self,
                           selector: #selector(makeJuice(_:)),
                           name: .makeJuice,
                           object: nil)
    }
    
    // 쥬스를 만들 때 얼럿
    func showSuccessAlert() {
        let successAlert = UIAlertController(title: "쥬스 나왔습니다!\n맛있게 드세요!",
                                             message: "",
                                             preferredStyle: UIAlertController.Style.alert)
        
        successAlert.addAction(UIAlertAction(title: "OK",
                                             style: .default))
        present(successAlert, animated: true)
    }
    
    // 쥬스를 못만들 때 얼럿
    func showFailAlert() {
        let failAlert = UIAlertController(title: "재료가 모자라요.\n재고를 수정할까요?",
                                          message: nil, preferredStyle: UIAlertController.Style.alert)
        failAlert.addAction(UIAlertAction(title: "아니오",
                                          style: .destructive))

        let yes = UIAlertAction(title: "예", style: .default) { action in
            if let editMenu = self.storyboard?.instantiateViewController(withIdentifier: "FruitStockViewController") {
                self.navigationController?.pushViewController(editMenu, animated: true)
            }
        }
        failAlert.addAction(yes)
        present(failAlert, animated: true)
        }
}
