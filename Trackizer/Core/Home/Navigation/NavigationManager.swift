//
//  NavigationManager.swift
//  Trackizer
//
//  Created by Modamori Oluwayomi on 2024-05-23.
//

import SwiftUI

class  NavigationManager: ObservableObject {
    @Published var currentScreen: Screen = .main
    
    enum Screen {
        case main, register, login, empty
    }
    
    func navigate(to screen: Screen){
        currentScreen = screen
    }
}

