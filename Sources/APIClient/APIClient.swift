//
//  APIClient.swift
//  
//
//  Created by Maksym Sovalov on 2022-08-05.
//

import Foundation
import Files
#if canImport(FoundationNetworking)
import FoundationNetworking
#endif

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
        let request = URLRequest(url: URL(string: "https://google.com")!)
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            if let error = error {
                print("Error: \(error)")
            }
            if let httpResponse = response as? HTTPURLResponse {
                print("HTTP Code: \(httpResponse.statusCode)")
            }
            if let data = data {
                print("Data size: \(data.count) bytes")
                if let s = String(data: data, encoding: .utf8) {
                    print("Response string: \(s)")
                } else {
                    print("No String")
                }
            } else {
                print("No data")
            }
        }
        task.resume()
    }
}

public extension APIClient {
    enum Error: Swift.Error {
        case missingFileName
        case failedToCreateFile
    }
}
