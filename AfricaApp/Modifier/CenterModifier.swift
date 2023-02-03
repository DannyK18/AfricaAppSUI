//
//  CenterModifier.swift
//  AfricaApp
//
//  Created by Daniel on 09.09.2022.
//

import SwiftUI

struct CenterModifier: ViewModifier {
    func body(content: Content) -> some View {
        HStack {
            Spacer()
            content
            Spacer()
        }
    }
}
