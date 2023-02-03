//
//  AnimalGriditemView.swift
//  AfricaApp
//
//  Created by Daniel on 05.09.2022.
//

import SwiftUI

struct AnimalGriditemView: View {
    
    let animal: Animal
    
    var body: some View {
        Image(animal.image)
            .resizable()
            .scaledToFit()
            .cornerRadius(12)
    }
}

struct AnimalGriditemView_Previews: PreviewProvider {
    static let animals: [Animal]  = Bundle.main.decode("animals.json")
    
    static var previews: some View {
        AnimalGriditemView(animal: animals[0])
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
