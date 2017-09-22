//
//  HomeViewController.swift
//  TestLottieAnimations
//
//  Created by William Wilson on 9/21/17.
//  Copyright © 2017 LeTote. All rights reserved.
//

import Lottie

class HomeViewController: UIViewController {
    let displayArea: UIView = {
        let view = UIView()

        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .black

        return view
    }()

    let linkButton: UIButton = {
        let button = UIButton()

        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("List of unsupported after effects features", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 14)
        button.setTitleColor(.blue, for: .normal)
        button.addTarget(self, action: #selector(openUnsupportedFeatures), for: .touchUpInside)

        return button
    }()

    let testButton: UIButton = {
        let button = UIButton(type: .system)

        button.setTitle("Test", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = .blue
        button.setTitleColor(.white, for: .normal)
        button.addTarget(self, action: #selector(testAnimation), for: .touchUpInside)

        return button
    }()

    let textView: UITextView = {
        let textView = UITextView()

        textView.translatesAutoresizingMaskIntoConstraints = false
        textView.layer.borderWidth = 1
        textView.layer.borderColor = UIColor.blue.cgColor

        return textView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .white

        view.addSubview(textView)
        view.addSubview(testButton)
        view.addSubview(linkButton)
        view.addSubview(displayArea)

        NSLayoutConstraint.activate([
            textView.bottomAnchor.constraint(equalTo: bottomLayoutGuide.topAnchor, constant: -16),
            textView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            textView.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.75),
            textView.heightAnchor.constraint(equalTo: testButton.heightAnchor),
            testButton.leadingAnchor.constraint(equalTo: textView.trailingAnchor, constant: 16),
            testButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            testButton.bottomAnchor.constraint(equalTo: bottomLayoutGuide.topAnchor, constant: -16),
            linkButton.bottomAnchor.constraint(equalTo: textView.topAnchor, constant: -16),
            linkButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            displayArea.topAnchor.constraint(equalTo: view.topAnchor),
            displayArea.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            displayArea.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            displayArea.bottomAnchor.constraint(equalTo: linkButton.topAnchor, constant: -16)])
    }

    func openUnsupportedFeatures() {
        guard let url = URL(string: "https://github.com/airbnb/lottie-ios/blob/master/README.md#currently-unsupported-after-effects-features") else {
            return
        }

        if #available(iOS 10, *) {
            UIApplication.shared.open(url)
        } else {
            UIApplication.shared.openURL(url)
        }
    }

    func testAnimation() {
        for view in displayArea.subviews {
            view.removeFromSuperview()
        }

        guard let url = URL(string: textView.text) else {
            return
        }

        let animationView = LOTAnimationView(contentsOf: url)
        animationView.backgroundColor = .white
        animationView.translatesAutoresizingMaskIntoConstraints = false
        animationView.contentMode = .scaleAspectFit
        displayArea.addSubview(animationView)

        NSLayoutConstraint.activate([
            animationView.topAnchor.constraint(equalTo: displayArea.topAnchor),
            animationView.leadingAnchor.constraint(equalTo: displayArea.leadingAnchor),
            animationView.widthAnchor.constraint(equalTo: displayArea.widthAnchor),
            animationView.heightAnchor.constraint(equalTo: displayArea.widthAnchor)])

        animationView.loopAnimation = true
        animationView.play()
    }
}

extension HomeViewController: UITextViewDelegate {
    func textViewShouldBeginEditing(_ textView: UITextView) -> Bool {
        return false
    }

    func textView(_ textView: UITextView, shouldInteractWith URL: URL, in characterRange: NSRange) -> Bool {
        return true
    }
}
