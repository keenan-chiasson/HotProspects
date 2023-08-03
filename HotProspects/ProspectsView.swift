//
//  ProspectsView.swift
//  HotProspects
//
//  Created by Keenan Chiasson on 8/3/23.
//

import SwiftUI

struct ProspectsView: View {
    @EnvironmentObject var prospects: Prospects
    
    let filter: FilterType
    
    var title: String {
        switch filter {
        case .none:
            return "Everyone"
        case .contacted:
            return "Contacted people"
        case .uncontacted:
            return "Uncontacted people"
        }
    }
    
    var body: some View {
        NavigationView {
            Text("People: \(prospects.people.count)")
                .navigationTitle(title)
                .toolbar {
                    Button {
                        let prospect = Prospect()
                        prospect.name = "Keenan Chiasson"
                        prospect.emailAddress = "keenan.chiasson@acstexas.com"
                        prospects.people.append(prospect)
                    } label: {
                        Label("Scan", systemImage: "qrcode.viewfinder")
                    }
                }
        }
    }
}

enum FilterType {
    case none, contacted, uncontacted
}

struct ProspectsView_Previews: PreviewProvider {
    static var previews: some View {
        ProspectsView(filter: .none)
    }
}
