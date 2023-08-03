//
//  ContentView.swift
//  HotProspects
//
//  Created by Keenan Chiasson on 8/2/23.
//

import SwiftUI

struct ContentView: View {
    @State private var backgroundColor = Color.red
    
    var body: some View {
        VStack {
            Text("Hello, World!")
                .padding()
                .background(backgroundColor)
            
            Text("Change Color")
                .padding()
                .contextMenu {
                    Button(role: .destructive) {
                        backgroundColor = .red
                    } label : {
                        Label("Red", systemImage: "checkmark.circle.fill")
                    }
                    Button {
                        backgroundColor = .green
                    } label : {
                        Label("Green", systemImage: "checkmark.circle.fill")
                            .foregroundColor(.green)
                    }
                    Button {
                        backgroundColor = .blue
                    } label : {
                        Label("Blue", systemImage: "checkmark.circle.fill")
                            .foregroundColor(.blue)
                    }
                }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
