//
//  SinglePlayer.swift
//  RockScissorsPaper
//
//  Created by Saltanat Kuanyshbek on 15.05.2022.
//

import SwiftUI

enum Choice{
    case rock
    case scissors
    case paper
    case none
}

struct SinglePlayer: View {
    @State private var Choice: Choice = .none
    @State private var isRockViewVisible = true
    @State private var isPaperViewVisible = true
    @State private var isScissorsViewVisible = true
    @State private var isChoiceButtonVisible = false
    @State private var userChoice = false
    @State var goToNextPage:Bool = false
    
    var body: some View {
        ZStack{
            VStack{
                Group{
                    if Choice != .none{
                        Text("Your pick")
                            .foregroundColor(.black)
                            .font(.system(size: 54))
                            .bold()
                    }
                    else{
                        Text("Take your pick")
                            .foregroundColor(.black)
                            .font(.system(size: 54))
                            .bold()
                    }
                }.padding(.bottom, 12)
                
                Text("Score")
                    .foregroundColor(.black)
                    .font(.system(size: 17))
                Spacer()
                
                Button(action: {
                    Choice = .paper
                    isChoiceButtonVisible = true
                } ,label: {
                    CustomPaper()
                        .opacity(isPaperViewVisible == true ? 1 : 0)
                })
                
                Button(action: {
                    Choice = .scissors
                    isChoiceButtonVisible = true
                } ,label: {
                    CustomScissors()
                        .opacity(isScissorsViewVisible == true ? 1 : 0)
                })
                
                Button(action: {
                    Choice = .rock
                    isChoiceButtonVisible = true
                } ,label: {
                    CustomRock()
                        .opacity(isRockViewVisible == true ? 1 : 0)
                })
                Spacer()
                
                Button{
                    Choice = .none
                    isChoiceButtonVisible = false
                } label: {
                    ZStack{
                        RoundedRectangle(cornerRadius: 8)
                            .frame(width: 358, height: 50, alignment: .center)
                            .foregroundColor(Color(red: 103/245, green: 80/245, blue: 164/245))
                            .cornerRadius(8)
                        Text("I changed my mind")
                            .foregroundColor(.white)
                            .font(.system(size: 16, weight: .medium))
                    }.opacity(isChoiceButtonVisible == false ? 0 : 1)
                }
                NavigationLink(isActive: $goToNextPage) {
                    CPUchoice()
                } label: {
                }
            }
        }
        .onChange(of: Choice) { choice in
            manageChoiceViewsVisibility(choice)
            DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
                if Choice != .none{
                    goToNextPage = true
                }
            }
        }
    }
    
    func manageChoiceViewsVisibility(_ choice: Choice)
    {
        switch choice {
        case .rock:
            isPaperViewVisible = false
            isScissorsViewVisible = false
        case .scissors:
            isPaperViewVisible = false
            isRockViewVisible = false
        case .paper:
            isScissorsViewVisible = false
            isRockViewVisible = false
        case .none:
            isRockViewVisible = true
            isPaperViewVisible = true
            isScissorsViewVisible = true
        }
    }
    
}

struct SinglePlayer_Previews: PreviewProvider {
    static var previews: some View {
        SinglePlayer()
    }
}
