//
//  GridView.swift
//  Moonshot
//
//  Created by Ricardo on 26/12/23.
//

import SwiftUI

struct GridLayout: View {
    
    var missions: [Mission]
    var astronauts: [String: Astronaut]
    let columns = [
        GridItem(.adaptive(minimum: 150))
    ]
    
    var body: some View {
        ScrollView{
            LazyVGrid(columns:columns){
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
                                        .foregroundStyle(.black).opacity(0.5)
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
                }
            }
            .padding([.horizontal, .bottom])
            
        }
        .navigationDestination(for: Mission.self) { mission in
            MissionView(mission: mission, astronauts: astronauts)
        }
    }
}

#Preview {
    
    let astronauts: [String: Astronaut] = Bundle.main.decode("astronauts.json")
    let missions: [Mission] = Bundle.main.decode("missions.json")
    
    return  GridLayout(missions: missions, astronauts: astronauts)
    
}
