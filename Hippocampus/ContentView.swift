//
//  ContentView.swift
//  Hippocampus
//
//  Created by Angel Aaron Munoz Alvarez on 19/10/2026.
//

import SwiftUI
import PencilKit

struct ContentView: View {
    @State private var screen = Screen.home

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
                RoundHeader(screen: $screen, isPlaying: $isPlaying, roundNumber: roundNumber, roundCount: roundCount, step: roundStep())
            }

            switch screen {
            case .home:
                HomeView(screen: $screen)
            case .players:
                PlayersView(screen: $screen, playerCount: $playerCount, names: $names)
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
            case .flashScreen:
                FlashScreenView(screen: $screen)
            case .guessWord:
                GuessWordView(screen: $screen, drawing: drawing)
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
        .padding(.horizontal, 30)
        .padding(.top, 16)
        .padding(.bottom, 20)
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background {
            Image(backgroundImage())
                .resizable()
                .scaledToFill()
                .ignoresSafeArea()
        }
        .onChange(of: screen) {
            if screen == .home {
                resetGame()
            }
        }
        .preferredColorScheme(.light)
    }

    func resetGame() {
        playerCount = 3
        names = Array(repeating: "", count: 10)
        roundCount = 3
        isPlaying = false
        roundNumber = 1
        secretWord = ""
        drawing = PKDrawing()
        vote = ""
    }

    func backgroundImage() -> String {
        switch screen {
        case .home, .writeWord, .punishment, .final:
            return "BackgroundLeaves"
        case .players, .draw, .guessWord:
            return "BackgroundStar"
        case .roundCount:
            return "BackgroundGrid"
        default:
            return "BackgroundSun"
        }
    }

    func roundStep() -> Int {
        switch screen {
        case .writeWord:
            return 1
        case .passPhone:
            return 2
        case .draw, .timesUp:
            return 3
        case .flashScreen:
            return 4
        case .guessWord:
            return 5
        case .revealWord:
            return 6
        case .vote:
            return 7
        case .voteReveal:
            return 8
        case .punishment:
            return 9
        default:
            return 10
        }
    }
}

#Preview {
    ContentView()
}
