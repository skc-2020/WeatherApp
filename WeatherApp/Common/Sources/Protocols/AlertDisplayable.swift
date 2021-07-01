//
//  AlertDisplayable.swift
//  WeatherApp
//
//  Created by AndUser on 23.06.2021.
//

import UIKit

// MARK: - AlertDisplayable

protocol AlertDisplayable: AnyObject {

    func showAlert(title: String?, message: String?, actions: [UIAlertAction.Style])

}

// MARK: - AlertViewTrait

protocol AlertViewTrait: AlertDisplayable {}

extension AlertViewTrait where Self: UIViewController {

    func showAlert(title: String?, message: String?, actions: [UIAlertAction.Style]) {
        let alert = UIAlertController(
            title: title,
            message: message,
            preferredStyle: .alert
        )

        configureActionsForAlert(alert, with: actions)

        present(alert, animated: true)
    }

    private func configureActionsForAlert(_ alert: UIAlertController,
                                          with actionViewModels: [UIAlertAction.Style]) {
        actionViewModels.forEach { action in
            var uiAlertAction: UIAlertAction?

            switch action {
            case .default:
                uiAlertAction = UIAlertAction(title: "Ok", style: action) { _ in
                    exit(0)
                }
            case .cancel:
                uiAlertAction = UIAlertAction(title: "Cancel", style: action) { _ in
                    // TODO: implement alert handler
                }
            case .destructive:
                uiAlertAction = UIAlertAction(title: "Ahtung", style: action) { _ in
                    // TODO: implement alert handler
                }
            @unknown default:
                fatalError("There was an error. App is terminating")
            }

            uiAlertAction.map {
                alert.addAction($0)
            }
        }
    }

}
