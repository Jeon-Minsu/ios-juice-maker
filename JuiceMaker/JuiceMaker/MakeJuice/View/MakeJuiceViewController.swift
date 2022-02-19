//
//  JuiceMaker - MakeJuiceViewController.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import UIKit

class MakeJuiceViewController: UIViewController {
    @IBOutlet var quantityLabels: [UILabel]!
    @IBOutlet var orderButtons: [UIButton]!
    @IBOutlet weak var manageStocksButton: UIBarButtonItem!
    
    // 뷰에서 이루어질 비즈니스 로직을 담당할 뷰모델 생성
    private var viewModel = MakeJuiceViewModel(juiceMaker: JuiceMaker())
    
    override func viewDidLoad() {
        super.viewDidLoad()
        bindLabel()
        targetOrderButtons()
        targetManageStockButton()
    }
    
    private func bindLabel() {
        viewModel.displayingStocks.bind { [weak self] stocks in
            stocks.forEach { (index: Int, quantity: Quantity) in
                self?.quantityLabels[index].text = "\(quantity)"
            }
        }
    }
    
    private func targetOrderButtons() {
        orderButtons.enumerated().forEach({ (index, button) in
            button.tag = index
            button.addTarget(self, action: #selector(didTap(sender:)), for: .touchUpInside)
        })
    }
    
    private func targetManageStockButton() {
        manageStocksButton.addTarget(
            target: self,
            action: #selector(didTapManageStocksButton)
        )
    }
    
    @objc
    private func didTap(sender: UIButton) {
        let juice = JuiceMaker.Juice(index: sender.tag)
        do {
            try viewModel.order(juice)
            let alert = CompleteMakingAlert()
            self.present(alert.alertController(), animated: true, completion: nil)
        } catch JuiceMaker.JuiceMakerError.soldOut {
            let alert = SoldOutAlert()
            self.present(alert.alertController(), animated: true, completion: nil)
        } catch {
            let alert = DefaultAlert()
            self.present(alert.alertController(), animated: true, completion: nil)
        }
    }
    
    @objc
    private func didTapManageStocksButton() {
        guard let manageStocksViewController = self.storyboard?.instantiateViewController(
            identifier: "ManageStocksViewController"
        ) else { return }
        
        let navigation = UINavigationController(rootViewController: manageStocksViewController)
        self.present(navigation, animated: true, completion: nil)
    }
}
