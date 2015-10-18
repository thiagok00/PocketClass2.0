//
// TabBarVC.swift
// PcketClass
//
// Created by Thiago De Angelis on 11/10/15.
// Copyright © 2015 Thiago De Angelis. All rights reserved.
//

import Foundation
import UIKit

class TabBarVC: UITabBarController, UITabBarControllerDelegate {

    var viewController1:MostrarHorarioVC!
    var viewController2:MostrarMateriasTBVC!
    var viewController3:MostrarTarefasTBVC!

    override func viewDidLoad() {

        tabBarController?.delegate = self
        
        self.delegate = self
        viewController1 = MostrarHorarioVC()
        viewController2 = MostrarMateriasTBVC()
        viewController3 = MostrarTarefasTBVC()
        
        let navController1 = UINavigationController(rootViewController: viewController1)
        let navController2 = UINavigationController(rootViewController: viewController2)
        let navController3 = UINavigationController(rootViewController: viewController3)
        //creating object of TabViewController[1,2,3] class
        
        //creating object of UITabBarController class
        self.viewControllers = [navController1 , navController2 , navController3]
        //adding all three views to the TabBarView
        let item1 = UITabBarItem(title: "Horario", image: UIImage(named: "horarioBarItem"), tag: 0)
        let item2 = UITabBarItem(title: "Materias", image: UIImage(named: "materiasBarItem"), tag: 1)
        let item3 = UITabBarItem(title: "Tarefas", image: UIImage(named: "tarefasBarItem"), tag: 2)
        //defining the items of the TabBar corresponding to three views
        viewController1.tabBarItem = item1
        viewController2.tabBarItem = item2
        viewController3.tabBarItem = item3
    }

    func tabBarController(tabBarController: UITabBarController, shouldSelectViewController viewController: UIViewController) -> Bool {
        if tabBarController.selectedIndex == 2{
            NSNotificationCenter.defaultCenter().postNotificationName("popCadastroTarefa", object: nil)
        }
        else if tabBarController.selectedIndex == 1 {
            NSNotificationCenter.defaultCenter().postNotificationName("popCadastroMateria", object:nil)
        }
        
        return true
    }
    

    
    
}//End of Class