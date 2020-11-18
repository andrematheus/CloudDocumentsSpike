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
        Form {
            Text("Connected: \(storage.connected.description)")
            Text("Files Found: \(storage.filesFound)")
            Text("Folder exists: \(storage.folderExists.description)")
            Text("Status: \(storage.status)")
            Button("Change it") {
                storage.connect()
            }.padding()
        }.frame(minWidth: 350, minHeight: 250)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(storage: Storage())
    }
}
