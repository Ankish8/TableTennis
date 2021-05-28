//
//  MatchModel.swift
//  TableTennis
//
//  Created by Ankish Khatri on 28/05/21.
//


import Foundation
struct Matches : Identifiable {
    let id = UUID()
    let player1Score: Int
    let player2Score: Int
    let winnerName: String
    let MatchCount: Int
}
