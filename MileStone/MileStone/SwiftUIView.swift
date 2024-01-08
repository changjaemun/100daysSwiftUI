//
//  SwiftUIView.swift
//  MileStone
//
//  Created by 문창재 on 2024/01/09.
//

import SwiftUI

struct SwiftUIView: View {
    var body: some View {
        VStack{
            Image("장미")
                .resizable()
                .frame(width: 200, height: 200)
            Image("라이토")
                .resizable()
                .frame(width: 200, height: 200)
            Image("타카기")
                .resizable()
                .frame(width: 200, height: 200)
        }
        
    }
}

#Preview {
    SwiftUIView()
}
