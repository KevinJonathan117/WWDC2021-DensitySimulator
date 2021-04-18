//
//  Model.swift
//  PlaygroundBook
//
//  Created by Kevin Jonathan on 16/04/21.
//

import Foundation

public struct Density {
    private var massValue : Double
    private var volumeValue : Double
    
    public init(_massValue : Double = 50, _volumeValue : Double = 50) {
        massValue = _massValue
        volumeValue = _volumeValue
    }
    public func getMassValue() -> Double {
        return massValue
    }
    public func getVolumeValue() -> Double {
        return volumeValue
    }
    public func getDensityValue() -> Double {
        return massValue / volumeValue
    }
    public mutating func setMassValue(_massValue : Double) {
        massValue = _massValue
    }
    public mutating func setVolumeValue(_volumeValue : Double) {
        volumeValue = _volumeValue
    }
}

public struct RelativeDensity {
    private var substanceValue : Double
    private var referenceValue : Double
    
    public init(_substanceValue : Double = 50, _referenceValue : Double = 50) {
        substanceValue = _substanceValue
        referenceValue = _referenceValue
    }
    public func getSubstanceValue() -> Double {
        return substanceValue
    }
    public func getReferenceValue() -> Double {
        return referenceValue
    }
    public func getRelativeDensityValue() -> Double {
        return substanceValue / referenceValue
    }
    public mutating func setSubstanceValue(_substanceValue : Double) {
        substanceValue = _substanceValue
    }
    public mutating func setReferenceValue(_referenceValue : Double) {
        referenceValue = _referenceValue
    }
}

