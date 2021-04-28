//
//  Created by Timothy Rascher on 4/28/21.
//

import Foundation

public extension Decodable {
    static func readFrom(url: URL) throws -> Self {
        let data = try Data(contentsOf: url, options: .mappedIfSafe)
        return try JSONDecoder().decode(Self.self, from: data)
    }
}
