//
//  DreamCar.swift
//  App1201
//
//  Created by IGOR on 27/12/2024.
//

import SwiftUI

struct DreamCar: View {

    @StateObject var viewModel: CarsViewModel
    
    var body: some View {
        
        ZStack {
            
            Color("bg")
                .ignoresSafeArea()
            
            VStack {
                
                ZStack {
                    
                    Text("Dream car")
                        .foregroundColor(.white)
                        .font(.system(size: 17, weight: .semibold))
                    
                    HStack {
                        
                        Button(action: {
                            
                            viewModel.curColor = ""
                            viewModel.dcModel = ""
                            viewModel.dcChar = ""
                            viewModel.dcMil = ""
                                                        
                            withAnimation(.spring()) {
                                
                                viewModel.isAddDream = false
                            }
                            
                        }, label: {
                            
                            HStack {
                                
                                Image(systemName: "chevron.left")
                                    .foregroundColor(.white)
                                    .font(.system(size: 17, weight: .semibold))
                                
                                Text("Back")
                                    .foregroundColor(.white)
                                    .font(.system(size: 16, weight: .regular))
                            }
                        })
                        
                        Spacer()
                    }
                }
                .padding(.bottom, 30)
                
                ScrollView(.vertical, showsIndicators: false) {
                    
                    VStack(spacing: 14) {
                        
                        VStack(spacing: 12) {
                            
                            Text("Enter car model")
                                .foregroundColor(.white)
                                .font(.system(size: 17, weight: .medium))
                                .frame(maxWidth: .infinity, alignment: .leading)
                            
                            ZStack(content: {
                                
                                Text("Enter")
                                    .foregroundColor(.gray)
                                    .font(.system(size: 14, weight: .regular))
                                    .opacity(viewModel.dcModel.isEmpty ? 1 : 0)
                                    .frame(maxWidth: .infinity, alignment: .leading)
                                
                                TextField("", text: $viewModel.dcModel)
                                    .foregroundColor(Color.white)
                                    .font(.system(size: 16, weight: .medium))
                                
                            })
                            .padding()
                            .frame(maxWidth: .infinity)
                            .background(RoundedRectangle(cornerRadius: 20).fill(Color.gray.opacity(0.4)))
                            .background(RoundedRectangle(cornerRadius: 20).stroke(Color("prim")))
                            .padding(1)
                            
                            Text("Enter characteristics of car")
                                .foregroundColor(.white)
                                .font(.system(size: 17, weight: .medium))
                                .frame(maxWidth: .infinity, alignment: .leading)
                            
                            ZStack(content: {
                                
                                Text("Enter")
                                    .foregroundColor(.gray)
                                    .font(.system(size: 14, weight: .regular))
                                    .opacity(viewModel.dcChar.isEmpty ? 1 : 0)
                                    .frame(maxWidth: .infinity, alignment: .leading)
                                
                                TextField("", text: $viewModel.dcChar)
                                    .foregroundColor(Color.white)
                                    .font(.system(size: 16, weight: .medium))
                                
                            })
                            .padding()
                            .frame(maxWidth: .infinity)
                            .background(RoundedRectangle(cornerRadius: 20).fill(Color.gray.opacity(0.4)))
                            .background(RoundedRectangle(cornerRadius: 20).stroke(Color("prim")))
                            .padding(1)
                            
                            Text("Enter mileage")
                                .foregroundColor(.white)
                                .font(.system(size: 17, weight: .medium))
                                .frame(maxWidth: .infinity, alignment: .leading)
                            
                            ZStack(content: {
                                
                                Text("Enter")
                                    .foregroundColor(.gray)
                                    .font(.system(size: 14, weight: .regular))
                                    .opacity(viewModel.dcMil.isEmpty ? 1 : 0)
                                    .frame(maxWidth: .infinity, alignment: .leading)
                                
                                TextField("", text: $viewModel.dcMil)
                                    .foregroundColor(Color.white)
                                    .font(.system(size: 16, weight: .medium))
                                
                            })
                            .padding()
                            .frame(maxWidth: .infinity)
                            .background(RoundedRectangle(cornerRadius: 20).fill(Color.gray.opacity(0.4)))
                            .background(RoundedRectangle(cornerRadius: 20).stroke(Color("prim")))
                            .padding(1)
                            
                            Text("Color of car")
                                .foregroundColor(.white)
                                .font(.system(size: 17, weight: .medium))
                                .frame(maxWidth: .infinity, alignment: .leading)
                            
                            ScrollView(.horizontal, showsIndicators: false) {
                                
                                HStack {
                                    
                                    ForEach(viewModel.colors, id: \.self) { index in
                                    
                                        Button(action: {
                                            
                                            viewModel.curColor = index
                                            
                                        }, label: {
                                            
                                            RoundedRectangle(cornerRadius: 15)
                                                .fill(Color("\(index)"))
                                                .frame(width: 60, height: 60)
                                                .background(RoundedRectangle(cornerRadius: 15).stroke(Color("prim"), lineWidth: 5).opacity(viewModel.curColor == index ? 1 : 0))
                                                .padding(6)
                                        })
                                    }
                                }
                            }
                        }
                    }
                    .padding(.bottom, 100)
                    
                    Button(action: {
                        
                        viewModel.dcCol = viewModel.curColor
                        
                        viewModel.addDreamcar()
                        
                        viewModel.curColor = ""
                        viewModel.dcModel = ""
                        viewModel.dcChar = ""
                        viewModel.dcMil = ""
                        
                        viewModel.fetchDreamcars()
                        
                        withAnimation(.spring()) {
                            
                            viewModel.isAddDream = false
                        }
                        
                    }, label: {
                        
                        Text("Save")
                            .foregroundColor(.white)
                            .font(.system(size: 16, weight: .semibold))
                            .frame(maxWidth: .infinity)
                            .frame(height: 50)
                            .background(RoundedRectangle(cornerRadius: 20.0).fill(Color("prim")))
                    })
                    .opacity(viewModel.dcModel.isEmpty || viewModel.dcChar.isEmpty || viewModel.dcMil.isEmpty || viewModel.curColor.isEmpty ? 0.5 : 1)
                    .disabled(viewModel.dcModel.isEmpty || viewModel.dcChar.isEmpty || viewModel.dcMil.isEmpty || viewModel.curColor.isEmpty ? true : false)
                }
            }
            .padding()
        }
    }
}

#Preview {
    DreamCar(viewModel: CarsViewModel())
}
