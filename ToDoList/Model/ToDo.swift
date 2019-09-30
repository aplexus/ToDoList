//
//  ToDo.swift
//  ToDoList
//
//  Created by Aleksey Popov on 29/09/2019.
//  Copyright © 2019 Aleksey Popov. All rights reserved.
//

import Foundation

struct ToDo {
    var title: String
    var isComplete: Bool
    var date: Date
    var notes: String?

static func loadToDos() -> [ToDo]? {
  return loadSampleToDos()
    }
    
    static func loadSampleToDos () -> [ToDo] {
        return [
        ToDo (title: "Купить молока", isComplete:  false, date: Date(), notes: nil),
        ToDo (title: "купить хлеба", isComplete: false, date: Date (), notes: nil),
        ToDo (title: "сходить в аптеку", isComplete: false, date: Date (), notes: nil)
        ]
    }
}
