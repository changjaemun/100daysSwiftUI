//
//  CustomContainer.swift
//  ViewsAndModifier
//
//  Created by 문창재 on 2024/01/04.
//

import SwiftUI

struct CustomContainer: View {
    func testView(row:Int, col:Int) -> some View{
        Text("row\(row),col\(col)")
    }
    var body: some View {
        VStack{
            GridStack(rows: 4, columns: 4) { row, col in
                Text("R\(row), C\(col)")
            }
            GridStack(rows: 4, columns: 4) { row, col in
                HStack {
                    Image(systemName: "\(row * 4 + col).circle")
                    Text("R\(row) C\(col)")
                }
            }
            GridStack(rows: 3, columns: 3, content: testView(row:col:))
        }
    }
}

struct GridStack<Content: View>: View {
    let rows: Int
    let columns: Int
    let content: (Int, Int) -> Content // 클로저 

    var body: some View {
        VStack {
                ForEach(0..<rows, id: \.self) { row in
                    HStack {
                        ForEach(0..<columns, id: \.self) { column in
                            content(row, column)
                        }
                    }
                }
            }
    }
}

#Preview {
    CustomContainer()
}
