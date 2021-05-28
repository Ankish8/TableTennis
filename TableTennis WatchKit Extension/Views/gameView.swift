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
    @State var warningText: String = "Match Point"
    @State var isHistory: Bool = false
    var body: some View {
        ScrollView {
            VStack {
                
                if tennisViewModel.matchPoint {
                    matchPointView(warningText: $warningText)
                }
                Text("\(tennisViewModel.score1)  -  \(tennisViewModel.score2)")
                    .font(.title2)
                Button(action: {
                    tennisViewModel.score1 += 1
                    tennisViewModel.checkGamePoint()
                }, label: {
                    Text("Ankish")
                })
                Button(action: {
                    tennisViewModel.score2 += 1
                    tennisViewModel.checkGamePoint()
                }, label: {
                    Text("Somu")
                })
                
                Button(action: {
                    tennisViewModel.score1 = 0
                    tennisViewModel.score2 = 0
                    tennisViewModel.matchPoint = false
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
                TournamentScoreView()
            })
            .alert(isPresented: $tennisViewModel.isWon, content: {
                getAlert()

                
            })
        }
    }
    

    
    func getAlert() -> Alert {
        Alert(title: Text(tennisViewModel.winner + " has won 🏆"),
              primaryButton: .default(Text("New Match"), action: {
                tennisViewModel.score1 = 0
                tennisViewModel.score2 = 0
                tennisViewModel.matchPoint = false
                tennisViewModel.isWon = false
              }),
              secondaryButton: .default(Text("Match History"), action: {
                tennisViewModel.score1 = 0
                tennisViewModel.score2 = 0
                tennisViewModel.matchPoint = false
                tennisViewModel.isWon = false
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
