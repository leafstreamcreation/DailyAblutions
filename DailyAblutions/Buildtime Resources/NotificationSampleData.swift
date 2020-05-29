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
    NotificationSample(text: "Review: Workout Methodology", id: 2),
    NotificationSample(text: "I", id: 3),
    NotificationSample(text: "Ain't", id: 4),
    NotificationSample(text: "Happy", id: 5),
    NotificationSample(text: "I'm", id: 6),
    NotificationSample(text: "Feeling", id: 7),
    NotificationSample(text: "Glad", id: 8),
    NotificationSample(text: "I", id: 9),
    NotificationSample(text: "Got", id: 10),
    NotificationSample(text: "Sunshine", id: 11),
    NotificationSample(text: "In", id: 12),
    NotificationSample(text: "A", id: 13),
    NotificationSample(text: "Bag", id: 14),
    NotificationSample(text: "I'm", id: 15),
    NotificationSample(text: "Useless", id: 16),
    NotificationSample(text: "But", id: 17),
    NotificationSample(text: "Not", id: 18),
    NotificationSample(text: "For", id: 19),
    NotificationSample(text: "Long", id: 20)
]

struct NotificationSample: Identifiable {
    var text: String
    var id: Int
}

