//
//  ContentView.swift
//  HotProspects
//
//  Created by Keenan Chiasson on 8/2/23.
//

import SwiftUI
import UserNotifications

struct ContentView: View {
    var body: some View {
        VStack {
            Button("Request Permission") {
                UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .badge, .sound]) { success, error in
                    if success {
                        print("All set!")
                    } else if let error = error {
                        print(error.localizedDescription)
                    }
                }
            }
            
            Button("Schedule Notification") {
                // define the content
                let content = UNMutableNotificationContent()
                content.title = "Feed the cat"
                content.subtitle = "It looks hungry"
                content.sound = UNNotificationSound.default
                
                // define the trigger
                // i.e. show this notification 5 secs from now
                let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 5, repeats: false)
                
                // combine the two (choose a random id)
                let request = UNNotificationRequest(identifier: UUID().uuidString, content: content, trigger: trigger)
                
                // add our notification request
                UNUserNotificationCenter.current().add(request)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
