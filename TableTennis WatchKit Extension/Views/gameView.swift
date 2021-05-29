//
//  gameView.swift
//  TableTennis WatchKit Extension
//
//  Created by Ankish Khatri on 28/05/21.
//

import SwiftUI

struct gameView: View {
    @Environment(\.presentationMode) var presentationMode
    @EnvironmentObject var tennisViewModel: TennisViewModel
    
    @State var isHistory: Bool = false
    var body: some View {
        ScrollView {
            VStack {
                
                ScoreBoard()
                
                Button(action: {
                    tennisViewModel.reset()
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
            .sheet(isPresented: $isHistory, content: {
                MatchHistory()
            })
            .alert(isPresented: $tennisViewModel.isWon, content: {
                getAlert()

                
            })
        }
    }
    

    
    func getAlert() -> Alert {
        Alert(title: Text(tennisViewModel.winner + " has won 🏆"),
              primaryButton: .default(Text("New Match"), action: {
                tennisViewModel.reset()
              }),
              secondaryButton: .default(Text("Match History"), action: {
                tennisViewModel.reset()
                isHistory.toggle()
              }))
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
            .environmentObject(TennisViewModel())
    }
}

struct ScoreBoard: View {
    @EnvironmentObject var tennisViewModel: TennisViewModel
    @State var warningText: String = "Match Point"
    var body: some View {
        VStack {
            if tennisViewModel.matchPoint {
                matchPointView(warningText: $warningText)
            }
            Text("\(tennisViewModel.score1)  -  \(tennisViewModel.score2)")
                .font(.title2)
            Button(action: {
                tennisViewModel.updateScore(score: tennisViewModel.score1, side1: true)
            }, label: {
                Text("Ankish")
            })
            Button(action: {
                tennisViewModel.updateScore(score: tennisViewModel.score2, side1: false)
            }, label: {
                Text("Somu")
            })
            
        }
    }
}
