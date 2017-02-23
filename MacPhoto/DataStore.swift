//
//  DataStore.swift
//  MacPhoto
//
//  Created by Christopher Boynton on 2/20/17.
//  Copyright © 2017 Christopher Boynton. All rights reserved.
//

import Foundation

class DataStore {
    
    private init() {}
    static let instance = DataStore()
    
    var photos = [String:Photo]()
    var people = [String:Person]()
    
    
}
