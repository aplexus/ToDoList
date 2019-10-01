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
    
   // Свойство которое вычисляет дату и задает стили отображения
    static let dueDateFormatter: DateFormatter = {
        let formatter = DateFormatter ()
        formatter.dateStyle = .short
        formatter.timeStyle = .short
        return formatter
    } ()

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
