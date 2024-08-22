//
//  ContentView.swift
//  Kadai6
//
//  Created by nobu0621 on 2024/08/20.
//

import SwiftUI

struct ContentView: View {
    // arc4random_uniformが0~99の範囲の値を返すため、1を足して1~100の範囲にする
    @State private var randomNumber = Int(arc4random_uniform(100)) + 1
    @State private var selectedValue = 1.0
    
    @State private var showAlert = false
    @State private var message = ""
    
    var body: some View {
        VStack(spacing: 30) {
            Text(String(randomNumber))
                .font(.largeTitle)
            Slider(value: $selectedValue, in: 1...100)
            HStack{
                Text("1")
                Spacer()
                Text("100")
            }
            Button("判定！") {
                showAlert = true
                let result: String = if randomNumber == Int(selectedValue) {
                    "あたり!"
                } else {
                    "はずれ!"
                }
                message = result + "\nあなたの値:　\(Int(selectedValue))"
            }
            .alert(isPresented: $showAlert) {
                Alert(title: Text("結果"), message: Text(message), dismissButton: .default(Text("再挑戦"), action: resetRandomNumberAndSelectedValue)
                )
            }
            Spacer()
        }
        .padding()
    }
    
    func resetRandomNumberAndSelectedValue() -> Void {
        selectedValue = 50.0
        randomNumber = Int(arc4random_uniform(100)) + 1
    }
}

#Preview {
    ContentView()
}
