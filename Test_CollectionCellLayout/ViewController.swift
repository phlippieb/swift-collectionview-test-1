//
//  ViewController.swift
//  Test_CollectionCellLayout
//
//  Created by Phlippie Bosman on 2020/09/23.
//

import UIKit
import PHBStackLayout
import PureLayout

class ViewController: UINavigationController {
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        self.pushViewController(self.rootController, animated: false)
    }
    
    private lazy var rootController = AppRootController()
}

/// Shown as the root controller of the app's navigation controller.
private final class AppRootController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        self.title = "Root"
        
        self.view.addSubview(self.button)
        self.button.autoCenterInSuperview()
        self.button.autoSetDimension(.width, toSize: 50)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        self.navigate()
    }
    
    private lazy var button: UIButton = {
        let button = UIButton(primaryAction: .init(handler: { [weak self] _ in
            self?.navigate()
        }))
        
        button.backgroundColor = .systemBlue
        return button
    }()
    
    private func navigate() {
        let vc = MyController()
        self.navigationController?.pushViewController(vc, animated: true)
    }
}
