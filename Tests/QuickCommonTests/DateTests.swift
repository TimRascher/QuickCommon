//
//  Created by Timothy Rascher on 4/28/21.
//

import XCTest
@testable import QuickCommon

final class QuickCommonDateTests: XCTestCase {
    private let formatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd HH:mm:ss Z"
        return formatter
    }()
    private var date: Date!
    
    override func setUp() {
        var components = DateComponents()
        components.day = 10
        components.year = 1983
        components.month = 11
        components.hour = 20
        components.minute = 11
        components.timeZone = TimeZone(abbreviation: "PST")
        date = Calendar.current.date(from: components)
    }

    func testTimeAdding() {
        func check(_ date: Date, _ string: String) {
            let dateString = self.string(date)
            XCTAssert(dateString == string, "\(dateString) is wrong.")
        }
        check(date + Time.second(1), "1983-11-10 20:11:01 -0800")
        check(date + Time.minute(1), "1983-11-10 20:12:00 -0800")
        check(date + Time.hour(1), "1983-11-10 21:11:00 -0800")
        check(date + Time.day(1), "1983-11-11 20:11:00 -0800")
        check(date + Time.month(1), "1983-12-10 20:11:00 -0800")
        check(date + Time.year(1), "1984-11-10 20:11:00 -0800")
    }
    func testTimeSubtracting() {
        func check(_ date: Date, _ string: String) {
            let dateString = self.string(date)
            XCTAssert(dateString == string, "\(dateString) is wrong.")
        }
        check(date - Time.second(1), "1983-11-10 20:10:59 -0800")
        check(date - Time.minute(1), "1983-11-10 20:10:00 -0800")
        check(date - Time.hour(1), "1983-11-10 19:11:00 -0800")
        check(date - Time.day(1), "1983-11-09 20:11:00 -0800")
        check(date - Time.month(1), "1983-10-10 20:11:00 -0700")
        check(date - Time.year(1), "1982-11-10 20:11:00 -0800")
    }
}
private extension QuickCommonDateTests {
    func string(_ date: Date) -> String {
        return formatter.string(from: date)
    }
}
