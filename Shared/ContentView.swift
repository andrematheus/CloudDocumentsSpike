//
//  ContentView.swift
//  Shared
//
//  Created by André Roque Matheus on 17/11/20.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var storage: Storage
    
    var body: some View {
        VStack {
            Text("Connected: \(storage.connected.description)")
            Text("Files Found: \(storage.filesFound)")
            Button("Change it") {
                storage.connected = true
                storage.filesFound = 10
            }.padding()
        }.padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(storage: Storage())
    }
}
