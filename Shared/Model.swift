//
//  Model.swift
//  CloudDocumentsSpike
//
//  Created by André Roque Matheus on 17/11/20.
//

import Foundation

class Storage: ObservableObject {
    @Published var connected: Bool = false
    @Published var filesFound: Int = 0
}
