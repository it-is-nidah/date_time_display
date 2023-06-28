//
//  ContentView.swift
//  Clock
//
//  Created by Leonidah Chepkoech on 6/13/23.
//

import SwiftUI

struct ContentView: View {
    @State var date = Date()
//    some keyword - is for opaque types and returns any View regardless of its specific contents.
    var body: some View {
        ZStack {
            Color.clear
            VStack {
                
                Text("Hello, Leo!")
                    .fontWeight(.bold)
                    .foregroundColor(Color.orange)
                    .font(.largeTitle)
                Text(greeting()).font(.title)
                Text("The current date and time is: ").font(.title2).foregroundColor(Color.mint).multilineTextAlignment(.center).padding(.all, 5.0)
                Text("\(timeString(date: date))")
                    .onAppear(perform: {let _ = self.updateTimer})
                    .font(.title3)
                    .foregroundColor(Color(hue: 0.528, saturation: 0.945, brightness: 0.902))
                    .multilineTextAlignment(.center)
            }
        }
        .padding()
    }
    var timeFormat: DateFormatter{
        let formatter = DateFormatter()
        formatter.dateFormat = "EEEE, MMM d, yyyy HH:mm"
        return formatter
    }
    func timeString(date: Date) -> String {
        let time = timeFormat.string(from: date)
        return time
    }
//    Timer.scheduledTimer - method that creates the timer
//    withTimeInterval - the frequency at which the block is executed
//    repeats - indicates that the block should execute continuously with respect to the given time interval => 1
//    block - is the operation to be excuted
    var updateTimer: Timer {
        Timer.scheduledTimer(withTimeInterval: 1, repeats: true, block: {_ in
            self.date = Date()
        })
    }
    func greeting() -> String {
        var greet = ""
        
        let midNight0 = Calendar.current.date(bySettingHour: 0, minute: 00, second: 00, of: date)!
        let nightEnd = Calendar.current.date(bySettingHour: 3, minute: 59, second: 59, of: date)!
        let morningStart = Calendar.current.date(bySettingHour: 4, minute: 00, second: 0, of: date)!
        let morningEnd = Calendar.current.date(bySettingHour: 11, minute: 59, second: 59, of: date)!
        let noonStart = Calendar.current.date(bySettingHour: 12, minute: 00, second: 00, of: date)!
        let noonEnd = Calendar.current.date(bySettingHour: 16, minute: 59, second: 59, of: date)!
        let eveStart = Calendar.current.date(bySettingHour: 17, minute: 00, second: 00, of: date)!
        let eveEnd = Calendar.current.date(bySettingHour: 20, minute: 59, second: 59, of: date)!
        let nightStart = Calendar.current.date(bySettingHour: 21, minute: 00, second: 00, of: date)!
        let midNight24 = Calendar.current.date(bySettingHour: 23, minute: 59, second: 59, of: date)!
        
        if ((date >= midNight0) && (nightEnd >= date)) {
             greet = "Good Night😴"
        } else if ((date >= morningStart) && (morningEnd >= date)) {
             greet = "Good Morning🌞"
        } else if ((date >= noonStart) && (noonEnd >= date)) {
             greet = "Good Afternoon🌤️"
        } else if ((date >= eveStart) && (eveEnd >= date)) {
             greet = "Good Evening🌥️"
        } else if ((date >= nightStart) && (midNight24 >= date)) {
             greet = "Good night😴"
        }
        return greet
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
