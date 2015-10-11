//
// TabBarVC.swift
// PcketClass
//
// Created by Thiago De Angelis on 11/10/15.
// Copyright © 2015 Thiago De Angelis. All rights reserved.
//

import Foundation
import UIKit

class TabBarVC: UITabBarController {
    
    override func viewDidLoad() {
        
        
        let viewController1 = MostrarHorarioVC()
        let viewController2 = MostrarMateriasTBVC()
        let viewController3 = MostrarTarefasTBVC()
        
        let navController = UINavigationController(rootViewController: viewController2)
        
        //creating object of TabViewController[1,2,3] class
        
        //creating object of UITabBarController class
        self.viewControllers = [viewController1 , navController , viewController3]
        //adding all three views to the TabBarView
        let item1 = UITabBarItem(title: "Horario", image: UIImage(named: "horarioBarItem"), tag: 0)
        let item2 = UITabBarItem(title: "Materias", image: UIImage(named: "materiasBarItem"), tag: 1)
        let item3 = UITabBarItem(title: "Tarefas", image: UIImage(named: "tarefasBarItem"), tag: 2)
        //defining the items of the TabBar corresponding to three views
        viewController1.tabBarItem = item1
        viewController2.tabBarItem = item2
        viewController3.tabBarItem = item3
        
        
        
        
        
    }
    
    
    
    
}