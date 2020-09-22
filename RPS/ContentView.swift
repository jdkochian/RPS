//
//  ContentView.swift
//  RPS
//
//  Created by Jacob Kochian on 9/21/20.
//

import SwiftUI

struct ContentView: View {
    let options = ["Rock", "Paper", "Scissors"]
    @State private var cpuThrow = Int.random(in: 0 ..< 3)
    @State public var winTrue = Bool.random()
    @State private var total = 0
    @State private var attempts = 0
    @State private var gameOver = false
    
    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: [Color.red, Color.blue]), startPoint: .top, endPoint: .bottom).edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
            
            VStack {
                VStack(spacing: 10) {
            
                    Text("Try and \(choosePick(winTrue)) CPU throws:").font(.title2)
            
                    Image("\(options[cpuThrow])").resizable().frame(width: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, height: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                }.padding(.top, 100.0).padding(.bottom, 100.0).font(.title).foregroundColor(.white)
         
                Text("Tap Your Selection: ").foregroundColor(.white)
        
        
                HStack(alignment: .center) {
                    ForEach(0 ..< 3) { number in
                        Button(action: {
                            self.choiceMade(number)
                        }) {
                            Image("\(options[number])").resizable().frame(width: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, height: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                        }
                    }
                }.padding(.bottom, 30.0)
                
                Text("Current Score: \(total)").foregroundColor(.white)
                Spacer()
        
        .alert(isPresented: $gameOver) {
            Alert(title: Text("Game Over"), message: Text("Your score: \(total)"), dismissButton: .default(Text("Continue")) {
                attempts = 0
                total = 0
                })
            }
        }
    }
}
    
    func choosePick (_ boo: Bool) -> String {
        if boo {
            return "win!"
        }
        else {
            return "lose!"
        }
    }
    
    func choiceMade (_ num: Int) {
        if winTrue {
            if (num > cpuThrow) || (cpuThrow == 2 && num == 0) {
                total += 1
            }
        }
        else {
            if (num < cpuThrow) || (cpuThrow == 0 && num == 2) {
                total += 1
            }
        }
        winTrue = Bool.random()
        attempts += 1
        cpuThrow = Int.random(in: 0 ..< 3)
        if attempts == 10 {
            gameOver = true
        }
    }

}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ContentView()
            ContentView()
        }
    }
}
