//
//  gameView.swift
//  TableTennis WatchKit Extension
//
//  Created by Ankish Khatri on 28/05/21.
//

import SwiftUI

struct gameView: View {
    @Environment(\.presentationMode) var presentationMode
    @State var score1: Int = 0
    @State var score2: Int = 0
    @State var matchPoint: Bool = false
    @State var warningText: String = "Match Point"
    @State var isWon: Bool = false
    @State var winner: String = ""
    var body: some View {
        ScrollView {
            VStack {
                if matchPoint {
                    matchPointView(warningText: $warningText)
                }
                Text("\(score1)  -  \(score2)")
                    .font(.title2)
                Button(action: {
                    score1 += 1
                    checkGamePoint()
                }, label: {
                    Text("Player 1")
                })
                Button(action: {
                    score2 += 1
                    checkGamePoint()
                }, label: {
                    Text("Player 2")
                })
                
                Button(action: {
                    score1 = 0
                    score2 = 0
                }, label: {
                    Text("Reset")
                        .foregroundColor(.green)
                    
                })
                .offset(y: 30)
                
                Button(action: {
                    presentationMode.wrappedValue.dismiss()
                }, label: {
                    Text("Cancel")
                        .foregroundColor(.red)
                    
                })
                .offset(y: 30)
            }
            .alert(isPresented: $isWon, content: {
                getAlert()
            })
        }
    }
    
    func getAlert() -> Alert {
        Alert(title: Text(winner + " has won 🏆"),
              primaryButton: .default(Text("New Match"), action: {
                score1 = 0
                score2 = 0
                matchPoint = false
              }),
              secondaryButton: .destructive(Text("Exit"), action: {
                presentationMode.wrappedValue.dismiss()
              }))
//        return Alert(title: Text(winner + " has won 🏆"))
    }

    func checkGamePoint() {
        if score1 <= 10 && score2 <= 10 {
            if (score1 == 10 && score2 == 10) {
                matchPoint = false
            }
            else if (score1 == 10 || score2 == 10) {
                matchPoint = true
            }
        }
        else {
             
            if score1 > score2 + 1 {
                winner = "Player 1"
                isWon.toggle()
                
            }
            else if score2 > score1 + 1 {
                winner = "Player 2"
                isWon.toggle()
                
            }
            else if score1 != score2 {
               matchPoint = true
           }
            else {
                matchPoint = false
            }
        }
    }
    
}


struct matchPointView: View {
    @Binding var warningText: String
    var body: some View {
        Text(warningText)
            .fontWeight(.medium)
            .foregroundColor(.white)
            .padding(.horizontal)
            .background(Color(#colorLiteral(red: 0.7254902124, green: 0.4784313738, blue: 0.09803921729, alpha: 1)))
    }
}

struct gameView_Previews: PreviewProvider {
    static var previews: some View {
        gameView()
    }
}
