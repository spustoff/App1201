//
//  AddGeneral.swift
//  App1201
//
//  Created by IGOR on 27/12/2024.
//

import SwiftUI

struct AddGeneral: View {
    
    @StateObject var viewModel: ExpensesViewModel
    
    var body: some View {

        ZStack {
            
            Color("bg")
                .ignoresSafeArea()
            
            VStack {
                
                ZStack {
                    
                    Text("Add general expenses")
                        .foregroundColor(.white)
                        .font(.system(size: 17, weight: .semibold))
                    
                    HStack {
                        
                        Button(action: {
                            
                            viewModel.addGenFin = ""
                            viewModel.addGenRep = ""
                            viewModel.addGenSer = ""
                                                        
                            withAnimation(.spring()) {
                                
                                viewModel.isAddGeneral = false
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
                            
                            Text("Enter amount service")
                                .foregroundColor(.white)
                                .font(.system(size: 17, weight: .medium))
                                .frame(maxWidth: .infinity, alignment: .leading)
                            
                            ZStack(content: {
                                
                                Text("Enter")
                                    .foregroundColor(.gray)
                                    .font(.system(size: 14, weight: .regular))
                                    .opacity(viewModel.addGenSer.isEmpty ? 1 : 0)
                                    .frame(maxWidth: .infinity, alignment: .leading)
                                
                                TextField("", text: $viewModel.addGenSer)
                                    .foregroundColor(Color.white)
                                    .font(.system(size: 16, weight: .medium))
                                
                            })
                            .padding()
                            .frame(maxWidth: .infinity)
                            .background(RoundedRectangle(cornerRadius: 20).fill(Color.gray.opacity(0.4)))
                            .background(RoundedRectangle(cornerRadius: 20).stroke(Color("prim")))
                            .padding(1)
                            
                            Text("Enter amount repair")
                                .foregroundColor(.white)
                                .font(.system(size: 17, weight: .medium))
                                .frame(maxWidth: .infinity, alignment: .leading)
                            
                            ZStack(content: {
                                
                                Text("Enter")
                                    .foregroundColor(.gray)
                                    .font(.system(size: 14, weight: .regular))
                                    .opacity(viewModel.addGenRep.isEmpty ? 1 : 0)
                                    .frame(maxWidth: .infinity, alignment: .leading)
                                
                                TextField("", text: $viewModel.addGenRep)
                                    .foregroundColor(Color.white)
                                    .font(.system(size: 16, weight: .medium))
                                
                            })
                            .padding()
                            .frame(maxWidth: .infinity)
                            .background(RoundedRectangle(cornerRadius: 20).fill(Color.gray.opacity(0.4)))
                            .background(RoundedRectangle(cornerRadius: 20).stroke(Color("prim")))
                            .padding(1)
                            
                            Text("Enter amount fines")
                                .foregroundColor(.white)
                                .font(.system(size: 17, weight: .medium))
                                .frame(maxWidth: .infinity, alignment: .leading)
                            
                            ZStack(content: {
                                
                                Text("Enter")
                                    .foregroundColor(.gray)
                                    .font(.system(size: 14, weight: .regular))
                                    .opacity(viewModel.addGenFin.isEmpty ? 1 : 0)
                                    .frame(maxWidth: .infinity, alignment: .leading)
                                
                                TextField("", text: $viewModel.addGenFin)
                                    .foregroundColor(Color.white)
                                    .font(.system(size: 16, weight: .medium))
                                
                            })
                            .padding()
                            .frame(maxWidth: .infinity)
                            .background(RoundedRectangle(cornerRadius: 20).fill(Color.gray.opacity(0.4)))
                            .background(RoundedRectangle(cornerRadius: 20).stroke(Color("prim")))
                            .padding(1)

                        }
                    }
                    .padding(.bottom, 100)
                    
                    Button(action: {
                        
                        viewModel.genFin = viewModel.addGenFin
                        viewModel.genRepair = viewModel.addGenRep
                        viewModel.genService = viewModel.addGenSer
                        
                        viewModel.addGenFin = ""
                        viewModel.addGenRep = ""
                        viewModel.addGenSer = ""
                        
                        withAnimation(.spring()) {
                            
                            viewModel.isAddGeneral = false
                        }
                        
                    }, label: {
                        
                        Text("Save")
                            .foregroundColor(.white)
                            .font(.system(size: 16, weight: .semibold))
                            .frame(maxWidth: .infinity)
                            .frame(height: 50)
                            .background(RoundedRectangle(cornerRadius: 20.0).fill(Color("prim")))
                    })
                    .opacity(viewModel.addGenFin.isEmpty || viewModel.addGenRep.isEmpty || viewModel.addGenSer.isEmpty ? 0.5 : 1)
                    .disabled(viewModel.addGenFin.isEmpty || viewModel.addGenRep.isEmpty || viewModel.addGenSer.isEmpty ? true : false)
                }
            }
            .padding()
        }
    }
}

#Preview {
    AddGeneral(viewModel: ExpensesViewModel())
}
