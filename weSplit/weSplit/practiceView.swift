//
//  practiceView.swift
//  weSplit
//
//  Created by 문창재 on 2023/11/14.
//

import SwiftUI

struct practiceView: View {
    //View 프로토콜을 만족하는 새 구조체
    @State private var name = ""
    // 상태가 변경되기 위해 @State 작성해줘야한다.
    let students = ["harry","ron","malpoy"]
    @State private var selectedStudent = ""
    var body: some View {
        // View 프로토콜을 만족하는 연산 프로퍼티
        // View라는 프로토콜은 some View타입의 연산 프로퍼티만 반환하면 된다.
        NavigationStack{
            Form{
                Section{
                    Text("hello world")
                    Text("hello world2")
                    Text("hello world3")
                }
                Section{
                    TextField("Type your name", text: $name)
                    Text("this is your name: \(name)")
                    // 읽기만 할 뿐 다시 쓰지는 않으니 바인딩 하지 않는다.
                }
                Section{
                    Picker("Select your student", selection: $selectedStudent) {
                        ForEach(students, id:\.self){
                            Text($0)
                        }
                    }
                }
                
            }.navigationTitle("SwiftUI")
                .navigationBarTitleDisplayMode(.inline)
        }
        
    }}

struct practiceView_Previews: PreviewProvider {
    static var previews: some View {
        practiceView()
    }
}
