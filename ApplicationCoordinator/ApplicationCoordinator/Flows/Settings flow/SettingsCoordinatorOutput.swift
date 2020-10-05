//
//  SettingsCoordinatorOutput.swift
//  ApplicationCoordinator
//
//  Created by WingCH on 5/10/2020.
//  Copyright © 2020 Andrey Panov. All rights reserved.
//

protocol SettingsCoordinatorOutput: class {
  var finishFlow: (() -> Void)? { get set }
}
