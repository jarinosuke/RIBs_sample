//
//  AppComponent.swift
//  Sample
//
//  Created by Naoki Ishikawa on 2018/02/25.
//  Copyright © 2018 jarinosuke. All rights reserved.
//

import RIBs

class AppComponent: Component<EmptyDependency>, RootDependency {
    
    init() {
        super.init(dependency: EmptyComponent())
    }
}
