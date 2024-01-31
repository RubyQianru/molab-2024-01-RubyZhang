//
// Using playground to validate code from internet search
// Source:
// https://stackoverflow.com/questions/34457434/swift-convert-time-to-time-ago
//
// report the time lapsed between two dates

import Foundation


extension Date
{
    func getElapsedInterval(to: Date) -> [String]
    {
        let interval = Calendar.current.dateComponents(
            [.year, .month, .day,.hour, .minute, .second],
            from: self, to: to)
        var arr = [String]()
        if let yearsPassed = interval.year, yearsPassed > 0 {
            arr.append("\(yearsPassed) year\(yearsPassed == 1 ? "" : "s")")
        }
        if let monthsPassed = interval.month, monthsPassed > 0 {
            arr.append("\(monthsPassed) month\(monthsPassed == 1 ? "" : "s")")
        }
        if let daysPassed = interval.day, daysPassed > 0 {
            arr.append("\(daysPassed) day\(daysPassed == 1 ? "" : "s")")
        }
        if let hoursPassed = interval.hour, hoursPassed > 0 {
            arr.append("\(hoursPassed) hours\(hoursPassed == 1 ? "" : "s")")
        }
        if let minutesPassed = interval.minute, minutesPassed > 0 {
            arr.append("\(minutesPassed) minutes\(minutesPassed == 1 ? "" : "s")")
        }
        if let secondsPassed = interval.second, secondsPassed > 0 {
            arr.append("\(secondsPassed) seconds\(secondsPassed == 1 ? "" : "s")")
        }
        
        return arr
    }
}

let d0 = Date(timeIntervalSinceReferenceDate: 0)
let d1 = Date()
print("d1", d1)
let el = d0.getElapsedInterval(to: d1)
print("el", el)
