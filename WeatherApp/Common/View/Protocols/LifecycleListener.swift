//
//  LifecycleListener.swift
//  WeatherApp
//
//  Created by AndUser on 13.03.2021.
//

/// Describes lifecycle functions and the contract between presenter and view.
public protocol LifecycleListener: AnyObject {

    func viewDidLoad()

    func viewWillAppear()

    func viewDidAppear()

    func viewWillDisappear()

    func viewDidDisappear()

    func viewReadyToInitiallyStartEditing()

    /// The method called after the user tapped the back button of a navigation bar
    /// or when the user performed "swipe to dismiss" action.
    /// You can use this method to tell to the output that the module is being closed.
    func screenClosedByUser()

    /// The method called when a screen should be closed.
    func didAskToCloseScreen()

}

public extension LifecycleListener {

    func viewDidLoad() {}

    func viewWillAppear() {}

    func viewDidAppear() {}

    func viewWillDisappear() {}

    func viewDidDisappear() {}

    func viewReadyToInitiallyStartEditing() {}

    func screenClosedByUser() {}

    func didAskToCloseScreen() {}

}
