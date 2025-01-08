//
//  R2.swift
//  App1201
//
//  Created by IGOR on 27/12/2024.
//

import SwiftUI

struct R2: View {
    
    @AppStorage("status") var status: Bool = false
    
    var body: some View {

        ZStack {
            
            Color("bg2")
                .ignoresSafeArea()
            
            VStack(spacing: 0) {
                
                Image("R2")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                
                VStack(spacing: 17) {
                    
                    Text("Stay on top of your car expenses")
                        .foregroundColor(.white)
                        .font(.system(size: 28, weight: .bold))
                        .multilineTextAlignment(.center)
                    
                    Text("and organize your auto collection effortlessly")
                        .foregroundColor(.white.opacity(0.5))
                        .font(.system(size: 16, weight: .regular))
                        .multilineTextAlignment(.center)
                    
                    Button(action: {
                        
                        status = true
                        
                    }, label: {
                        
                        Text("Next")
                            .foregroundColor(.white)
                            .font(.system(size: 15, weight: .regular))
                            .frame(maxWidth: .infinity)
                            .frame(height: 50)
                            .background(RoundedRectangle(cornerRadius: 15).fill(Color("prim")))
                    })
                    .padding(.top, 60)
                }
                .padding()
                .padding(.vertical)
                .frame(maxWidth: .infinity)
                
                Spacer()
                
            }
            .ignoresSafeArea()
        }
    }
}

#Preview {
    R2()
}
