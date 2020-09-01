//
//  CalendarViewWrapper.swift
//  SwiftUI-KDCalendar
//
//  Created by Austin Gladfelter on 9/1/20.
//  Copyright © 2020 aegladfelter. All rights reserved.
//

import Foundation
import SwiftUI
import UIKit

public struct THECalendar: UIViewRepresentable {
    var date: Date = .init()
    //typealias UIViewControllerType = UIViewController
    
    public func makeUIView(context: Context) -> CalendarView {
        let UIcalendar: CalendarView = .init()
        UIcalendar.setDisplayDate(self.date, animated: false)
        UIcalendar.selectDate(self.date)

        // you can access corrdinator from a context where needed
        context.coordinator.Ccalendar = UIcalendar
        UIcalendar.dataSource = context.coordinator
        UIcalendar.delegate = context.coordinator

        return UIcalendar;
    }

    
    public class Coordinator: NSObject, CalendarViewDelegate, CalendarViewDataSource {
        var Ccalendar: CalendarView!
        public func calendar(_ calendar: CalendarView, didDeselectDate date: Date) {print("didDeselect")}
        public func calendar(_ calendar: CalendarView, didScrollToMonth date: Date) {print("did scrollToMonth")}
        public func calendar(_ calendar: CalendarView, didSelectDate date: Date, withEvents events: [CalendarEvent]) {print("didSelectDateWithEvents")}
        public func calendar(_ calendar: CalendarView, didLongPressDate date: Date, withEvents events: [CalendarEvent]?) {
            print("did long press")
            //Trying to manually ad a hardcoded Event.
            self.Ccalendar.addEvent("test123", date: Date())
            
            if let events = events {
                          for event in events {
                              print("\t\"\(event.title)\" - Starting at:\(event.startDate)")
                          }
                      }
            
                      
                      let alert = UIAlertController(title: "Create New Event", message: "Message", preferredStyle: .alert)
                      
                      alert.addTextField { (textField: UITextField) in
                          textField.placeholder = "Event Title"
                      }
                      
                      let addEventAction = UIAlertAction(title: "Create", style: .default, handler: { (action) -> Void in
                          let title = alert.textFields?.first?.text
                          self.Ccalendar.addEvent(title!, date: date)
                      })
                      
                      let cancelAction = UIAlertAction(title: "Cancel", style: .destructive, handler: nil)
                      
                      alert.addAction(addEventAction)
                      alert.addAction(cancelAction)
                      
                      //self.present(alert, animated: true, completion: nil)
        }

        public func calendar(_ calendar: CalendarView, canSelectDate date: Date) -> Bool {
        return true
        }
            
        public func startDate() -> Date {
            return Date.init()
        }

      public func endDate() -> Date {
            var month:DateComponents = .init()
            month.month = 6
            return Calendar.current.date(byAdding: month, to: Date.init())!
        }

        public func headerString(_ date: Date) -> String? {
            return nil
        }
        

    }
    
    public func makeCoordinator() -> Coordinator {
        // you can pass anything in constructor arguments here
        Coordinator()
    }
    
    public func updateUIView(_ UIcalendar: CalendarView, context: Context) {
        UIcalendar.selectDate(self.date)
    }
}
