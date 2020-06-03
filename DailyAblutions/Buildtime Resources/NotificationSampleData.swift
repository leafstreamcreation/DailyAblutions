//
//  NotificationSampleData.swift
//  DailyAblutions
//
//  Created by Derek Noble on 5/29/20.
//  Copyright © 2020 Noble Software. All rights reserved.
//

import UIKit
import SwiftUI

let notificationSampleData: [NotificationSample] =  [
    NotificationSample(text: "Not a Complete", id: 0),
    NotificationSample(text: "Software Blog", id: 1),
    NotificationSample(text: "Review: Workout Methodology", id: 2)
]

struct NotificationSample: Identifiable {
    var text: String
    var id: Int
}

