//
//  ExpensesView.swift
//  App1201
//
//  Created by IGOR on 27/12/2024.
//

import SwiftUI

struct ExpensesView: View {

    @StateObject var viewModel = ExpensesViewModel()
    
    var body: some View {

        ZStack {
            
            Color("bg")
                .ignoresSafeArea()
            
            VStack {
                
                Text("Car expenses")
                    .foregroundColor(.white)
                    .font(.system(size: 34, weight: .bold))
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.bottom, 30)
                
                VStack(alignment: .leading, spacing: 19) {
                    
                    HStack {
                        
                        VStack(spacing: 11) {
                            
                            Image("Service")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 40)
                            
                            Text("Service")
                                .foregroundColor(.white.opacity(0.6))
                                .font(.system(size: 18, weight: .medium))
                            
                            Text("$\(viewModel.genService)")
                                .foregroundColor(.white)
                                .font(.system(size: 18, weight: .semibold))
                        }
                        .padding(.leading)
                        
                        Spacer()

                        VStack(spacing: 11) {
                            
                            Image("Repair")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 40)
                            
                            Text("Repair")
                                .foregroundColor(.white.opacity(0.6))
                                .font(.system(size: 18, weight: .medium))
                            
                            Text("$\(viewModel.genRepair)")
                                .foregroundColor(.white)
                                .font(.system(size: 18, weight: .semibold))
                        }
                        
                        Spacer()
                        
                        VStack(spacing: 11) {
                            
                            Image("Fines")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 19)
                            
                            Text("Fines")
                                .foregroundColor(.white.opacity(0.6))
                                .font(.system(size: 18, weight: .medium))
                            
                            Text("$\(viewModel.genFin)")
                                .foregroundColor(.white)
                                .font(.system(size: 18, weight: .semibold))
                        }
                        .padding(.trailing)

                    }
                    
                    Button(action: {
                        
                        withAnimation(.spring()) {
                            
                            viewModel.isAddGeneral = true
                        }
                        
                    }, label: {
                        
                        Text("Add general expenses")
                            .foregroundColor(.white)
                            .font(.system(size: 16, weight: .semibold))
                            .frame(maxWidth: .infinity)
                            .frame(height: 50)
                            .background(RoundedRectangle(cornerRadius: 25).fill(Color("prim2")))
                    })
                }
                .padding()
                .frame(maxWidth: .infinity)
                .background(RoundedRectangle(cornerRadius: 20).fill(Color("bg2")))
                .padding(.bottom)
                
                HStack {
                    
                    Text("Expenses")
                        .foregroundColor(.white)
                        .font(.system(size: 20, weight: .semibold))
                    
                    Spacer()
                    
                    Button(action: {
                        
                        withAnimation(.spring()) {
                            
                            viewModel.isAdd = true
                        }
                        
                    }, label: {
                        
                        Image(systemName: "plus")
                            .foregroundColor(.white)
                            .font(.system(size: 20, weight: .semibold))
                    })
                }
                .padding(.bottom)
                
                if viewModel.expenses.isEmpty {
                    
                    VStack {
                        
                        Text("Fill out your car expenses")
                            .foregroundColor(.white)
                            .font(.system(size: 16, weight: .semibold))
                            .multilineTextAlignment(.center)
                            .frame(width: 130)
                    }
                    .frame(maxHeight: .infinity)
                    
                } else {
                    
                    ScrollView(.vertical, showsIndicators: false) {
                        
                        LazyVStack {
                            
                            ForEach(viewModel.expenses, id: \.self) { index in
                            
                                Button(action: {
                                    
                                    viewModel.selectedExp = index
                                    
                                    withAnimation(.spring()) {
                                        
                                        viewModel.isDelete = true
                                    }
                                    
                                }, label: {
                                    
                                    HStack {
                                        
                                        VStack(alignment: .leading, spacing: 8) {
                                            
                                            Text(index.exName ?? "")
                                                .foregroundColor(.white)
                                                .font(.system(size: 18, weight: .medium))
                                            
                                            Text(index.exType ?? "")
                                                .foregroundColor(.white.opacity(0.6))
                                                .font(.system(size: 15, weight: .regular))
                                        }
                                        
                                        Spacer()
                                        
                                        Text("$\(index.exAmount ?? "")")
                                            .foregroundColor(.white)
                                            .font(.system(size: 20, weight: .medium))
                                    }
                                })
                                
                                Rectangle()
                                    .fill(.white.opacity(0.5))
                                    .frame(maxWidth: .infinity)
                                    .frame(height: 1)
                            }
                        }
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(RoundedRectangle(cornerRadius: 20).fill(Color("bg2")))
                    }
                }
            }
            .padding()
        }
        .onAppear {
            
            viewModel.fetchExps()
        }
        .sheet(isPresented: $viewModel.isAdd, content: {
            
            AddExpenses(viewModel: viewModel)
        })
        .sheet(isPresented: $viewModel.isAddGeneral, content: {
            
            AddGeneral(viewModel: viewModel)
        })
        .overlay(
            
            ZStack {
                
                Color.black.opacity(viewModel.isDelete ? 0.5 : 0)
                    .ignoresSafeArea()
                    .onTapGesture {
                        
                        withAnimation(.spring()) {
                            
                            viewModel.isDelete = false
                        }
                    }
                
                VStack(spacing: 19) {

                    Text("Delete expense")
                        .foregroundColor(.white)
                        .font(.system(size: 20, weight: .semibold))
                        .multilineTextAlignment(.center)
                    
                    Text("Are you sure?")
                        .foregroundColor(.white)
                        .font(.system(size: 14, weight: .regular))
                        .multilineTextAlignment(.center)
                    
                        
                        Button(action: {
                            
                            CoreDataStack.shared.deleteExpense(withExName: viewModel.selectedExp?.exName ?? "", completion: {
                                
                                viewModel.fetchExps()
                            })
                            
                            withAnimation(.spring()) {
                                
                                viewModel.isDelete = false
                            }
                            
                        }, label: {
                            
                            Text("Delete")
                                .foregroundColor(.red)
                                .font(.system(size: 18, weight: .semibold))
                                .frame(maxWidth: .infinity)
                                .frame(height: 45)
                            
                        })
                        .padding(.top, 25)
                        
                        Button(action: {
                            
                            withAnimation(.spring()) {
                                
                                viewModel.isDelete = false
                            }
                            
                        }, label: {
                            
                            Text("Cancel")
                                .foregroundColor(.white)
                                .font(.system(size: 17, weight: .regular))
                                .frame(maxWidth: .infinity)
                                .frame(height: 45)
                            
                        })

                }
                .frame(maxWidth: .infinity)
                .padding()
                .background(RoundedRectangle(cornerRadius: 20).fill(Color("bg2")))
                .padding()
                .offset(y: viewModel.isDelete ? 0 : UIScreen.main.bounds.height)
            }
        )
    }
}

#Preview {
    ExpensesView()
}
