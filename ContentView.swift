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
        VStack {
            
            Text("Hello, Leo!")
                .fontWeight(.bold)
                .foregroundColor(Color.orange)
                .font(.largeTitle)
            
            Text("\(timeString(date: date))")
                .font(.body)
                .foregroundColor(Color(hue: 0.528, saturation: 0.945, brightness: 0.902))
                .multilineTextAlignment(.center)
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
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
