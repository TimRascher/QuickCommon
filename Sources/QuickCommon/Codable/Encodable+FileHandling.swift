//
//  Created by Timothy Rascher on 4/28/21.
//

import Foundation

public extension Encodable {
    func writeTo(url: URL) throws {
        let data = try JSONEncoder().encode(self)
        try data.write(to: url, options: .atomic)
    }
}
