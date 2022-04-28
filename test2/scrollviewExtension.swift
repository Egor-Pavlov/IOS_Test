//
//  scrollviewExtension.swift
//  test2
//
//  Created by User on 28.04.2022.
//

import Foundation
import UIKit
extension UIScrollView
{
    func resizeContentSize()
    {

        var contentRect = CGRect.zero;
        
        for view in self.subviews
        {
            contentRect = contentRect.union((view ).frame);
        }
        
        self.contentSize = contentRect.size

    }
}
