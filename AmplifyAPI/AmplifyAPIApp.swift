//
//  AmplifyAPIApp.swift
//  AmplifyAPI
//
//  Created by John G on 02/05/2024.
//
import Amplify
import AWSCognitoAuthPlugin
import AWSAPIPlugin
import SwiftUI
import AWSDataStorePlugin

@main
struct AmplifyAPIApp: App {
    var body: some Scene {
        WindowGroup {
//            AuthView()
            ChoresView()
        }
    }
    
    init() {
        configureAmplify()
    }
    
    func configureAmplify() {
        do {
            try Amplify.add(plugin: AWSCognitoAuthPlugin())
            let models = AmplifyModels()
            try Amplify.add(plugin: AWSAPIPlugin(modelRegistration: models))
            try Amplify.add(plugin: AWSDataStorePlugin(modelRegistration: models))
            try Amplify.configure()
            print("Ampligy congifured!")
        } catch {
            print(error)
        }
    }
}
