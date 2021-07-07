//
//  AlertDisplayable.swift
//  WeatherApp
//
//  Created by AndUser on 23.06.2021.
//

import UIKit

// MARK: - AlertDisplayable

protocol AlertDisplayable: AnyObject {

    func showAlert(title: String?, message: String?, actions: [UIAlertAction])

}

// MARK: - AlertViewTrait

protocol AlertViewTrait: AlertDisplayable {}

extension AlertViewTrait where Self: UIViewController {

    func showAlert(title: String?,
                   message: String?,
                   actions: [UIAlertAction]) {
        let alert = UIAlertController(
            title: title,
            message: message,
            preferredStyle: .alert
        )

        configureActionsForAlert(alert, with: actions)

        present(alert, animated: true)
    }

    private func configureActionsForAlert(_ alert: UIAlertController,
                                          with actionViewModels: [UIAlertAction]) {
        actionViewModels.forEach {
            alert.addAction($0)
        }
    }

}
