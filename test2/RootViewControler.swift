//
//  RootViewControler.swift
//  test2
//
//  Created by User on 20.04.2022.
//

import Foundation
import UIKit
class RootViewController: UIViewController
{
    private var current: UIViewController
    init()
    {
       
        self.current = ViewController()
        super.init(nibName: nil, bundle: nil)
    }
    override func viewDidLoad()
    {
        super.viewDidLoad()
         
        addChild(current)               // 1
        current.view.frame = view.bounds              // 2
        view.addSubview(current.view)                 // 3
        current.didMove(toParent: self) // 4

    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
