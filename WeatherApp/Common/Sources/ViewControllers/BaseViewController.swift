//
//  BaseViewController.swift
//  WeatherApp
//
//  Created by AndUser on 13.03.2021.
//

import UIKit

class BaseViewController: UIViewController {

    // MARK: - Lifecycle Listener

    weak var lifecycleListener: LifecycleListener?

    // MARK: - Override functions

    override func viewDidLoad() {
        super.viewDidLoad()

        lifecycleListener?.viewDidLoad()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        lifecycleListener?.viewWillAppear()
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)

        lifecycleListener?.viewDidAppear()
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)

        lifecycleListener?.viewWillDisappear()
    }

    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)

        lifecycleListener?.viewDidDisappear()
    }

}
 
