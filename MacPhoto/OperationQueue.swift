//
//  OperationQueue.swift
//  MacPhoto
//
//  Created by Admin on 4/2/17.
//  Copyright © 2017 Christopher Boynton. All rights reserved.
//

import Foundation

extension OperationQueue {
    
    convenience init(qualityOfService: QualityOfService) {
        self.init()
        self.qualityOfService = qualityOfService
    }
    
    static var importQueue: OperationQueue {
        return OperationQueue(qualityOfService: .background)
    }
    
    static var photoSaveQueue: OperationQueue {
        return OperationQueue(qualityOfService: .background)
    }
}
