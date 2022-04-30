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
    }
    
    @IBOutlet weak var strawberryStockButton: UILabel!
    @IBOutlet weak var bananaStockButton: UILabel!
    @IBOutlet weak var pineappleStockButton: UILabel!
    @IBOutlet weak var kiwiStockButton: UILabel!
    @IBOutlet weak var mangoStockButton: UILabel!
    
    @IBAction func makeStrawberryBananaJuiceButton(_ sender: Any) {
    }
    
    @IBAction func makeMangoKiwiJuiceButton(_ sender: Any) {
    }
    
    @IBAction func makeStrawberryJuiceButton(_ sender: Any) {
    }
    
    @IBAction func makeBananJuiceButton(_ sender: Any) {
    }
    
    @IBAction func makePineappleJuiceButton(_ sender: Any) {
    }
    
    @IBAction func makeKiwiJuiceButton(_ sender: Any) {
    }
    
    @IBAction func makeMangoJuiceButton(_ sender: Any) {
    }
    
    
}

