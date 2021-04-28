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
    func createDirectoryIfItDoesntExsist(_ manager: FileManager? = nil) throws {
        let manager = manager ?? FileManager.default
        let exsists = self.exsists
        if exsists == .isDirectory { return }
        if exsists == .isFile {
            try manager.removeItem(at: self)
        }
        try manager.createDirectory(at: self, withIntermediateDirectories: true, attributes: nil)
    }
}
