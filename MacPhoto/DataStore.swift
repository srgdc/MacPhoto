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
    
    var photos = IndexedDictionary<Photo>()
    var people = IndexedDictionary<Person>()
    var spots = IndexedDictionary<Spot>()
    var areas = IndexedDictionary<Area>()
    
    func clear() {
        photos.clear()
        people.clear()
        spots.clear()
        areas.clear()
    }
    
}
