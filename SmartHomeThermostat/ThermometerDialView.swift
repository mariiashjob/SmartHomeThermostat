//
//  ThermometerDialView.swift
//  SmartHomeThermostat
//
//  Created by m.shirokova on 18.06.2023.
//

import SwiftUI

struct ThermometerDialView: View {
    private let outerDialSize: CGFloat = 200
    private let innerDialSize: CGFloat = 172
    private let setPointSize: CGFloat = 15
    
    var degrees: CGFloat = 0
    
    var body: some View {
        ZStack {
            Circle()
                .fill(LinearGradient([Color("Outer Dial 1"), Color("Outer Dial 2")]))
                .frame(width: outerDialSize, height: outerDialSize)
                .shadow(color: .black.opacity(0.2), radius: 60, x: 0, y: 30)
                .shadow(color: .black.opacity(0.2), radius: 16, x: 0, y: 8)
                .overlay {
                    Circle()
                        .stroke(LinearGradient([.white.opacity(0.2), .black.opacity(0.19)]), lineWidth: 1)
                }
                .overlay {
                    Circle()
                        .stroke(.white.opacity(0.1), lineWidth: 4)
                        .blur(radius: 4)
                        .offset(x: 3, y: 3)
                        .mask {
                            Circle()
                                .fill(LinearGradient([.black, .clear]))
                        }
                }
            
            Circle()
                .fill(LinearGradient([Color("Innder Dial 1"), Color("Innder Dial 2")]))
                    .frame(width: innerDialSize, height: innerDialSize)
            
            Circle()
                .fill(LinearGradient([Color("Temperature Setpoint 1"), Color("Temperature Setpoint 2")]))
                    .frame(width: setPointSize, height: setPointSize)
                    .frame(width: innerDialSize, height: innerDialSize, alignment: .top)
                    .offset(x: 0, y: 7.5)
                    .rotationEffect(.degrees(degrees + 100))
                    .animation(.easeOut(duration: 1), value: degrees)
        }
    }
}

struct ThermometerDialView_Previews: PreviewProvider {
    static var previews: some View {
        ThermometerDialView()
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Color("Background"))
    }
}
