//
//  GridView.swift
//  Moonshot
//
//  Created by Ricardo on 26/12/23.
//

import SwiftUI

struct ListLayout: View {
    
    var missions: [Mission]
    var astronauts: [String: Astronaut]
    
    var body: some View {
        List{
            ForEach(missions){ mission in
                NavigationLink(value: mission){
                        VStack {
                            Image(mission.image)
                                .resizable()
                                .scaledToFit()
                                .frame(width: 100, height: 100)
                                .padding()
                            
                            VStack {
                                Text(mission.displayName)
                                    .font(.headline)
                                    .foregroundStyle(.black)
                                
                                Text(mission.formattedLaunchDate)
                                    .font(.caption)
                                    .foregroundStyle(.black.opacity(0.5))
                            }
                            .padding(.vertical)
                            .frame(maxWidth: .infinity)
                            .background(.lightBackground)
                        }
                        .clipShape(.rect(cornerRadius: 10))
                        .overlay(
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(.lightBackground)
                                .shadow(radius: 4)
                        )
                }
                .navigationDestination(for: Mission.self) { mission in
                    MissionView(mission: mission, astronauts: astronauts)
                }
            }
            .listRowBackground(Color.darkBackground)
        }
        .listStyle(.plain)
    }
}

#Preview {
    
    let astronauts: [String: Astronaut] = Bundle.main.decode("astronauts.json")
    let missions: [Mission] = Bundle.main.decode("missions.json")
    
    return  ListLayout(missions: missions, astronauts: astronauts)
    
}
