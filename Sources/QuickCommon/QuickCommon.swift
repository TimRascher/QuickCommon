import Foundation

public struct QuickCommonLibrary {
    private init() {}
}
public extension QuickCommonLibrary {
    static var bundle: Bundle {
        class Helper {}
        return Bundle(for: Helper.self)
    }
}
