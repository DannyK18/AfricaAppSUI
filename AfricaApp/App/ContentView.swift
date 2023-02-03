//
//  ContentView.swift
//  AfricaApp
//
//  Created by Daniel on 25.08.2022.
//

import SwiftUI

struct ContentView: View {
    
    @State private var isGridViewActive = false
    let haptics = UIImpactFeedbackGenerator(style: .medium)
    
    let animals: [Animal] = Bundle.main.decode("animals.json")
    
    @State private var gridlayout = [ GridItem(.flexible()) ]
    @State private var gridColumn = 1
    @State private var toolbarIcon = "square.grid.2x2"
     
    // MARK: FUNCTIONS
    
    func gridSwitch() {
        gridlayout = Array(repeating: .init(.flexible()), count: gridlayout.count % 3 + 1)
        gridColumn = gridlayout.count
        print("GridNumber: \(gridColumn)")
        
        // TOOLBAR IMAGE
        switch gridColumn {
        case 1:
            toolbarIcon = "square.grid.2x2"
        case 2:
            toolbarIcon = "square.grid.3x2"
        case 3:
            toolbarIcon = "rectangle.grid.1x2"
        default:
            toolbarIcon = "square.grid.2x2"
        }
    }
    var body: some View {
        NavigationView {
            Group {
                if !isGridViewActive {
                    List {
                        CoverImageView()
                            .frame(height: 300)
                            .listRowInsets(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0))
                        
                        ForEach(animals) { animal in
                            NavigationLink(destination: AnimalDetailView(animal: animal)) {
                                AnimalListItemView(animal: animal)
                            }
                        } // FOREACH
                        CreditsView()
                            .modifier(CenterModifier())
                    } // LIST
                } else {
                    ScrollView(.vertical, showsIndicators: false) {
                        LazyVGrid(columns: gridlayout, alignment: .center, spacing: 10) {
                            ForEach(animals) { animal in
                                NavigationLink(destination: AnimalDetailView(animal: animal)) {
                                    AnimalGriditemView(animal: animal)
                                } // LINK
                            }// LOOP
                        }// GRID
                        .padding(10)
                        .animation(.easeIn)
                    } // SCROLL
                } // CONDITION
            } // GROUP
            .navigationBarTitle("Africa", displayMode: .large)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    HStack(spacing: 16) {
                        //LIST
                        
                        Button {
                            print("ListView is activated")
                            isGridViewActive = false
                            haptics.impactOccurred()
                        } label: {
                            Image(systemName: "square.fill.text.grid.1x2")
                                .font(.title2)
                                .foregroundColor(isGridViewActive ? .primary : .accentColor)
                        }
                        // GRID
                        Button {
                            print("GridView is activated")
                            isGridViewActive = true
                            haptics.impactOccurred()
                            gridSwitch()
                        } label: {
                            Image(systemName: toolbarIcon)
                                .font(.title2)
                                .foregroundColor(isGridViewActive ? .accentColor : .primary)
                        }
                    }
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
