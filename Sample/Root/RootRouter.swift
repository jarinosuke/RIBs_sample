//
//  RootRouter.swift
//  Sample
//
//  Created by Naoki Ishikawa on 2018/02/25.
//  Copyright © 2018 jarinosuke. All rights reserved.
//

import RIBs

protocol RootInteractable: Interactable, LoggedOutListener {
    weak var router: RootRouting? { get set }
    weak var listener: RootListener? { get set }
}

protocol RootViewControllable: ViewControllable {
    func present(viewController: ViewControllable)
}
final class RootRouter: LaunchRouter<RootInteractable, RootViewControllable>, RootRouting {

    // TODO: Constructor inject child builder protocols to allow building children.
    init(interactor: RootInteractable, viewController: RootViewControllable,
                  loggedOutBuilder: LoggedOutBuildable) {
        self.loggedOutBuilder = loggedOutBuilder
        super.init(interactor: interactor, viewController: viewController)
        interactor.router = self
    }
    
    override func didLoad() {
        super.didLoad()
        
        let loggedOut = loggedOutBuilder.build(withListener: interactor)
        self.loggedOut = loggedOut
        attachChild(loggedOut)
        viewController.present(viewController: loggedOut.viewControllable)
    }
    
    // MARK: - Private
    
    private let loggedOutBuilder: LoggedOutBuildable
    
    private var loggedOut: ViewableRouting?
}
