//
//  CarsView.swift
//  App1201
//
//  Created by IGOR on 27/12/2024.
//

import SwiftUI

struct CarsView: View {
    
    @StateObject var viewModel = CarsViewModel()
    
    var body: some View {

        ZStack {
            
            Color("bg")
                .ignoresSafeArea()
            
            VStack {
                
                Text("Cars")
                    .foregroundColor(.white)
                    .font(.system(size: 34, weight: .bold))
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.bottom, 30)
                
                ScrollView(.vertical, showsIndicators: false) {
                    
                    if viewModel.cars.isEmpty {
                        
                        VStack(alignment: .leading, spacing: 15) {
                            
                            HStack {
                                
                                VStack(alignment: .leading, spacing: 15) {
                                    
                                    Text("My cars")
                                        .foregroundColor(.white)
                                        .font(.system(size: 20, weight: .semibold))
                                    
                                    Text("Add your car to track its characteristics")
                                        .foregroundColor(.white.opacity(0.5))
                                        .font(.system(size: 15, weight: .regular))
                                        .frame(width: 180)
                                }
                                
                                Image("ec")
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                
                            }
                            
                            Button(action: {
                                
                                withAnimation(.spring()) {
                                    
                                    viewModel.isAdd = true
                                }
                                
                            }, label: {
                                
                                Text("Add my car")
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
                        
                    } else {
                        
                        LazyVStack {
                            
                            HStack {
                                
                                Text("My cars")
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
                            
                            ForEach(viewModel.cars, id: \.self) { index in
                                
                                VStack(alignment: .leading, spacing: 15) {
                                    
                                    HStack {
                                        
                                        VStack(alignment: .leading, spacing: 15) {
                                            
                                            Text(index.cModel ?? "")
                                                .foregroundColor(.white)
                                                .font(.system(size: 20, weight: .semibold))
                                            
                                            Text(index.cChar ?? "")
                                                .foregroundColor(.white.opacity(0.5))
                                                .font(.system(size: 15, weight: .regular))
                                                .frame(width: 180, alignment: .leading)
                                            
                                            Text(index.cMil ?? "")
                                                .foregroundColor(.white.opacity(0.5))
                                                .font(.system(size: 15, weight: .regular))
                                                .frame(width: 180, alignment: .leading)
                                        }
                                        
                                        Image(index.cCol ?? "")
                                            .resizable()
                                            .aspectRatio(contentMode: .fit)
                                        
                                        Menu(content: {
                                            
                                            Button(action: {
                                                
                                                viewModel.selectedCar = index
                                                
                                                withAnimation(.spring()) {
                                                    
                                                    viewModel.isDelete = true
                                                }
                                                
                                            }, label: {
                                                
                                                Text("Delete")
                                            })
                                            
                                        }, label: {
                                            
                                            Text("...")
                                                .foregroundColor(.white)
                                                .font(.system(size: 18, weight: .semibold))
                                        })
                                    }
                                }
                                
                                Rectangle()
                                    .fill(.white.opacity(0.5))
                                    .frame(maxWidth: .infinity)
                                    .frame(height: 1)
                            }
                        }
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(RoundedRectangle(cornerRadius: 20).fill(Color("bg2")))
                        .padding(.bottom)

                    }
                    
                    if viewModel.dreamcars.isEmpty {
                        
                        VStack(alignment: .leading, spacing: 15) {
                            
                            HStack {
                                
                                VStack(alignment: .leading, spacing: 15) {
                                    
                                    Text("Dream Car")
                                        .foregroundColor(.white)
                                        .font(.system(size: 20, weight: .semibold))
                                    
                                    Text("Seize the right moment to make your dream come true")
                                        .foregroundColor(.white.opacity(0.5))
                                        .font(.system(size: 15, weight: .regular))
                                        .frame(width: 180)
                                }
                                
                                Image("ec")
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                
                            }
                            
                            Button(action: {
                                
                                withAnimation(.spring()) {
                                    
                                    viewModel.isAddDream = true
                                }
                                
                            }, label: {
                                
                                Text("Add dream")
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
                        
                        Spacer()
                        
                    } else {
                        
                        LazyVStack {
                            
                            HStack {
                                
                                Text("Dream car")
                                    .foregroundColor(.white)
                                    .font(.system(size: 20, weight: .semibold))
                                
                                Spacer()
                                
                                Button(action: {
                                    
                                    withAnimation(.spring()) {
                                        
                                        viewModel.isAddDream = true
                                    }
                                    
                                }, label: {
                                    
                                    Image(systemName: "plus")
                                        .foregroundColor(.white)
                                        .font(.system(size: 20, weight: .semibold))
                                })
                            }
                            
                            ForEach(viewModel.dreamcars, id: \.self) { index in
                                
                                VStack(alignment: .leading, spacing: 15) {
                                    
                                    HStack {
                                        
                                        VStack(alignment: .leading, spacing: 15) {
                                            
                                            Text(index.dcModel ?? "")
                                                .foregroundColor(.white)
                                                .font(.system(size: 20, weight: .semibold))
                                            
                                            Text(index.dcChar ?? "")
                                                .foregroundColor(.white.opacity(0.5))
                                                .font(.system(size: 15, weight: .regular))
                                                .frame(width: 180, alignment: .leading)
                                            
                                            Text(index.dcMil ?? "")
                                                .foregroundColor(.white.opacity(0.5))
                                                .font(.system(size: 15, weight: .regular))
                                                .frame(width: 180, alignment: .leading)
                                        }
                                        
                                        Image(index.dcCol ?? "")
                                            .resizable()
                                            .aspectRatio(contentMode: .fit)
                                        
                                        Menu(content: {
                                            
                                            Button(action: {
                                                
                                                viewModel.selectedDreamcar = index
                                                
                                                withAnimation(.spring()) {
                                                    
                                                    viewModel.isDeleteDream = true
                                                }
                                                
                                            }, label: {
                                                
                                                Text("Delete")
                                            })
                                            
                                        }, label: {
                                            
                                            Text("...")
                                                .foregroundColor(.white)
                                                .font(.system(size: 18, weight: .semibold))
                                        })
                                    }
                                }
                                
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
            
            viewModel.fetchCars()
        }
        .onAppear {
            
            viewModel.fetchDreamcars()
        }
        .sheet(isPresented: $viewModel.isAdd, content: {
            
            AddCar(viewModel: viewModel)
        })
        .sheet(isPresented: $viewModel.isAddDream, content: {
            
            DreamCar(viewModel: viewModel)
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

                    Text("Delete my car")
                        .foregroundColor(.white)
                        .font(.system(size: 20, weight: .semibold))
                        .multilineTextAlignment(.center)
                    
                    Text("Are you sure?")
                        .foregroundColor(.white)
                        .font(.system(size: 14, weight: .regular))
                        .multilineTextAlignment(.center)
                    
                        
                        Button(action: {
                            
                            CoreDataStack.shared.deleteCar(withCarModel: viewModel.selectedCar?.cModel ?? "", completion: {
                                
                                viewModel.fetchCars()
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
        .overlay(
            
            ZStack {
                
                Color.black.opacity(viewModel.isDeleteDream ? 0.5 : 0)
                    .ignoresSafeArea()
                    .onTapGesture {
                        
                        withAnimation(.spring()) {
                            
                            viewModel.isDeleteDream = false
                        }
                    }
                
                VStack(spacing: 19) {

                    Text("Delete dream car")
                        .foregroundColor(.white)
                        .font(.system(size: 20, weight: .semibold))
                        .multilineTextAlignment(.center)
                    
                    Text("Are you sure?")
                        .foregroundColor(.white)
                        .font(.system(size: 14, weight: .regular))
                        .multilineTextAlignment(.center)
                    
                        
                        Button(action: {
                            
                            CoreDataStack.shared.deleteDreamCar(withDreamCarModel: viewModel.selectedDreamcar?.dcModel ?? "", completion: {
                                
                                viewModel.fetchDreamcars()
                            })
                            
                            withAnimation(.spring()) {
                                
                                viewModel.isDeleteDream = false
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
                                
                                viewModel.isDeleteDream = false
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
                .offset(y: viewModel.isDeleteDream ? 0 : UIScreen.main.bounds.height)
            }
        )
    }
}

#Preview {
    CarsView()
}
