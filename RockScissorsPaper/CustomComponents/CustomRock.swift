//
//  CustomRock.swift
//  RockScissorsPaper
//
//  Created by Saltanat Kuanyshbek on 15.05.2022.
//

import SwiftUI

struct CustomRock: View {
    var body: some View {
        ZStack{
            Image(systemName: "square")
                .font(.system(size: 50))
                .foregroundColor(.black)
            RoundedRectangle(cornerRadius: 48)
                .foregroundColor(.gray)
                .opacity(0.1)
                .frame(width: 342, height: 128, alignment: .center)
        }
    }
}

struct CustomRock_Previews: PreviewProvider {
    static var previews: some View {
        CustomRock()
    }
}
