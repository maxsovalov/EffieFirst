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
        guard arguments.count > 1 else {
            throw Error.missingFileName
        }

        // The first argument is the execution path
        let fileName = arguments[1]

        do {
            try Folder.current.createFile(at: fileName)
        } catch {
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
