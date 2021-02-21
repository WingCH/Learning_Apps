//
//  CustomTabbar.swift
//  SwiftUI_Component
//
//  Created by CHAN Hong Wing on 11/12/2020.
//

import SwiftUI

// ref: https://trailingclosure.com/custom-tabbar/
// Difference between a ZStack or using .overlay(): https://stackoverflow.com/a/63446622/5588637
struct CustomTabbar: View {
    @State var selection: Int = 0

    var body: some View {

        // Your native TabView here
        TabView(selection: $selection) {
            Text("A")
                .tag(0)

            Text("B")
                .tag(1)

            Text("C")
                .tag(2)
        }
        .overlay( // Overlay the custom TabView component here
            Color.white // Base color for Tab Bar
                .edgesIgnoringSafeArea(.vertical)
                .frame(height: 50) // Match Height of native bar
                .overlay(HStack {
                    Spacer()

                    // First Tab Button
                    Button(action: {
                        self.selection = 0
                    }, label: {
                        Image(systemName: "house.fill")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 25, height: 25, alignment: .center)
                            .foregroundColor(Color(red: 32/255, green: 43/255, blue: 63/255))
                            .opacity(selection == 0 ? 1 : 0.4)
                    })
                    Spacer()

                    // Second Tab Button
                    Button(action: {
                        self.selection = 1
                    }, label: {
                        Image(systemName: "heart.fill")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 25, height: 25, alignment: .center)
                            .foregroundColor(Color(red: 32/255, green: 43/255, blue: 63/255))
                            .opacity(selection == 1 ? 1 : 0.4)
                    })

                    Spacer()

                    // Third Tab Button
                    Button(action: {
                        self.selection = 2
                    }, label: {
                        Image(systemName: "gear")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 25, height: 25, alignment: .center)
                            .foregroundColor(Color(red: 32/255, green: 43/255, blue: 63/255))
                            .opacity(selection == 2 ? 1 : 0.4)
                    })
                    Spacer()

                }).shadow(radius: 10)
            ,alignment: .bottom) // Align the overlay to bottom to ensure tab bar stays pinned.
    }
}

struct CustomTabbar_Previews: PreviewProvider {
    static var previews: some View {
        CustomTabbar()
    }
}
