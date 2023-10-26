//
//  Date+Extension.swift
//  CoordinatorTemplate
//
//  Created by Eric Williams on 2023-10-25.
//

import Foundation

extension Date {

    func convertToString(with dateFormatterStyle: DateFormatterStyle, timeZone: TimeZone? = nil, locale: Locale? = nil) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = dateFormatterStyle.format()
        if let timeZone {
            dateFormatter.timeZone = timeZone
        } else {
            dateFormatter.timeZone = TimeZone.current
        }
        if let locale {
            dateFormatter.locale = locale
        } else {
            dateFormatter.locale = Locale.current
        }
        return dateFormatter.string(from: self)
    }

    var isFutureDate: Bool {
        return self > Date()
    }

    // @available(*, deprecated, message: "Use equivalent function below with time zone.")
    var month: String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MMMM"
        return dateFormatter.string(from: self)
    }

    // @available(*, deprecated, message: "Use equivalent function below with time zone.")
    var dayOfWeek: String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "EEEE"
        return dateFormatter.string(from: self)
    }

    var dayOfWeekAbbreviated: String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "EEE"
        return dateFormatter.string(from: self)
    }

    var dayOfWeekAbbreviatedTwoCharacters: String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "EEEEE"
        let day = dateFormatter.string(from: self).uppercased()
        if day == "S" || day == "T" {
            dateFormatter.dateFormat = "EEEEEE"
            return dateFormatter.string(from: self)
        }
        return dateFormatter.string(from: self)
    }

    // @available(*, deprecated, message: "Use equivalent function below with time zone.")
    var dayOfMonth: Int {
        let calendar = Calendar.current
        return calendar.component(.day, from: self)
    }

    /// Converts a `Date` from `initialTimeZone` to `finalTimeZone` TimeZone.
    func convertToTimeZone(with initialTimeZone: TimeZone, finalTimeZone: TimeZone) -> Date {
         let delta = TimeInterval(finalTimeZone.secondsFromGMT() - initialTimeZone.secondsFromGMT())
         return addingTimeInterval(delta)
    }

    func month(with timeZone: TimeZone = .autoupdatingCurrent) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.timeZone = timeZone
        dateFormatter.dateFormat = "MMMM"
        return dateFormatter.string(from: self)
    }

    func dayOfMonth(with timeZone: TimeZone = .autoupdatingCurrent) -> Int {
        var calendar = Calendar.current
        calendar.timeZone = timeZone
        return calendar.component(.day, from: self)
    }

    func fullDateTime(with timeZone: TimeZone = .autoupdatingCurrent) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.timeZone = timeZone
        dateFormatter.dateFormat = "h:mm a, EEEE, MMMM d"
        return dateFormatter.string(from: self)
    }

    func fullDate(with timeZone: TimeZone = .autoupdatingCurrent) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.timeZone = timeZone
        dateFormatter.dateFormat = "EEEE, MMMM d"
        return dateFormatter.string(from: self)
    }

    func dayOfWeek(with timeZone: TimeZone = .autoupdatingCurrent) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.timeZone = timeZone
        dateFormatter.dateFormat = "EEEE"
        return dateFormatter.string(from: self)
    }

    func hourAndMinutes(with timeZone: TimeZone = .autoupdatingCurrent) -> String {
        let formatter = DateFormatter()
        formatter.timeZone = timeZone
        formatter.dateFormat = Locale.is12HoursFormat() ? DateFormatterStyle.shortTime12h.format() : DateFormatterStyle.shortTime24h.format()
        return formatter.string(from: self)
    }

    func hourOfDay(with timeZone: TimeZone = .autoupdatingCurrent) -> Int {
        var calendar = Calendar.current
        calendar.timeZone = timeZone
        return calendar.component(.hour, from: self)
    }

    func minuteOfHour(with timeZone: TimeZone = .autoupdatingCurrent) -> Int {
        var calendar = Calendar.current
        calendar.timeZone = timeZone
        return calendar.component(.minute, from: self)
    }

    func hour(with timeZone: TimeZone) -> String {
        let formatter = DateFormatter()
        formatter.timeZone = timeZone
        formatter.dateFormat = Locale.is12HoursFormat() ? DateFormatterStyle.hour12h.format() : DateFormatterStyle.hour24h.format()
        return formatter.string(from: self)
    }

    func setDayTime(with timeZone: TimeZone = .autoupdatingCurrent, hour: Int = 0, minute: Int = 0) -> Date? {
        var calendar = Calendar.current
        calendar.timeZone = timeZone
        var components = calendar.dateComponents([.year, .month, .day, .hour, .minute], from: self)
        components.minute = minute
        components.hour = hour
        return calendar.date(from: components)
    }

    func getCurrentTime(forTimeZone timeZone: TimeZone = .autoupdatingCurrent) -> Date? {
        var calendar = Calendar.current
        calendar.timeZone = timeZone
        let components = calendar.dateComponents([.year, .month, .day, .hour, .minute], from: self)

        return calendar.date(from: components)
    }

    static func getCurrentHour(forTimeZoneName timeZoneName: String) -> Int? {
        if !TimeZone.knownTimeZoneIdentifiers.contains(timeZoneName) { return nil }
        if let timeZone = TimeZone(identifier: timeZoneName) {
            let localTimeComponents = Calendar.current.dateComponents(in: timeZone, from: Date())
            return localTimeComponents.hour
        }
        return nil
    }

    /// Returns either MIDNIGHT of the given day (ie 12:00:01am) or a time of the day of your choosing by passing in the hour/min
    func createArbitraryTimeForDay(with timeZone: TimeZone = .autoupdatingCurrent, hour: Int = 0, minute: Int = 0) -> Date? {
        var calendar = Calendar.current
        calendar.timeZone = timeZone
        var components = calendar.dateComponents([.year, .month, .day, .hour, .minute], from: self)
        components.minute = minute
        components.hour = hour
        return calendar.date(from: components)
    }

    var startOfDayDate: Date {
        return Calendar.current.startOfDay(for: self)
    }

    var endOfDayDate: Date {
        let nextDayDate = Calendar.current.date(byAdding: .day, value: 1, to: self.startOfDayDate)!
        return nextDayDate.addingTimeInterval(-1)
    }

    var startTime: String {
        return self.startOfDayDate.convertToString(with: currentDateFormatterStyle(), timeZone: nil, locale: currentLocale())
    }

    var endTime: String {
        return self.endOfDayDate.convertToString(with: currentDateFormatterStyle(), timeZone: nil, locale: currentLocale())
    }

    private func currentDateFormatterStyle() -> DateFormatterStyle {
         return shouldShowTimeIn12HourFormat() ? .shortTime12h : .shortTime24h
     }

    private func currentLocale() -> Locale {
        return shouldShowTimeIn12HourFormat() ? Locale(identifier: "en_US") : Locale(identifier: "en_GB")
    }

    private func shouldShowTimeIn12HourFormat() -> Bool {
        Locale.is12HoursFormat() ? true : false
    }

    /// Calculate the difference between two dates
    /// - Parameters:
    ///   - recent: the most recent date
    ///   - previous: the oldest date
    /// - Returns: Returns a Tuple with the difference in a month, day, hour, minute and second 
    static func - (recent: Date, previous: Date) -> DateComponentParts {
        let day = Calendar.current.dateComponents([.day], from: previous, to: recent).day
        let month = Calendar.current.dateComponents([.month], from: previous, to: recent).month
        let hour = Calendar.current.dateComponents([.hour], from: previous, to: recent).hour
        let minute = Calendar.current.dateComponents([.minute], from: previous, to: recent).minute
        let second = Calendar.current.dateComponents([.second], from: previous, to: recent).second

        let dateComponentParts = DateComponentParts(month: month, day: day, hour: hour, minute: minute, second: second)
        return dateComponentParts
    }
}

struct DateComponentParts {
    var month: Int?
    var day: Int?
    var hour: Int?
    var minute: Int?
    var second: Int?
}
