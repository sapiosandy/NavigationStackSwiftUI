//
//  ContentView.swift
//  NavigationStackSwiftUI
//
//  Created by Sandra Gomez on 4/30/24.
//

import SwiftUI

class Broadcast: ObservableObject {
    @Published var message = "Shared Text"
}

struct ContentView: View {
    
    @ObservedObject var shareMe = Broadcast()
    
    var body: some View {
        NavigationStack {
            VStack (spacing: 25) {
                NavigationLink {
                    SecondView()
                } label: {
                    Text("Go to second view")
                }
                Text("Initial View")
            }.navigationTitle("First View")
        }.environmentObject(shareMe)
    }
    
    struct SecondView: View {
        @EnvironmentObject var junkHere: Broadcast
        var body: some View {
            ZStack { 
                Rectangle()
                    .foregroundColor(.orange)
                VStack {
                    Text ("Second View + \(junkHere.message)")
                    NavigationLink {
                        ThirdView()
                    } label: {
                        Text("Go to third view")
                    }
                }.navigationTitle("Second View")
            }
        }
    }
    
    struct ThirdView : View {
        @EnvironmentObject var stuffHere: Broadcast
        var body: some View {
            ZStack {
                Rectangle()
                    .foregroundColor(.purple)
                VStack {
                    Text ("Third View + \(stuffHere.message)")
                    NavigationLink {
                        LastView()
                    } label : {
                        Text ("Go to last view")
                    }
                }.navigationTitle("Third View")
            }
        }
    }
    
    struct LastView: View {
        @EnvironmentObject var anotherString: Broadcast
        var body: some View {
            ZStack {
                Rectangle()
                    .foregroundColor(.pink)
                TextField ("Type here", text: $anotherString.message)
                }
            }
        }
    }

#Preview {
    ContentView()
}
