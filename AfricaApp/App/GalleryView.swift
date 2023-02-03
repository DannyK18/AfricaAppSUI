//
//  GalleryView.swift
//  AfricaApp
//
//  Created by Daniel on 25.08.2022.
//

import SwiftUI

struct GalleryView: View {
    
    @State private var selectedAnimal = "lion"
    
    let animals: [Animal] = Bundle.main.decode("animals.json")
    
    let haptics = UIImpactFeedbackGenerator(style: .medium)
    
    //let gridlayout = [
    //    GridItem(.flexible()),
    //    GridItem(.flexible()),
    //    GridItem(.flexible())
    //]
    
    // EFFICIENT GRID DEFFINIYION
    // let gridlayout = Array(repeating: GridItem(.flexible()), count: 3)
    
    // DINAMIC GRIDLAYOUT
    @State private var  gridlayout = [GridItem(.flexible())]
    @State private var  gridlColumn = 3.0
    
    func gridSwitch() {
        gridlayout = Array(repeating: .init(.flexible()), count: Int(gridlColumn))
    }
    
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            VStack(alignment: .center, spacing: 30) {
                
                //MARK: IMAGE
                Image(selectedAnimal)
                    .resizable()
                    .scaledToFit()
                    .clipShape(Circle())
                    .overlay(Circle().stroke(.white, lineWidth: 8))
                
                //MARK: SLIDER
                Slider(value: $gridlColumn, in: 2...4, step: 1)
                    .padding(.horizontal)
                    .onChange(of: gridlColumn) { newValue in
                        gridSwitch()
                    }
                LazyVGrid(columns: gridlayout, alignment: .center, spacing: 10) {
                    ForEach(animals) { item in
                        Image(item.image)
                            .resizable()
                            .scaledToFit()
                            .clipShape(Circle())
                            .overlay(Circle().stroke(.white, lineWidth: 1))
                            .onTapGesture {
                                selectedAnimal = item.image
                                haptics.impactOccurred()
                            }
                    }
                }// GRID
                .animation(.easeIn)
                .onAppear {
                    gridSwitch()
                }
            }// VSTACK
            .padding(.horizontal, 10)
            .padding(.vertical, 50)
        } //SCROLL
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(MotionAnimationView())
    }
}

struct GalleryView_Previews: PreviewProvider {
    static var previews: some View {
        GalleryView()
    }
}
