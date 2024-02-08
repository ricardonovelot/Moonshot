//
//  CrewView.swift
//  Moonshot
//
//  Created by Ricardo on 26/12/23.
//

import SwiftUI

struct CrewView: View {
    
    let crew: [MissionView.CrewMember]
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false){
            LazyHGrid(rows: [GridItem()]){
                ForEach(crew, id:\.role) { crewMember in
                    NavigationLink {
                        AstronautView(astronaut: crewMember.astronaut)
                    } label: {
                        HStack {
                            Image(crewMember.astronaut.id)
                                .resizable()
                                .frame(width: 104, height: 72)
                                .cornerRadius(12)
                                .padding(.trailing, 8)
                                .shadow(radius: 2)
                            VStack(alignment: .leading, content: { Text(crewMember.astronaut.name)
                                    .foregroundStyle(.black)
                                    .font(.headline)
                                
                                Text(crewMember.role)
                                    .foregroundStyle(.black.opacity(0.5))
                            }
                            )
                        }
                        .padding()
                    }
                }
            }
        }
    }
}

#Preview {
    let sampleCrew: [MissionView.CrewMember] = [
        MissionView.CrewMember(role: "Commander", astronaut: Astronaut(id: "commander", name: "John Doe", description: "")),
        MissionView.CrewMember(role: "Pilot", astronaut: Astronaut(id: "pilot", name: "Jane Smith", description: ""))
        // Add more sample crew members if needed
    ]
    
    
    return NavigationView {
        CrewView(crew: sampleCrew)
    }
}
