//
//  MissionDescriptionView.swift
//  Moonshot
//
//  Created by 문창재 on 5/30/24.
//

import SwiftUI

struct MissionDescriptionView: View {
    let mission:Mission
    
    var body: some View {
        VStack(alignment:.leading){
            Rectangle()
                .frame(height: 2)
                .foregroundStyle(.lightBackground)
                .padding(.vertical)
            
            Text("Mission Highlights")
                .font(.title.bold())
                .padding(.bottom, 5)

            Text(mission.description)
            
            Rectangle()
                .frame(height: 2)
                .foregroundStyle(.lightBackground)
                .padding(.vertical)
            Text("Crew")
                .font(.title.bold())
                .padding(.bottom, 5)
        }
        
    }
}

#Preview {
    let missions:[Mission] = Bundle.main.decode("missions.json")
    
    return
    MissionDescriptionView(mission: missions[0])
}
