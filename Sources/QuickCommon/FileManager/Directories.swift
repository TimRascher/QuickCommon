//
//  Created by Timothy Rascher on 4/28/21.
//

import Foundation

public typealias Directories = FileManager.SearchPathDirectory

public extension FileManager.SearchPathDirectory {
    private var manager: FileManager { FileManager.default }
    var location: URL {
        manager.urls(for: self, in: .userDomainMask)[0]
    }
}
