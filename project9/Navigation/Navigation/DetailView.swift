//
//  DetailView.swift
//  Navigation
//
//  Created by 문창재 on 5/30/24.
//

import Foundation
import SwiftUI

struct DetailView: View {
    var number: Int

    var body: some View {
        Text("Detail View \(number)")
    }

    init(number: Int) {
        self.number = number
        print("Creating detail view \(number)")
    }
}
