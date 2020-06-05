//
//  ReminderListView.swift
//  DailyAblutions
//
//  Created by Derek Noble on 5/29/20.
//  Copyright © 2020 Noble Software. All rights reserved.
//

import SwiftUI

struct ReminderListView: View {
    var body: some View {
        VStack {
            HStack {
                Text("Mantras")
                    .font(.title)
                    .padding()
                Spacer()
            }
            HStack {
                Button(action: {
                    print("New Button Pushed")
                }) {
                Text("New")
                }
                .padding()
                .background(Color.yellow)
                Spacer()
                EditButton()
                .padding()
                    .background(Color.yellow)
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
        ReminderListView()
    }
}
