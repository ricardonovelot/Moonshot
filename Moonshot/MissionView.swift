//
//  MissionView.swift
//  Moonshot
//
//  Created by Ricardo on 20/12/23.
//

import SwiftUI

struct MissionView: View {
    
    //New Struct to merge an astronaut and their role in their missions
    
    struct CrewMember {
        let role: String
        let astronaut: Astronaut
    }
    
    let mission: Mission
    let crew: [CrewMember]
    
    var body: some View {
        ScrollView{
            VStack{
                Image(mission.image)
                    .resizable()
                    .scaledToFit()
                    .containerRelativeFrame(.horizontal) { width, axis in
                        width * 0.6
                    }
                    .padding()
                
                Text(mission.formattedLaunchDate)
                    .font(.title).bold()
                
                
                VStack(alignment: .leading){
                    
                    DividerView()
                    
                    Text("Mission Highlights")
                        .font(.title.bold())
                        .padding(.bottom, 5)
                    
                    Text(mission.description)
                    
                    DividerView()
                    
                    Text("Crew")
                        .font(.title.bold())
                        .padding(.bottom, 5)
                }
                .padding(.horizontal)
                
                CrewView(crew: crew)
                
            }
            .padding(.bottom)
        }
        .navigationTitle(mission.displayName)
        .navigationBarTitleDisplayMode(.inline)
        .background(.darkBackground)
    }
    
    //initializer takes a mission, and an astronauts dictionary
    
    init(mission: Mission, astronauts: [String: Astronaut]) {
        //easy
        self.mission = mission
        //complex, give me one crew member comming in, it will look for every astronaut in the astronauts dictionary, find every memeber
        self.crew = mission.crew.map { member in
            if let astronaut = astronauts[member.name] {
                return CrewMember(role: member.role, astronaut: astronaut)
            } else {
                fatalError("Missing \(member.name)")
            }
        }
    }
}

#Preview {
    let missions: [Mission] = Bundle.main.decode("missions.json")
    let astronauts: [String: Astronaut] = Bundle.main.decode("astronauts.json")
    
    return MissionView(mission: missions[2], astronauts: astronauts)
        .preferredColorScheme(.dark)
    
}


//[String: Astronaut] Dictionary of astronauts
