//
//  Collections.swift
//  WeatherApp
//
//  Created by AndUser on 22.05.2021.
//

// MARK: - Collection extension

extension Collection where Indices.Iterator.Element == Index {

    subscript (safe index: Index) -> Iterator.Element? {
        indices.contains(index) ? self[index] : nil
    }

}
