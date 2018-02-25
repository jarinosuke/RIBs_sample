//
//  LoggedOutViewController.swift
//  Sample
//
//  Created by Naoki Ishikawa on 2018/02/25.
//  Copyright © 2018 jarinosuke. All rights reserved.
//

import RIBs
import RxSwift
import UIKit

protocol LoggedOutPresentableListener: class {
    func login(with username: String?, password: String?)
}

final class LoggedOutViewController: UIViewController, LoggedOutPresentable, LoggedOutViewControllable {

    @IBOutlet weak var usernameField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    
    /// The UIKit view representation of this view.
    public final var uiviewController: UIViewController { return self }

    weak var listener: LoggedOutPresentableListener?
    @IBAction func pushLoginButton(_ sender: Any) {
        listener?.login(with: usernameField.text, password: passwordField.text)
    }
}
