//
//  ContentView.swift
//  Moonshot
//
//  Created by Ricardo on 10/12/23.
//

import SwiftUI

struct ContentView: View {
    
    @State private var showingGrid = true
    
    let astronauts: [String: Astronaut] = Bundle.main.decode("astronauts.json")
    let missions: [Mission] = Bundle.main.decode("missions.json")
    
    var body: some View {
        NavigationStack {
            VStack {
                Group {
                    if showingGrid {
                        GridLayout(missions: missions, astronauts: astronauts)
                    } else {
                        ListLayout(missions: missions, astronauts: astronauts)
                            .listStyle(.plain)
                            .background(Color.darkBackground)
                    }
                }
                .navigationBarTitle("Moonshot") // Scrollable view
                .background(Color.darkBackground)
                .toolbar {
                    Button {
                        showingGrid.toggle() // Toggles showingGrid to false or true
                    } label: {
                        if showingGrid {
                            Label("Show as table", systemImage: "list.dash")
                        } else {
                            Label("Show as grid", systemImage: "square.grid.2x2")
                        }
                    }
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
