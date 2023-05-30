//
//  BaseViewController.swift
//  BaseMVVM
//
//  Created by Finofantashi on 15/08/2022.
//

import NVActivityIndicatorView
import UIKit

class BaseViewController: UIViewController {

    var activityIndicator: NVActivityIndicatorView?

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        activityIndicator = NVActivityIndicatorView(frame: CGRect(x: self.view.frame.width / 2, y: self.view.frame.height / 2, width: 60, height: 60), type: .ballBeat, color: #colorLiteral(red: 0, green: 0.46, blue: 0.89, alpha: 1), padding: nil)
    }

    func showErrorAlert(message: String) {
        let alert = UIAlertController(title: "Hata!", message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Tamam", style: .default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
}

extension BaseViewController {

    // MARK: Activity Indicator
    func showLoadingIndicator() {
        if let activityIndicator = activityIndicator {
            self.view.addSubview(activityIndicator)
            activityIndicator.startAnimating()
        }
    }

    func hideLoadingIndicator() {
        if let activityIndicator = activityIndicator {
            activityIndicator.removeFromSuperview()
            activityIndicator.stopAnimating()
        }
    }
}
