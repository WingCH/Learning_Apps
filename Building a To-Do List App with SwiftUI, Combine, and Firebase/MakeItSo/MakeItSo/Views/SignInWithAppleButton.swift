//
//  SigninWithAppleButton.swift
//  MakeItSo
//
//  Created by CHAN Hong Wing on 1/11/2020.
//

import Foundation
import SwiftUI
import AuthenticationServices

struct SignInWithAppleButtin: UIViewRepresentable {
    
    typealias UIViewType = ASAuthorizationAppleIDButton
    
    func makeUIView(context: Context) -> ASAuthorizationAppleIDButton {
        return ASAuthorizationAppleIDButton(type: .signIn, style: .black)
    }
    
    func updateUIView(_ uiView: ASAuthorizationAppleIDButton, context: Context) {
        
    }
    
}
