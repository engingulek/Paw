//
//  DependencyRegister.swift
//  Paw
//
//  Created by engin gülek on 8.11.2023.
//

import Foundation

import OnboardingModule
import OnboardingModuleInterface
import DependencyKit


final class DependencyRegister {
    func registerDependecies(){
        let dependecyEngine = DependencyEngine.shared
        dependecyEngine.register(value: OnboardingRouter(), for: OnboardingModuleInterfac.self)
    }
}
