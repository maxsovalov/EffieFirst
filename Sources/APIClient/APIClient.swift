//
//  APIClient.swift
//  
//
//  Created by Maksym Sovalov on 2022-08-05.
//

import Foundation
import Files

public final class APIClient {
    private let arguments: [String]

    public init(arguments: [String] = CommandLine.arguments) {
        self.arguments = arguments
    }

    public func start() throws {
        do {
            let tempFolder = try Folder.home.createSubfolderIfNeeded(withName: "Temp")
            _ = try tempFolder.createFileIfNeeded(withName: "Temp.txt", contents: "А вот и мы".data(using: .utf8))
        } catch {
            print(error.localizedDescription)
            throw Error.failedToCreateFile
        }
    }

    public func getSomeFromInternet() {

    }
}

public extension APIClient {
    enum Error: Swift.Error {
        case missingFileName
        case failedToCreateFile
    }
}
