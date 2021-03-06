//
//  SingInView.swift
//  MakeItSo
//
//  Created by CHAN Hong Wing on 1/11/2020.
//

import SwiftUI

struct SingInView: View {
    @Environment(\.presentationMode) var presentationMode
    @State var coordinator:SignInWithAppleCoordinator?
    
    var body: some View {
        VStack {
            Text("Thanks for using Make It So. Please sign in here")
            SignInWithAppleButtin()
                .frame(width: 288, height: 45)
                .onTapGesture(count: 1, perform: {
                    self.coordinator = SignInWithAppleCoordinator()
                    if let coordinator = self.coordinator {
                        coordinator.startSignInWithAppleFlow {
                            print("You successfully signed in")
                            self.presentationMode.wrappedValue.dismiss()
                        }
                    }
                })
            
        }
    }
}

struct SingInView_Previews: PreviewProvider {
    static var previews: some View {
        SingInView()
    }
}
