//
//  FooterView.swift
//  WeatherApp
//
//  Created by SKC on 08.07.2021.
//

import UIKit

final class FooterView: UIView {

    typealias ButtonHandler = () -> Void

    // MARK: - Private variables

    var searchButtonHandler: ButtonHandler?

    private let optionsButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        if let image = DesignSystem.Images.list {
            button.setImage(image, for: .normal)
        }
        button.addTarget(self,
                         action: #selector(tapAddContact),
                         for: UIControl.Event.touchUpInside)

        return button
    }()

    // MARK: - Initializers

    override init(frame: CGRect) {
        super.init(frame: frame)

        setupView()
        setupLayout()
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}

// MARK: - Setup View

private extension FooterView {

    func setupView() {
        addSubview(optionsButton)
    }

}

// MARK: - Setup Constraints

private extension FooterView {

    func setupLayout() {
        translatesAutoresizingMaskIntoConstraints = false
        layer.borderWidth = 0.3
        layer.borderColor = UIColor.white.cgColor

        optionsButton.pinTopEdge(to: .view(self), attribute: .top, constant: 20)
        optionsButton.pinBottomEdge(to: .view(self), attribute: .bottom, constant: -40)
        optionsButton.pinTrailingEdge(to: .view(self), attribute: .trailing, constant: -25)
        optionsButton.width(equalTo: 25)
    }

}

// MARK: - Button Actions

private extension FooterView {

    @objc
    func tapAddContact() {
        searchButtonHandler?()
    }

}
