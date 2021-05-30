//
//  gameView.swift
//  TableTennis WatchKit Extension
//
//  Created by Ankish Khatri on 28/05/21.
//

import SwiftUI
// MARK: GameView
struct gameView: View {
    @Environment(\.presentationMode) var presentationMode
    @EnvironmentObject var tennisViewModel: TennisViewModel
    
    @State var isHistory: Bool = false
    var body: some View {
        
            ScrollView {
                VStack {
                    
                    ScoreBoardView()
                    
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
    

    // MARK: Alert
    func getAlert() -> Alert {
        Alert(title: Text(tennisViewModel.winner + " has won 🏆"),
              dismissButton: .default(Text("New Match"), action: {
                tennisViewModel.reset()
              }))
    }

    
}

struct gameView_Previews: PreviewProvider {
    static var previews: some View {
        
        gameView()
            .environmentObject(TennisViewModel())
    }
}
