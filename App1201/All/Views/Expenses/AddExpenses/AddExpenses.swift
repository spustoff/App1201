//
//  AddExpenses.swift
//  App1201
//
//  Created by IGOR on 27/12/2024.
//

import SwiftUI

struct AddExpenses: View {
    
    @StateObject var viewModel: ExpensesViewModel
    
    var body: some View {

        ZStack {
            
            Color("bg")
                .ignoresSafeArea()
            
            VStack {
                
                ZStack {
                    
                    Text("Add expenses")
                        .foregroundColor(.white)
                        .font(.system(size: 17, weight: .semibold))
                    
                    HStack {
                        
                        Button(action: {
                            
                            viewModel.exName = ""
                            viewModel.currType = ""
                            viewModel.exAmount = ""
                                                        
                            withAnimation(.spring()) {
                                
                                viewModel.isAdd = false
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
                            
                            Text("Enter name")
                                .foregroundColor(.white)
                                .font(.system(size: 17, weight: .medium))
                                .frame(maxWidth: .infinity, alignment: .leading)
                            
                            ZStack(content: {
                                
                                Text("Enter")
                                    .foregroundColor(.gray)
                                    .font(.system(size: 14, weight: .regular))
                                    .opacity(viewModel.exName.isEmpty ? 1 : 0)
                                    .frame(maxWidth: .infinity, alignment: .leading)
                                
                                TextField("", text: $viewModel.exName)
                                    .foregroundColor(Color.white)
                                    .font(.system(size: 16, weight: .medium))
                                
                            })
                            .padding()
                            .frame(maxWidth: .infinity)
                            .background(RoundedRectangle(cornerRadius: 20).fill(Color.gray.opacity(0.4)))
                            .background(RoundedRectangle(cornerRadius: 20).stroke(Color("prim")))
                            .padding(1)
                            
                            Text("Enter type")
                                .foregroundColor(.white)
                                .font(.system(size: 17, weight: .medium))
                                .frame(maxWidth: .infinity, alignment: .leading)
                            
                           Menu(content: {
                               
                               ForEach(viewModel.types, id: \.self) { index in
                               
                                   Button(action: {
                                       
                                       viewModel.currType = index
                                       
                                   }, label: {
                                       
                                       Text(index)
                                   })
                               }
                               
                           }, label: {
                               
                               if viewModel.currType.isEmpty {
                                   
                                   HStack {
                                       
                                       Text("Type")
                                           .foregroundColor(Color.white)
                                           .font(.system(size: 16, weight: .medium))
                                       
                                       Spacer()
                                       
                                       Image(systemName: "chevron.down")
                                           .foregroundColor(Color.white)
                                           .font(.system(size: 16, weight: .medium))
                                   }
                                   
                               } else {
                                   
                                   HStack {
                                       
                                       Text(viewModel.currType)
                                           .foregroundColor(Color.white)
                                           .font(.system(size: 16, weight: .medium))
                                       
                                       Spacer()
                                       
                                       Image(systemName: "chevron.down")
                                           .foregroundColor(Color.white)
                                           .font(.system(size: 16, weight: .medium))
                                   }
                               }
                           })
                            .padding()
                            .frame(maxWidth: .infinity)
                            .background(RoundedRectangle(cornerRadius: 20).fill(Color.gray.opacity(0.4)))
                            .background(RoundedRectangle(cornerRadius: 20).stroke(Color("prim")))
                            .padding(1)
                            
                            Text("Enter amount")
                                .foregroundColor(.white)
                                .font(.system(size: 17, weight: .medium))
                                .frame(maxWidth: .infinity, alignment: .leading)
                            
                            ZStack(content: {
                                
                                Text("Enter")
                                    .foregroundColor(.gray)
                                    .font(.system(size: 14, weight: .regular))
                                    .opacity(viewModel.exAmount.isEmpty ? 1 : 0)
                                    .frame(maxWidth: .infinity, alignment: .leading)
                                
                                TextField("", text: $viewModel.exAmount)
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
                        
                        viewModel.exType = viewModel.currType
                        
                        viewModel.addExp()
                        
                        viewModel.exName = ""
                        viewModel.exType = ""
                        viewModel.currType = ""
                        
                        viewModel.fetchExps()
                        
                        withAnimation(.spring()) {
                            
                            viewModel.isAdd = false
                        }
                        
                    }, label: {
                        
                        Text("Save")
                            .foregroundColor(.white)
                            .font(.system(size: 16, weight: .semibold))
                            .frame(maxWidth: .infinity)
                            .frame(height: 50)
                            .background(RoundedRectangle(cornerRadius: 20.0).fill(Color("prim")))
                    })
                    .opacity(viewModel.exName.isEmpty || viewModel.exAmount.isEmpty || viewModel.currType.isEmpty ? 0.5 : 1)
                    .disabled(viewModel.exName.isEmpty || viewModel.exAmount.isEmpty || viewModel.currType.isEmpty ? true : false)
                }
            }
            .padding()
        }
    }
}

#Preview {
    AddExpenses(viewModel: ExpensesViewModel())
}
