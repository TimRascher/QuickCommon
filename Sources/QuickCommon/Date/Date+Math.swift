//
//  Created by Timothy Rascher on 4/28/21.
//

import Foundation

public enum Time {
    case millisecond(Int)
    case second(Int)
    case minute(Int)
    case hour(Int)
    case day(Int)
    case month(Int)
    case year(Int)
    
    var interval: TimeInterval {
        switch self {
        case .millisecond(let value): return TimeInterval(value / 1000)
        case .second(let value): return TimeInterval(value)
        case .minute(let value): return TimeInterval(value * 60)
        case .hour(let value): return TimeInterval(value * 60 * 60)
        case .day(let value): return TimeInterval(value * 60 * 60 * 24)
        // Note: The following values shouldn't be used to calculate dates.
        case .month(let value): return TimeInterval(value * 60 * 60 * 24 * 30)
        case .year(let value): return TimeInterval(value * 60 * 60 * 24 * 365)
        }
    }
    var inverse: Time {
        switch self {
        case .millisecond(let value): return .millisecond(value * -1)
        case .second(let value): return .second(value * -1)
        case .minute(let value): return .minute(value * -1)
        case .hour(let value): return .hour(value * -1)
        case .day(let value): return .day(value * -1)
        case .month(let value): return .month(value * -1)
        case .year(let value): return .year(value * -1)
        }
    }
}

public extension Date {
    func add(time: Time) -> Date? {
        return add(time: time, with: Calendar.current)
    }
    func add(time: Time, with calendar: Calendar) -> Date? {
        let dateComponent = getDateComponent(from: time)
        return calendar.date(byAdding: dateComponent, to: self)
    }
}
private extension Date {
    func getDateComponent(from time: Time) -> DateComponents {
        var component = DateComponents()
        switch time {
        case .day(let value): component.day = value
        case .hour(let value): component.hour = value
        case .millisecond(let value): component.nanosecond = value * 1000000
        case .minute(let value): component.minute = value
        case .month(let value): component.month = value
        case .second(let value): component.second = value
        case .year(let value): component.year = value
        }
        return component
    }
}

infix operator +? : AdditionPrecedence
public func +? (left: Date, right: Time) -> Date? {
    right + left
}
public func +? (left: Time, right: Date) -> Date? {
    right.add(time: left)
}
public func + (left: Date, right: Time) -> Date {
    (left +? right)!
}
public func + (left: Time, right: Date) -> Date? {
    (left +? right)!
}
infix operator -? : AdditionPrecedence
public func -? (left: Date, right: Time) -> Date? {
    right - left
}
public func -? (left: Time, right: Date) -> Date? {
    right.add(time: left.inverse)
}
public func - (left: Date, right: Time) -> Date {
    (left -? right)!
}
public func  - (left: Time, right: Date) -> Date {
    (left -? right)!
}
