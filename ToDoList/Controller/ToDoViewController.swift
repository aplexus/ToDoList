//
//  ToDoViewController.swift
//  ToDoList
//
//  Created by Aleksey Popov on 30/09/2019.
//  Copyright © 2019 Aleksey Popov. All rights reserved.
//

import UIKit

class ToDoViewController: UITableViewController {

    @IBOutlet weak var saveButton: UIBarButtonItem!
    @IBOutlet weak var isCompleteButton: UIButton!
    @IBOutlet weak var titleTestField: UITextField!
    @IBOutlet weak var dueDateLabel: UILabel!
    @IBOutlet weak var dueDatePicker: UIDatePicker!
    @IBOutlet weak var noteTextView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
updateSaveButtonState()

    }
// Создаем функцию, которая задает состояние кнопки Save в зависимости от того - заполнено текстовое поле или нет и вызываем функцию из viewDidLoad
    func updateSaveButtonState () {
        let text = titleTestField.text ?? ""
        saveButton.isEnabled = !text.isEmpty
    }
    
    // данный метод при любом изменении в поле ввода обращается к функции updateSaveButtonState()
    @IBAction func textEditingChanged(_ sender: UITextField) {
        updateSaveButtonState()
    }
    // данный метод при нажатии клавиши ввода убирает экранную клавиатуру
    @IBAction func returnPressed(_ sender: UITextField) {
        titleTestField.resignFirstResponder()
    }
    // данный метод при нажатии на кнупку "чекмарк" переключает картинку в кнопку из сотояния Selected в Default и при сл.нажатии наоборот
    @IBAction func isCompleteButtonTapped(_ sender: UIButton) {
        isCompleteButton.isSelected = !isCompleteButton.isSelected
    }
    
    
}
