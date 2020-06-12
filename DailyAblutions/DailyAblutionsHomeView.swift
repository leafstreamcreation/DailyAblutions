//
//  DailyAblutionsHomeView.swift
//  DailyAblutions
//
//  Created by Derek Noble on 6/3/20.
//  Copyright © 2020 Noble Software. All rights reserved.
//

import SwiftUI

struct DailyAblutionsHomeView<Page: View>: View {
    
    var m_ViewControllers: [UIHostingController<Page>]
    
    init(_ views: [Page]) {
        self.m_ViewControllers = views.map { UIHostingController(rootView: $0) }
    }
    
    var body: some View {
        PageViewController(m_Controllers: m_ViewControllers)
    }
}

struct DailyAblutionsHomeView_Previews: PreviewProvider {
    static var previews: some View {
        DailyAblutionsHomeView<CatchUpView>([CatchUpView(), CatchUpView()])
    }
}
