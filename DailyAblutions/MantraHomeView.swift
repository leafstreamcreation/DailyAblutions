//
//  MantraHomeView.swift
//  DailyAblutions
//
//  Created by Derek Noble on 5/29/20.
//  Copyright © 2020 Noble Software. All rights reserved.
//

import SwiftUI

struct MantraHomeView: View {
    var body: some View {
        VStack {
            HStack {
                Button(action: ) {
                Text("New Mantra")
                }
                .padding()
                Spacer()
                EditButton()
                .padding()
            }
            List(notificationSampleData) { sample in
                ScrollView {
                    Text(sample.text)
                }
            }
        }
    }
}

struct ReminderScreen_Previews: PreviewProvider {
    static var previews: some View {
        MantraHomeView()
    }
}
