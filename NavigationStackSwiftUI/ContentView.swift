//
//  ContentView.swift
//  NavigationStackSwiftUI
//
//  Created by Sandra Gomez on 4/30/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationStack {
            VStack (spacing: 25) {
                NavigationLink {
                    SecondView()
                } label: {
                    Text("Go to second view")
                }
                Text("Initial View")
            }
            .padding()
        }
    }
    
    struct SecondView: View {
        var body: some View {
            ZStack { 
                Rectangle()
                    .foregroundColor(.orange)
                VStack {
                    Text ("Second View")
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
        var body: some View {
            ZStack {
                Rectangle()
                    .foregroundColor(.purple)
                VStack {
                    Text ("Third View")
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
        var body: some View {
            ZStack {
                Rectangle()
                    .foregroundColor(.pink)
                VStack {
                    Text ("Last View")
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
