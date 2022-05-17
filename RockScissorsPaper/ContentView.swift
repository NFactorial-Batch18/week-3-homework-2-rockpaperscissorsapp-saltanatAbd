//
//  ContentView.swift
//  RockScissorsPaper
//
//  Created by Saltanat Kuanyshbek on 13.05.2022.
//

import SwiftUI

struct ContentView: View {
    @State private var SinglePlayerMode:Bool = false
    @State private var MultiPlayerMode:Bool = false
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    var body: some View {
        NavigationView{
        ZStack{
            Image("BackgroundImage")
                .resizable()
                .edgesIgnoringSafeArea(.all)
                .aspectRatio(contentMode: .fill)
            VStack{
                Text("Welcome to the game")
                    .foregroundColor(.white)
                    .bold()
                    .font(.system(size: 54))
                    .multilineTextAlignment(.center)
                    .lineLimit(2)
                    .padding(.top, 50)
                Spacer()
                
                Button(action: {
                    SinglePlayerMode = true
                } ,label: {
                    NavigationLink("Single player", isActive: $SinglePlayerMode){
                        SinglePlayer()
                    }
                        .foregroundColor(.white)
                        .font(.system(size: 16))
                        .frame(width: 358, height: 50, alignment: .center)
                        .background(Color(red: 103/245, green: 80/245, blue: 164/245))
                        .cornerRadius(8)
                })
                
                Button(action: {
                    MultiPlayerMode = true
                } ,label: {
                    NavigationLink("Multi player", isActive: $MultiPlayerMode){
                        RockScissorsPaper.MultiPlayerMode()
                    }
                        .foregroundColor(.white)
                        .font(.system(size: 16))
                        .frame(width: 358, height: 50, alignment: .center)
                        .background(Color(red: 103/245, green: 80/245, blue: 164/245))
                        .cornerRadius(8)
                })
                .padding(.bottom, 80)
            }
        }
        }.navigationTitle("Start page")
    }
}

struct MultiPlayerMode:View{
    var body: some View{
        Text("Hello2")
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
