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

// MARK: ScoreBoard View
struct ScoreBoard: View {
    @EnvironmentObject var tennisViewModel: TennisViewModel
    
    
//    let generator = UINotificationFeedbackGenerator()
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
            
            if tennisViewModel.MatchPoint {
                RoundedRectangle(cornerRadius: 10)
                    .foregroundColor(Color.red)
                    .frame(width: 150, height: 30, alignment: .center)
                    .overlay(
                        Text("Match Point 🏆")
                            .foregroundColor(.white)
                    )
                    .transition(.asymmetric(insertion: .move(edge: .top), removal: .move(edge: .top)))
                    
                    .animation(.easeInOut)
                    
            }
            HStack {
                    ZStack {
                        Rectangle()
//                            .fill(RadialGradient(gradient: Gradient(colors: [Color(#colorLiteral(red: 0.9921568627, green: 0.262745098, blue: 0.262745098, alpha: 1)), Color.blue]), center: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/, startRadius: /*@START_MENU_TOKEN@*/5/*@END_MENU_TOKEN@*/, endRadius: 160))
                            .fill(AngularGradient(gradient: Gradient(colors: [Color.blue, Color.red]), center: .topLeading))
                            .frame(width: 76, height: 99, alignment: .center)
//                            .foregroundColor(Color(#colorLiteral(red: 0.1254901961, green: 0.5803921569, blue: 0.9803921569, alpha: 1)))
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
                            Text("\(tennisViewModel.playerName1)")
                                .font(.system(size: 15))
                                .offset(y: -10)
                        }
                            
                    }
                    .onTapGesture {
                        
                        tennisViewModel.updateScore(score: tennisViewModel.score1, side1: true)
                        WKInterfaceDevice.current().play(.click)

                    }
                    
                    
                
                Spacer()
                
                Spacer()
                ZStack {
                    Rectangle()
                        .fill(AngularGradient(gradient: Gradient(colors: [Color(#colorLiteral(red: 0.2039215686, green: 0.7803921569, blue: 0.3490196078, alpha: 1)), Color.red]), center: .topLeading))
                        

//                        .fill(RadialGradient(gradient: Gradient(colors: [Color.purple, Color.red]), center: .center, startRadius: 5, endRadius: 180))
                        .frame(width: 76, height: 99, alignment: .center)
                        
//                        .foregroundColor(Color(#colorLiteral(red: 0.2039215686, green: 0.7803921569, blue: 0.3490196078, alpha: 1)))
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
                        Text("\(tennisViewModel.playerName2)")
                            .font(.system(size: 15))
                            .offset(y: -10)
                    }
                        
                }
                .onTapGesture {
                    
                    tennisViewModel.updateScore(score: tennisViewModel.score2, side1: false)
                    WKInterfaceDevice.current().play(.click) // Performs Haptic Feedback
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
                if (tennisViewModel.match.isEmpty) {
                    Text("There are no recent mathes to show. 😕")
                        .font(.system(size: 12))
                        .foregroundColor(.gray)
                    
                }
                else {
                    HStack {
                        ScrollView(.horizontal, showsIndicators: false) {
                            ScrollViewReader { value in
                                HStack {
                                    ForEach(tennisViewModel.match) { recent in
                                        RecentView(recent: recent)
                                        
                                        
                                    }
                                    
                                }
                                // MARK: ScrollView
                                .onAppear() {
                                    if tennisViewModel.matchcount != 0 {
                                        value.scrollTo(tennisViewModel.match[tennisViewModel.matchcount-1].id)
                                    }
                                    
                                }
                                
                            }
                            
                            
                        }
                        
                        
                        Divider()
                            
                        Spacer()
                        Image(systemName: "heart.fill")
                            .foregroundColor(.red)
                        Text("103")
                    }
                    Spacer()
                }
               
            }
            
            
        }
        .padding()
        
    }
    
}

