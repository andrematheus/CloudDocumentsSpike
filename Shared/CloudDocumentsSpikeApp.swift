//
//  CloudDocumentsSpikeApp.swift
//  Shared
//
//  Created by André Roque Matheus on 17/11/20.
//

import SwiftUI

@main
struct CloudDocumentsSpikeApp: App {
    @StateObject var storage: Storage = Storage()
    
    var body: some Scene {
        WindowGroup {
            ContentView(storage: storage)
        }
    }
}
