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
    @Published var folderExists: Bool = false
    @Published var status: String = ""
    
    func connect() {
        guard let driveURL = FileManager.default.url(forUbiquityContainerIdentifier: nil)?
                .appendingPathComponent("Documents")
                .appendingPathComponent("CloudDocumentsSpike") else {
            self.status = "driveURL got nil"
            return
        }
        var isDirectory: ObjCBool = false
        let exists = FileManager.default.fileExists(atPath: driveURL.path, isDirectory: &isDirectory)
        self.folderExists = exists && isDirectory.boolValue
        if !exists {
            do {
                try FileManager.default.createDirectory(at: driveURL, withIntermediateDirectories: true, attributes: nil)
                self.status = "Folder created"
                self.folderExists = true
            } catch {
                self.connected = false
                self.status = "Error creating directory"
                return
            }
        }
        self.connected = true
        
        let filesEnum = FileManager.default.enumerator(atPath: driveURL.path)
        while let file = filesEnum?.nextObject() as? String {
            filesFound += 1
        }
    }
}
