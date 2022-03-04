//
//  JuiceMaker - ViewController.swift
//  Created by safari and Red.
//  Copyright © yagom academy. All rights reserved.
// 

import UIKit

class ViewController: UIViewController {
    private var juiceMaker = JuiceMaker()
    
    @IBOutlet weak var strawberryLabel: UILabel!
    @IBOutlet weak var bananaLabel: UILabel!
    @IBOutlet weak var pineappleLabel: UILabel!
    @IBOutlet weak var kiwiLabel: UILabel!
    @IBOutlet weak var magoLabel: UILabel!
    
    @IBOutlet weak var strawberryJuiceButton: UIButton!
    @IBOutlet weak var bananaJuiceButton: UIButton!
    @IBOutlet weak var pineappleJuiceButton: UIButton!
    @IBOutlet weak var kiwiJuiceButton: UIButton!
    @IBOutlet weak var mangoJuiceButton: UIButton!
    @IBOutlet weak var strawberryAndBananaJuiceButton: UIButton!
    @IBOutlet weak var mangoAndKiwiJuiceButton: UIButton!
    
    @IBAction func orderJuice(with button: UIButton) {
        guard let juice = matchJuice(with: button) else { return }
        if juiceMaker.canMake(of: juice) {
            showSuccessAlert(with: juice.koreanName)
        } else {
            showFailureAlert()
        }
    }
    
    private func matchJuice(with button: UIButton) -> Juice? {
        switch button {
        case strawberryJuiceButton:
            return .strawberryJuice
        case bananaJuiceButton:
            return .bananaJuice
        case pineappleJuiceButton:
            return .pineappleJuice
        case kiwiJuiceButton:
            return .kiwiJuice
        case mangoJuiceButton:
            return .mangoJuice
        case strawberryAndBananaJuiceButton:
            return .strawberryAndBananaJuice
        case mangoAndKiwiJuiceButton:
            return .mangoAndKiwiJuice
        default:
            return nil
        }
    }
    
    @objc private func updateFruitLable(_ notification: Notification) {
        guard let fruitName = notification.userInfo?["fruit"] as? Fruit else { return }
        guard let fruitStock = notification.userInfo?["stock"] as? Int else { return }
        if fruitName == .strawberry {
            strawberryLabel.text = String(fruitStock)
        } else if fruitName == .banana {
            bananaLabel.text = String(fruitStock)
        } else if fruitName == .mango {
            magoLabel.text = String(fruitStock)
        } else if fruitName == .kiwi {
            kiwiLabel.text = String(fruitStock)
        } else if fruitName == .pineapple {
            pineappleLabel.text = String(fruitStock)
        }
    }
    
    
    private func showSuccessAlert(with juiceName: String) {
        let alertCountroll = UIAlertController(title: Phrases.noticeTitle.text, message: juiceName + Phrases.readyForJuice.text, preferredStyle: .alert)
        let okAction = UIAlertAction(title: Phrases.ok.text, style: .default, handler: nil )
        alertCountroll.addAction(okAction)
        present(alertCountroll, animated: false, completion: nil)
    }
    
    private func showFailureAlert() {
        let alertCountrol = UIAlertController(title: Phrases.noticeTitle.text, message: Phrases.questionForStockChange.text, preferredStyle: .alert)
        let moveAction = UIAlertAction(title: Phrases.yes.text, style: .default, handler: { _ in self.moveStockChangeView() })
        let cancelAction = UIAlertAction(title: Phrases.no.text, style: .default, handler: nil )
        alertCountrol.addAction(moveAction)
        alertCountrol.addAction(cancelAction)
        present(alertCountrol, animated: false, completion: nil)
    }
    
    @IBAction func clickStockChangeButton(_ sender: UIButton) {
        moveStockChangeView()
    }
    
    private func moveStockChangeView() {
        let stockChangeView = self.storyboard?.instantiateViewController(withIdentifier: "stockChange")
        stockChangeView?.modalTransitionStyle = .coverVertical
        stockChangeView?.modalPresentationStyle = .automatic
        self.present(stockChangeView!, animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        NotificationCenter.default.addObserver(self, selector: #selector(updateFruitLable(_:)), name: Notification.Name("notificationStock"), object: nil)
        juiceMaker.initLable()
        
    }
}
