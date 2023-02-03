//
//  CreditsView.swift
//  AfricaApp
//
//  Created by Daniel on 09.09.2022.
//

import SwiftUI

struct CreditsView: View {
    var body: some View {
        VStack {
            Image("compass")
                .resizable()
                .scaledToFit()
                .frame(width: 129, height: 129)
            
            Text("""
                 Copyright © Robert Petras
                 All right reserved
                 Better Apps ♡ Less Code
                 """)
                .font(.footnote)
                .multilineTextAlignment(.center)
        }
        .padding()
        .opacity(0.4)
    }
}

struct CreditsView_Previews: PreviewProvider {
    static var previews: some View {
        CreditsView()
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
