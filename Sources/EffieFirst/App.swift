import Foundation
import APIClient

@main
struct EffieFirstApp {
    static func main() {
        do {
            let commandParser = try CommandParser()
            let commandType = try commandParser.parseCommandType()
        } catch {
            print("Whoops! An error occurred: \(error)")
        }
    }
}
