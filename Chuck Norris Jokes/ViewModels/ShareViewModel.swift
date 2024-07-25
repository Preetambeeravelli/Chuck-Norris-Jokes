//
//  ShareViewModel.swift
//  Chuck Norris Jokes
//
//  Created by Preetam Beeravelli on 7/25/24.
//

import UIKit
import SwiftUI

class ShareViewModel{
    let text: String
    init(text: String){
        self.text = text
    }
    func shareText() {
        let avc = UIActivityViewController(activityItems: [text], applicationActivities: nil)
        UIApplication.shared.windows.first?.rootViewController?.present(avc, animated: true, completion: nil)
    }
}
