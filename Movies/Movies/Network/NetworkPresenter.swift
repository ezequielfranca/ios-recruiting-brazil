//
//  Presenter.swift
//  Shuffle
//
//  Created by Ezequiel França on 13/08/19.
//  Copyright © 2019 Ezequiel França. All rights reserved.
//

import Foundation

class NetworkPresenter {
    
    let networkLayer: NetworkLayer
    
    init(networkLayer: NetworkLayer = NetworkLayer()) {
        self.networkLayer = networkLayer
    }
}

