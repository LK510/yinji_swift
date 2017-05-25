//
//  TimeUtils.swift
//  yinji
//
//  Created by 路飞 on 2017/5/25.
//  Copyright © 2017年 路飞. All rights reserved.
//

import Foundation

public extension NSObject {
    
    //system
    var getBundleName : String {
        return Bundle.main.bundleIdentifier!
    }
    
    var getUUID : String {
        return (UIDevice.current.identifierForVendor?.uuidString)!
    }
    
    //time
    var currentTimeStampStr : String {
        return NSString(format: "%zd", self.currentTimeInterval) as String
    }

    var currentTimeInterval : uint {
        return uint(NSDate().timeIntervalSince1970)
    }
    
    func getTimeString() -> String {
        if isToday {
            if minute < 5 {
                return "刚刚"
            } else if hour < 1 {
                return "\(minute)分钟之前"
            } else {
                return "\(hour)小时之前"
            }
        } else if isYesterday {
            return "昨天 \(self.yesterdayTimeStr())"
        } else if isYear {
            return noYesterdayTimeStr()
        } else {
            return yearTimeStr()
        }
    }
    
    fileprivate var selfDate : Date {
        return Date(timeIntervalSince1970: TimeInterval(self as! String)!)
    }
    
    /// 距当前有几分钟
    var minute : Int {
        let dateComponent = Calendar.current.dateComponents([.minute], from: selfDate, to: Date())
        return dateComponent.minute!
    }
    
    /// 距当前有几小时
    var hour : Int {
        let dateComponent = Calendar.current.dateComponents([.hour], from: selfDate, to: Date())
        return dateComponent.hour!
    }
    
    /// 是否是今天
    var isToday : Bool {
        return Calendar.current.isDateInToday(selfDate)
    }
    
    /// 是否是昨天
    var isYesterday : Bool {
        return Calendar.current.isDateInYesterday(selfDate)
    }
    
    /// 是否是今年
    var isYear: Bool {
        let nowComponent = Calendar.current.dateComponents([.year], from: Date())
        let component = Calendar.current.dateComponents([.year], from: selfDate)
        return (nowComponent.year == component.year)
    }
    
    func yesterdayTimeStr() -> String {
        let format = DateFormatter()
        format.dateFormat = "HH:mm"
        return format.string(from: selfDate)
    }
    
    func noYesterdayTimeStr() -> String {
        let format = DateFormatter()
        format.dateFormat = "MM-dd HH:mm"
        return format.string(from: selfDate)
    }
    
    func yearTimeStr() -> String {
        let format = DateFormatter()
        format.dateFormat = "yyyy-MM-dd HH:mm"
        return format.string(from: selfDate)
    }
    
    
//    func timeintervalToDate(interval:String) -> String {
//        
//        let timeString = NSString(string: interval)
//        let range = _NSRange(location: 0, length: 10)
//        let suString = timeString.substring(with: range)
//        let formatter = DateFormatter()
//        formatter.dateFormat = "yyyy-MM-dd HH:MM:ss"
//        let date = NSDate(timeIntervalSince1970: Double(suString)!)
//        return self.compareDate(oldDate: date)
//        
//    }
    
//    func compareDate(oldDate:NSDate) -> String{
//        //8小时时差
//        let now = NSDate()
//        let zone = NSTimeZone.system
//        let interval = zone.secondsFromGMTForDate(now)
//        let localeDate = now.dateByAddingTimeInterval(Double(interval))
//        let today = localeDate
//        
//        let newDate = oldDate.dateByAddingTimeInterval(Double(interval))
//        
//        let secondsPerDay:TimeInterval = 24 * 60 * 60
//        let yesterday = today.dateByAddingTimeInterval(-secondsPerDay)
//        let beforeOfYesterday = yesterday.dateByAddingTimeInterval(-secondsPerDay)
//        let dateString = NSString(string: newDate.description).substringToIndex(10)
//        let todayString = NSString(string: today.description).substringToIndex(10)
//        let yesterdayString = NSString(string: yesterday.description).substringToIndex(10)
//        let beforeOfYesterdayString = NSString(string: beforeOfYesterday.description).substringToIndex(10);
//        let toYears = NSString(string: today.description).substringToIndex(4)
//        let dateYears = NSString(string: newDate.description).substringToIndex(4)
//        let timeH = NSString(string: newDate.description).substringWithRange(_NSRange(location: 11, length: 5))
//        let timeG = NSString(string: newDate.description).substringWithRange(_NSRange(location: 5, length: 11))
//        if toYears == dateYears {
//            if dateString == todayString {
//                return "今天 \(timeH)"
//            } else if dateString == yesterdayString {
//                return "昨天 \(timeH)"
//            } else if dateString == beforeOfYesterdayString {
//                return "前天 \(timeH)"
//            } else {
//                return timeG
//            }
//        } else {
//            return dateString
//        }
//    }
  
    
    
}








