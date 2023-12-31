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
import AdoptingHomeModule
import TabbarModuleInterface
import TabbarModule
import AdvertDetailModuleInterface
import AdvertDetailModule
import AdvertFilterModule
import AdvertFilterModuleInterface
import FavListModule
import FavListModuleInterface
import DependencyKit
import CreateAdvertModule
import CreateAdvertModuleInterface
import CreateAdvertListModuleInterface
import CreateAdvertListModule








final class DependencyRegister {
    func registerDependecies(){
        let dependecyEngine = DependencyEngine.shared
        dependecyEngine.register(value: OnboardingRouter(), for: OnboardingModuleInterfac.self)
        dependecyEngine.register(value: AdoptingRouter(), for: AdoptingHomeModuleInterface.self)
        dependecyEngine.register(value: TabbarRouter(), for: TabbarModuleInterface.self)
        dependecyEngine.register(value: AdvertDetailRouter(), for: AdvertDetailModuleInterface.self)
        dependecyEngine.register(value: AdvertFilterRouter(), for: AdvertFilterModuleInterface.self)
        dependecyEngine.register(value: FavListRouter(), for: FavListModuleInterface.self)
        dependecyEngine.register(value: CreateAdvertRouter(), for: CreateAdvertModuleInterface.self)
        dependecyEngine.register(value: CreateAdvertListRouter(), for: CreateAdvertListModuleInterface.self)
    }
}
