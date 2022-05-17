//
//  CPUchoice.swift
//  RockScissorsPaper
//
//  Created by Saltanat Kuanyshbek on 15.05.2022.
//

import SwiftUI

struct CPUchoice: View {
    @State var goToNextPage = false
    
    var body: some View {
        VStack{
            Text("Your opponent is thinking")
                .foregroundColor(.black)
                .font(.system(size: 54))
                .bold()
                .multilineTextAlignment(.center)
                .lineLimit(3)
            ZStack{
                Image(systemName: "circle.dotted")
                    .font(.system(size: 60))
            RoundedRectangle(cornerRadius: 48)
                    .foregroundColor(.gray)
                    .opacity(0.1)
                .frame(width: 342, height: 128, alignment: .center)
            }.padding(.top, 110)
            .padding(.bottom, 200)
            NavigationLink(isActive: $goToNextPage) {
                CPUrandom()
            } label: {
            }
        }.onAppear {
            DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
               goToNextPage = true
            }
         }
    }
}

struct CPUrandom:View{
    @State var goToNextPage = false

    var body: some View{
        VStack{
            Text("Your opponent's choice")
                .foregroundColor(.black)
                .font(.system(size: 54))
                .bold()
                .multilineTextAlignment(.center)
                .lineLimit(3)
            ZStack{
                let weapon = machineChoice()
                if weapon == .paper{
                    CustomPaper()
                }
                if weapon == .rock{
                    CustomRock()
                }
                if weapon == .scissors{
                    CustomScissors()
                }
            }.padding(.top, 110)
                .padding(.bottom, 200)
//            NavigationLink(isActive: $goToNextPage) {
//                FightResult()
//            } label: {
//            }
        }.onAppear {
            DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
               goToNextPage = true
            }
         }
    }
    
    func machineChoice() ->Choice{
        let sign = Int.random(in: 1...3)
        if sign == 1{
            return .rock
        } else if sign == 2{
            return .paper
        } else{
            return .scissors
        }
    }
}

struct CPUchoice_Previews: PreviewProvider {
    static var previews: some View {
        CPUchoice()
    }
}
