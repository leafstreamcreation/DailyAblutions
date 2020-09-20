//
//  CatchUpView.swift
//  DailyAblutions
//
//  Created by Derek Noble on 4/13/20.
//  Copyright © 2020 Noble Software. All rights reserved.
//

import SwiftUI

struct CatchUpView: View {
    
    var name: String
    
    
    var body: some View {
        VStack {
            HStack {
                Text("You da best!")
                    .fontWeight(.regular)
                    .foregroundColor(Color.black)
                    .multilineTextAlignment(.leading)
                    .padding(.horizontal)
                    .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                Spacer()
            }
            List(notificationSampleData) { sample in
                ScrollView {
                    Text(sample.text)
                    Text(self.name)
                }
            }
        }
    }
}

struct NotificationScreen_Previews: PreviewProvider {
    static var previews: some View {
        CatchUpView(name: "Beep")
    }
}

