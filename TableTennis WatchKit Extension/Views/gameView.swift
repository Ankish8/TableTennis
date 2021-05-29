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
              dismissButton: .default(Text("New Match"), action: {
                tennisViewModel.reset()
              }))
//        Alert(title: Text(tennisViewModel.winner + " has won 🏆"),
//              primaryButton: .default(Text("New Match"), action: {
//                tennisViewModel.reset()
//              }),
//              secondaryButton: .default(Text("Match History"), action: {
//                tennisViewModel.reset()
//                isHistory.toggle()
//              }))
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
        /*VStack {
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
            
        }*/
        VStack {
            HStack {
                    ZStack {
                        Rectangle()
                            .frame(width: 76, height: 99, alignment: .center)
                            
                            .foregroundColor(Color(#colorLiteral(red: 0.1254901961, green: 0.5803921569, blue: 0.9803921569, alpha: 1)))
                            .cornerRadius(15)
                        VStack {
                            
                            Text("\(tennisViewModel.score1)")
                                .font(.title)
                                .offset(y: -5)
                                .foregroundColor(Color(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)))
                            Rectangle()
                                .frame(width: 54, height: 0.89)
                                .foregroundColor(Color(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)))
                                .offset(y: -15)
                            Text("Ankish")
                                .font(.system(size: 15))
                                .offset(y: -10)
                        }
                            
                    }
                    .onTapGesture {
                        tennisViewModel.updateScore(score: tennisViewModel.score1, side1: true)
                    }
                    
                    
                
                Spacer()
                
                Spacer()
                ZStack {
                    Rectangle()
                        .frame(width: 76, height: 99, alignment: .center)
                        
                        .foregroundColor(Color(#colorLiteral(red: 0.2039215686, green: 0.7803921569, blue: 0.3490196078, alpha: 1)))
                        .cornerRadius(15)
                    VStack {
                        
                        Text("\(tennisViewModel.score2)")
                            .font(.title)
                            .offset(y: -5)
                            .foregroundColor(Color(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)))
                        Rectangle()
                            .frame(width: 54, height: 0.89)
                            .foregroundColor(Color(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)))
                            .offset(y: -15)
                        Text("Somu")
                            .font(.system(size: 15))
                            .offset(y: -10)
                    }
                        
                }
                .onTapGesture {
                    tennisViewModel.updateScore(score: tennisViewModel.score2, side1: false)
                }
            }
            Spacer()
            HStack {
                Image(systemName: "clock")
                Text("Recent Matches").font(.system(size: 15))
                Spacer()
            }
            .padding(.bottom, 3)
            .padding(.top, 3)
            
            HStack {
                if (tennisViewModel.matchcount == 0) {
                    Text("There are no recent mathes to show. 😕")
                        .font(.system(size: 12))
                        .foregroundColor(.gray)
                    
                }
                else {
                    ForEach(tennisViewModel.match) { recent in
                        RecentView(recent: recent)
                    }
                    Spacer()
                }
               
            }
            
            
        }
        .padding()
    }
}
