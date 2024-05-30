//
//  SCGV.swift
//  Moonshot
//
//  Created by 문창재 on 5/26/24.
//

import SwiftUI

struct SCGV: View {
    let layout1 = [
        GridItem(.fixed(80)),
        GridItem(.fixed(80)),
        GridItem(.fixed(80))
    ] //80사이즈의 그리드 3개 선언
    
    let layout2 = [
        GridItem(.adaptive(minimum: 80)),
    ] // 그리드의 가장 큰 장점은 다양한 화면 크기에서 작업할 수 있다는 점입니다. 다음과 같이 적응형 크기를 사용하여 다른 열 레이아웃을 사용하면 됩니다:

    
    let layout3 = [
        GridItem(.adaptive(minimum: 80, maximum: 120)),
    ] // 최대 최소를 설정해서 더 구체적인 적응형 크기 선언
    
    var body: some View {
        ScrollView(.horizontal) {
            LazyHGrid(rows: layout3) {
                ForEach(0..<1000) {
                    Text("Item \($0)")
                }
            }
        }
        ScrollView {
            LazyVGrid(columns: layout1) {
                ForEach(0..<1000) {
                    Text("Item \($0)")
                }
            }
        }
    }
}

#Preview {
    SCGV()
}
