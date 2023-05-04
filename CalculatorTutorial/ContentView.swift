//
//  ContentView.swift
//  CalculatorTutorial
//
//  Created by yanghj on 2023/05/03.
//

import SwiftUI

struct ContentView: View {
    
    @State private var totalNumber: String = "0"
    
    private let buttonData: [[String]] = [
        ["C", "+/-", "%", "÷"],
        ["7", "8", "9", "X"],
        ["4", "5", "6", "-"],
        ["1", "2", "3", "+"],
        ["0", "0", ".", "="],
    ]
    
    var body: some View {
        ZStack {
            Color.black.ignoresSafeArea()
            
            VStack {
                Spacer()
                HStack{
                    Spacer()
                    Text(totalNumber)
                        .padding()
                        .font(.system(size: 73))
                        .foregroundColor(.white)
                }
                
                ForEach(buttonData, id: \.self) { line in
                    HStack {
                        ForEach(line, id: \.self) {row in
                            Button {
                                if (row == "C") {
                                    totalNumber = "0"
                                }
                                else if (totalNumber == "0") {
                                    totalNumber = row
                                }
                                else {
                                    totalNumber += row
                                }
                            } label: {
                                if (row == "÷" || row == "X" || row == "-" || row == "+" || row == "=") {
                                    Text(row)
                                        .frame(width: 80,
                                               height: 80)
                                        .background(Color(red: 0.993, green: 0.619, blue: 0.023))
                                        .cornerRadius(40)
                                        .foregroundColor(.white)
                                        .font(.system(size: 33))
                                }
                                else {
                                    Text(row)
                                        .frame(width: 80,
                                               height: 80)
                                        .background(Color(red: 0.141, green: 0.0, blue: 0.0))
                                        .cornerRadius(40)
                                        .foregroundColor(.white)
                                        .font(.system(size: 33))
                                }
                                
                            }
                            
                        }
                    }
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ContentView()                .previewDevice(PreviewDevice(rawValue: "iPhone 14"))
        }
       
    }
}
