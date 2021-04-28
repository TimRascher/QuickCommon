//
//  Created by Timothy Rascher on 4/28/21.
//

import Foundation

public extension FileManager {
    enum Exsistance: Equatable {
        case isDirectory
        case isFile
        case doseNotExsist
    }
    func exsists(url: URL) -> Exsistance {
        var isDir: ObjCBool = false
        if self.fileExists(atPath: url.absoluteString, isDirectory: &isDir) {
            if isDir.boolValue { return .isDirectory }
            else { return .isFile }
        } else { return .doseNotExsist }
    }
}
