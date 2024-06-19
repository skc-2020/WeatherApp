//
//  CustomLabel.swift
//  WeatherApp
//
//  Created by SKC on 14.03.2021.
//

import UIKit

final class CustomLabel: UILabel {

    override init(frame: CGRect) {
        super.init(frame: frame)

        setupView()
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}

// MARK: - Private Configuration

private extension CustomLabel {

    func setupView() {
        translatesAutoresizingMaskIntoConstraints = false
        textColor = .white
    }

}
