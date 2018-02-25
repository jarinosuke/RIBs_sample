//
//  RootComponent+LoggedOut.swift
//  Sample
//
//  Created by Naoki Ishikawa on 2018/02/25.
//  Copyright © 2018 jarinosuke. All rights reserved.
//

import RIBs

protocol RootDependencyLoggedOut: Dependency {
    
    // TODO: Declare dependencies needed from the parent scope of Root to provide dependencies
    // for the LoggedOut scope.
}

extension RootComponent: LoggedOutDependency {
    
    // TODO: Implement properties to provide for LoggedOut scope.
}
