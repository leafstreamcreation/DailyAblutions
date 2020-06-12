//
//  PageViewController.swift
//  DailyAblutions
//
//  Created by Derek Noble on 6/8/20.
//  Copyright © 2020 Noble Software. All rights reserved.
//

import SwiftUI
import UIKit

struct PageViewController: UIViewControllerRepresentable {
    var m_Controllers: [UIViewController]
    
    
    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }
    
    func makeUIViewController(context: Context) -> UIPageViewController {
        let pageViewController = UIPageViewController(transitionStyle: .scroll, navigationOrientation: .horizontal)
        pageViewController.dataSource = context.coordinator
        return pageViewController
    }
    
    func updateUIViewController(_ pageViewController: UIPageViewController, context: Context) {
        pageViewController.setViewControllers([m_Controllers[0]], direction: .forward, animated: true)
    }
    
    class Coordinator: NSObject, UIPageViewControllerDataSource {
        var parent: PageViewController
        
        
        init(_ pageViewController: PageViewController) {
            self.parent = pageViewController
        }
        
        func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
            guard let index = parent.m_Controllers.firstIndex(of: viewController) else {
                return nil
            }
            if index == 0 {
                return parent.m_Controllers.last
            }
            return parent.m_Controllers[index - 1]
        }
        
        func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
            guard let index = parent.m_Controllers.firstIndex(of: viewController) else {
                return nil
            }
            if index + 1 == parent.m_Controllers.count {
                return parent.m_Controllers.first
            }
            return parent.m_Controllers[index + 1]
        }
    }
}
