//
//  ColoredTagView.swift
//  FriendFace
//
//  Created by Maximilian Berndt on 2023/04/05.
//

import SwiftUI

struct ColoredTagView: View {
    
    let text: String
    let foregroundColor: Color?
    let backgroundColor: Color?
    
    var body: some View {
        Text(text)
            .font(.subheadline)
            .padding(15)
            .foregroundColor(foregroundColor ?? .white)
            .background(backgroundColor ?? .black)
            .clipShape(RoundedRectangle(cornerRadius: 25))
    }
}

struct ColoredTagView_Previews: PreviewProvider {
    static var previews: some View {
        ColoredTagView(
            text: "Hermione Granger",
            foregroundColor: nil,
            backgroundColor: nil
        )
    }
}
