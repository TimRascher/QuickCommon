//
//  Created by Timothy Rascher on 4/28/21.
//

import Foundation

public extension URL {
    var exsists: FileManager.Exsistance {
        self.exsists(in: FileManager.default)
    }
    func exsists(in fileManager: FileManager) -> FileManager.Exsistance {
        fileManager.exsists(url: self)
    }
}
