//
//  Logic.swift
//  Camera Maths
//
//  Created by Jan on 07.07.16.
//  Copyright © 2016 dfragment.net. All rights reserved.
//

import Foundation

class Logic {
    
    class func cropResult(cropFactor: Float, focalLength: Int) -> Float {
        return cropFactor * Float(focalLength)
    }
    
    class func maxStableImage(cropFactor: Float, focalLength: Int) -> Float {
        return (1.0 / Float(focalLength)) * cropFactor
    }
    
}