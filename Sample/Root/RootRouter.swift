//
//  RootRouter.swift
//  Sample
//
//  Created by Naoki Ishikawa on 2018/02/25.
//  Copyright © 2018 jarinosuke. All rights reserved.
//

import RIBs

protocol RootInteractable: Interactable {
    weak var router: RootRouting? { get set }
    weak var listener: RootListener? { get set }
}

protocol RootViewControllable: ViewControllable {
    // TODO: Declare methods the router invokes to manipulate the view hierarchy.
}

final class RootRouter: LaunchRouter<RootInteractable, RootViewControllable>, RootRouting {

    // TODO: Constructor inject child builder protocols to allow building children.
    init(interactor: RootInteractable, viewController: RootViewControllable,
                  loggedOutBuilder: LoggedOutBuildable) {
        self.loggedOutBuilder = loggedOutBuilder
        super.init(interactor: interactor, viewController: viewController)
        interactor.router = self
    }
    
    // MARK: - Private
    
    private let loggedOutBuilder: LoggedOutBuildable
    
    private var loggedOut: ViewableRouting?
}
