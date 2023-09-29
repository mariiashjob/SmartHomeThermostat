//
//  ClimateCard.swift
//  SmartHomeThermostat
//
//  Created by m.shirokova on 18.06.2023.
//

import SwiftUI

struct ClimateCard: View {
    var iconName: String
    var index: String
    var measure: String
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 22, style: .continuous)
                .fill(Color("Card Background"))
                .shadow(color: Color("Card Shadow"), radius: 40, x: 0, y: 20)
                .overlay {
                    RoundedRectangle(cornerRadius: 22, style: .continuous)
                        .stroke(.white.opacity(0.1), lineWidth: 1)
                }
            
            VStack(spacing: 10) {
                Image(systemName: iconName)
                    .font(.title2.weight(.semibold))
                    .foregroundColor(.white)
                    .frame(width: 60, height: 60)
                    .background(
                        LinearGradient([Color("Temperature Ring 1"), Color("Temperature Ring 2")], startPoint: .top, endPoint: .bottom)
                            .clipShape(Circle())
                    )
                
                VStack(spacing: 8) {
                    Text(index)
                        .font(.headline)
                        .foregroundColor(.primary)
                    
                    Text(measure)
                        .font(.title3)
                        .fontWeight(.semibold)
                        .foregroundColor(.secondary)
                        //.opacity(0.8)
                }
            }
            .padding(.vertical, 20)
            .padding(.horizontal, 10)
        }
        .frame(width: 144, height: 164)
    }
}

struct ClimateCard_Previews: PreviewProvider {
    static var previews: some View {
        ClimateCard(iconName: "humidity.fill", index: "Inside Humidity", measure: "50%")
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Color("Background"))
    }
}
