//
//  Dynamic.swift
//  ImplementMVVM
//
//  Created by Liliia Neskoromna on 25.11.2020.
//

import Foundation


class Dynamic<T> {

    typealias Listener = (T) -> Void
    var listener: Listener?

    func bind(_ listener: Listener?) {
        self.listener = listener
    }

    func bindAndFire(_ listener: Listener?) {
        self.listener = listener
        listener?(value)
    }

    var value: T {
        didSet {
            listener?(value)
        }
    }

    init(_ v: T) {
        value = v
    }
}
