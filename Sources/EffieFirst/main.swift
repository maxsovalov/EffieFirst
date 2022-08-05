import Foundation
import APIClient

let tool = APIClient()

//do {
//    try tool.start()
//} catch {
//    print("Whoops! An error occurred: \(error)")
//}

tool.getSomeFromInternet()

RunLoop.main.run()
