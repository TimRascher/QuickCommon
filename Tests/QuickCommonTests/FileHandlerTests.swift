    import XCTest
    @testable import QuickCommon

    final class QuickCommonTests: XCTestCase {
        private var url: URL!
        
        override func setUp() {
            url = URL(fileURLWithPath: NSTemporaryDirectory(), isDirectory: true)
            
        }
        override func tearDownWithError() throws {
//            try FileManager.default.removeItem(at: url)
            url = nil
        }
        
        func testIsDirectory() {
//            XCTAssert(url.exsists == .isDirectory, "Is not a directory!")
        }
    }
