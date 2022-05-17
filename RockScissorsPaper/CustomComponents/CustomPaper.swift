//
//  CustomPaper.swift
//  RockScissorsPaper
//
//  Created by Saltanat Kuanyshbek on 15.05.2022.
//

import SwiftUI

struct CustomPaper: View {
    var body: some View {
        ZStack{
            Image(systemName: "book")
                .font(.system(size: 50))
                .foregroundColor(.black)
            RoundedRectangle(cornerRadius: 48)
                .foregroundColor(.gray)
                .opacity(0.1)
                .frame(width: 342, height: 128, alignment: .center)
        }
    }
}

struct CustomPaper_Previews: PreviewProvider {
    static var previews: some View {
        CustomPaper()
    }
}
