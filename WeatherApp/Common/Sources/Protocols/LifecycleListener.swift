//
//  LifecycleListener.swift
//  WeatherApp
//
//  Created by AndUser on 13.03.2021.
//

/// Describes lifecycle functions and the contract between presenter and view.
protocol LifecycleListener: AnyObject {

    func viewDidLoad()

    func viewWillAppear()

    func viewDidAppear()

    func viewWillDisappear()

    func viewDidDisappear()

}

extension LifecycleListener {

    func viewDidLoad() {}

    func viewWillAppear() {}

    func viewDidAppear() {}

    func viewWillDisappear() {}

    func viewDidDisappear() {}

}
