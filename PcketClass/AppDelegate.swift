//
//  AppDelegate.swift
//  PcketClass
//
//  Created by Thiago De Angelis on 18/09/15.
//  Copyright © 2015 Thiago De Angelis. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    var viewController1 : MostrarHorarioVC?
    var viewController2 : MostrarMateriasTBVC?
    var viewController3 : MostrarTarefasTBVC?


    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {

//        window = UIWindow(frame: UIScreen.mainScreen().bounds)
//        //setting the initial screen bounds of the view
//        self.viewController1 = MostrarHorarioVC()
//        self.viewController2 = MostrarMateriasTBVC()
//        self.viewController3 = MostrarTarefasTBVC()
//        //creating object of TabViewController[1,2,3] class
//        let tabBarController = UITabBarController()
//        //creating object of UITabBarController class
//        tabBarController.viewControllers = [viewController1! , viewController2! , viewController3!]
//        //adding all three views to the TabBarView
//        let item1 = UITabBarItem(title: "Horario", image: UIImage(named: "horarioBarItem"), tag: 0)
//        let item2 = UITabBarItem(title: "Materias", image: UIImage(named: "materiasBarItem"), tag: 1)
//        let item3 = UITabBarItem(title: "Tarefas", image: UIImage(named: "tarefasBarItem"), tag: 2)
//        //defining the items of the TabBar corresponding to three views
//        viewController1?.tabBarItem = item1
//        viewController2?.tabBarItem = item2
//        viewController3?.tabBarItem = item3
//        //setting TabBarItems corresponding to each view in TabBarController
//        
//        self.window?.rootViewController = tabBarController
//        //setting the initial VieController as tabBarController
//        
//        window?.makeKeyAndVisible()

        return true
    }

    func applicationWillResignActive(application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(application: UIApplication) {
        // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}

