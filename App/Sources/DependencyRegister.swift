//
//  DependencyRegister.swift
//  Paw
//
//  Created by engin gülek on 8.11.2023.
//

import Foundation

import OnboardingModule
import OnboardingModuleInterface
import AdoptingHomeModuleInterface
import DependencyKit
import AdoptingHomeModule


final class DependencyRegister {
    func registerDependecies(){
        let dependecyEngine = DependencyEngine.shared
        dependecyEngine.register(value: OnboardingRouter(), for: OnboardingModuleInterfac.self)
        dependecyEngine.register(value: AdoptingRouter(), for: AdoptingHomeModuleInterface.self)
    }
}
