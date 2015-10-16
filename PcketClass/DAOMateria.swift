//
//  DAOMateria.swift
//  PcketClass
//
//  Created by Thiago De Angelis on 18/09/15.
//  Copyright © 2015 Thiago De Angelis. All rights reserved.
//

import Foundation

class DAOMateria {
    
    private func getPath()->String {
    
        let rootPath: String = NSSearchPathForDirectoriesInDomains(NSSearchPathDirectory.DocumentDirectory, NSSearchPathDomainMask.UserDomainMask, true)[0]
        let plistPath = rootPath.stringByAppendingString("/Materias.plist")
        let fileManager: NSFileManager = NSFileManager.defaultManager()
        
        if !fileManager.fileExistsAtPath(plistPath) {
            
            let bundlePath: String? = NSBundle.mainBundle().pathForResource("Materias", ofType: "plist")
            
            if let bundle = bundlePath {
                do {
                    try fileManager.copyItemAtPath(bundle, toPath: plistPath)
                }
                catch let error as NSError {
                    print("Erro ao copiar Materias.plist do mainBundle para plistPath: \(error.description)")
                }
            }
            else {
                print("Materias.plist não está no mainBundle")
            }
        }
        return plistPath
    }
    
    func salva(materias:[Materia]) {

        let plistPath = self.getPath()
        
        let rootArray: NSMutableArray = NSMutableArray(capacity: materias.count)
        
        for materia in materias {
        
            let materiaDict: NSMutableDictionary = NSMutableDictionary()
            let tarefaArray: NSMutableArray = NSMutableArray(capacity: materia.tarefas!.count)
            let aulaArray: NSMutableArray = NSMutableArray(capacity: materia.aulas!.count)
            
            for tarefa in materia.tarefas! {
            
                let tarefaDict = ["Nome":tarefa.nome,"Data":tarefa.dataFinal,"Tipo":tarefa.tipo.rawValue,"MateriaNome":tarefa.materiaNome,"Relevancia":tarefa.relevancia]
                tarefaArray.addObject(tarefaDict)
            
            }
            for aula in materia.aulas! {
            
                let aulaDict = ["Dia":aula.dia.rawValue,"Sala":aula.sala,"HoraComeco":aula.horaComeco,"HoraFinal":aula.horaFinal]
                aulaArray.addObject(aulaDict)
            }
            
            materiaDict["Nome"] = materia.nome
            materiaDict["Codigo"] = materia.codigo
            materiaDict["Turma"] = materia.turma
            materiaDict["Tarefas"] = tarefaArray
            materiaDict["Aulas"] = aulaArray
            rootArray.addObject(materiaDict)
        }
        
        rootArray.writeToFile(plistPath, atomically: true)
        let cache = UserInfo.sharedInstance
        cache.materias = materias
        print("Salvo na Materias plist com sucesso.")
        
    
    } //fim salva
    
    
    
    
     func carrega()->[Materia] {
        let cache = UserInfo.sharedInstance
        if cache.materias == nil {
            
            let plistPath = self.getPath()
            var materiasArray = [Materia]()
            let materiasDicts = NSMutableArray(contentsOfFile:plistPath)

            if materiasDicts == nil || materiasDicts?.count == 0 {
                cache.materias = materiasArray
                return materiasArray
            }
    
            

            for materiaDict in materiasDicts! {
                
                let dict: NSDictionary = materiaDict as! NSDictionary
                let tarefasDict: NSArray = dict.valueForKey("Tarefas") as! NSArray
                let aulasDict: NSArray = dict.valueForKey("Aulas") as! NSArray
                
                var tarefasArray = [Tarefa]()
                var aulasArray = [Aula]()
                
                
                for tarefaElem in tarefasDict {
                    let tarefaDict: NSDictionary = tarefaElem as! NSDictionary
                    
                    let tarefa = Tarefa(nome: tarefaDict.valueForKey("Nome") as! String, dataFinal: tarefaDict.valueForKey("Data") as! NSDate, tipo: tfTipo(rawValue:tarefaDict.valueForKey("Tipo") as! String)!, materiaNome: tarefaDict.valueForKey("MateriaNome") as! String, relevancia: tarefaDict.valueForKey("Relevancia") as! Float)
                    
                    tarefasArray.append(tarefa)
                }
                
                for aulaElem in aulasDict {
                    let aulaDict: NSDictionary = aulaElem as! NSDictionary
                
                    
                    let aula = Aula(dia: Dia.createDay(aulaDict.valueForKey("Dia") as! Int), sala: aulaDict.valueForKey("Sala") as! String, horaComeco: aulaDict.valueForKey("HoraComeco") as! Int, horaFinal: aulaDict.valueForKey("HoraFinal") as! Int)
                    aulasArray.append(aula)
                
                }
                
                let materia = Materia(nome: materiaDict.valueForKey("Nome") as! String)
                materia.codigo = materiaDict.valueForKey("Codigo") as! String
                materia.turma = materiaDict.valueForKey("Turma") as! String
                materia.aulas = aulasArray
                materia.tarefas = tarefasArray
                materiasArray.append(materia)
                
            }
            UserInfo.sharedInstance.materias = materiasArray
            print("Carregado da Materias plist com sucesso.")
            }
        return cache.materias!
        
    } // Fim Carrega
    
} //End of Class