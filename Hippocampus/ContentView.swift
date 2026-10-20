//
//  ContentView.swift
//  Hippocampus
//
//  Created by Angel Aaron Munoz Alvarez on 19/10/2026.
//

import SwiftUI
import PencilKit

struct ContentView: View {
    @State private var screen = Screen.splash

    @State private var playerCount = 3
    @State private var names = Array(repeating: "", count: 10)
    @State private var roundCount = 3

    @State private var isPlaying = false
    @State private var roundNumber = 1
    @State private var secretWord = ""
    @State private var drawing = PKDrawing()
    @State private var vote = ""

    var body: some View {
        VStack {
            if isPlaying {
                RoundHeader(screen: $screen, isPlaying: $isPlaying, roundNumber: roundNumber, roundCount: roundCount)
            }

            switch screen {
            case .splash:
                SplashView(screen: $screen)
            case .home:
                HomeView(screen: $screen)
            case .pickGame:
                PickGameView(screen: $screen)
            case .playerCount:
                PlayerCountView(screen: $screen, playerCount: $playerCount)
            case .playerNames:
                PlayerNamesView(screen: $screen, names: $names, playerCount: playerCount)
            case .roundCount:
                RoundCountView(screen: $screen, roundCount: $roundCount, roundNumber: $roundNumber, isPlaying: $isPlaying)
            case .writeWord:
                WriteWordView(screen: $screen, word: $secretWord)
            case .passPhone:
                PassPhoneView(screen: $screen)
            case .draw:
                DrawView(screen: $screen, drawing: $drawing, word: secretWord)
            case .timesUp:
                TimesUpView(screen: $screen)
            case .showDrawing:
                ShowDrawingView(screen: $screen, drawing: drawing)
            case .revealWord:
                RevealWordView(screen: $screen, word: secretWord)
            case .vote:
                VoteView(screen: $screen, vote: $vote, names: names, playerCount: playerCount)
            case .voteReveal:
                VoteRevealView(screen: $screen, vote: vote)
            case .punishment:
                PunishmentView(screen: $screen)
            case .roundEnd:
                RoundEndView(screen: $screen, roundNumber: $roundNumber, isPlaying: $isPlaying, roundCount: roundCount)
            case .final:
                FinalView(screen: $screen)
            }
        }
        .padding(24)
        .tint(.black)
    }
}

#Preview {
    ContentView()
}
