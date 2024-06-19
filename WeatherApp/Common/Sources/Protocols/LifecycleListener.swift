//
//  LifecycleListener.swift
//  WeatherApp
//
//  Created by SKC on 13.03.2021.
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
