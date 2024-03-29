//
//  ToDoTableViewController.swift
//  ToDoList
//
//  Created by Aleksey Popov on 29/09/2019.
//  Copyright © 2019 Aleksey Popov. All rights reserved.
//

import UIKit

class ToDoTableViewController: UITableViewController {

    var todos = [ToDo] ()
    
    override func viewDidLoad() {
        super.viewDidLoad()
      //  Инициализируем массив, если массив пустой - инициализируется пустой массив
        todos = ToDo.loadToDos() ?? []

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // добавляем кодом стандартную кнопку Edit слева
        navigationItem.leftBarButtonItem = editButtonItem
    }

    // MARK: - Table view data source
    // Количество строк в таблице - равно количеству элементов в тудулисте
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return todos.count
    }

   // Обращаемся к каждой из строк таблицы и получет от меня что именно нужно в этой строке отобразить
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ToDoCell", for: indexPath)

        let todo = todos [indexPath.row]
        cell.textLabel?.text = todo.title

        return cell
    }


   
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
 


    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            todos.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
   

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    // Создаем две метожа unwind для двух переходов с кнопок Cancel и Save
    @IBAction func unwindCancel (cancelSegue: UIStoryboardSegue) {
        
    }
    @IBAction func unwindSave(saveSegue: UIStoryboardSegue) {
        guard let sourceViewController = saveSegue.source as? ToDoViewController else {return}
        guard let todo = sourceViewController.todo else {return}
        
        let newIndexPath = IndexPath (row: todos.count, section: 0)
        todos.append(todo)
        tableView.insertRows(at: [newIndexPath], with: .automatic)
    }
}
