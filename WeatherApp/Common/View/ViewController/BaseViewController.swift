//
//  BaseViewController.swift
//  WeatherApp
//
//  Created by AndUser on 13.03.2021.
//

import UIKit

class BaseViewController: UIViewController {

    var lifecycleListener: LifecycleListener?

    override func viewDidLoad() {
        super.viewDidLoad()

        lifecycleListener?.viewDidLoad()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        lifecycleListener?.viewWillAppear()
    }
}
