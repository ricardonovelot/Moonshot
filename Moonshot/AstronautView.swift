//
//  AstronautView.swift
//  Moonshot
//
//  Created by Ricardo on 26/12/23.
//

import SwiftUI

struct AstronautView: View {
    let astronaut: Astronaut
    
    var body: some View {
        ScrollView{
            VStack{
                Image(astronaut.id)
                    .resizable()
                    .scaledToFit()
                    .clipShape(.rect(cornerRadius: 10))
                    .shadow(radius: 5)
                    .padding([.leading,.trailing])
                
                Text(astronaut.description)
                    .padding()
            }
        }
        .background(.darkBackground)
        .navigationTitle(astronaut.name)
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    let astronauts: [String: Astronaut] = Bundle.main.decode("astronauts.json")
    
    return AstronautView(astronaut: astronauts["aldrin"]!)
}
