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
    
    var isPickerHidden = true {
        didSet {
            dueDatePicker.isHidden = isPickerHidden
        }
    }
    
    var todo: ToDo?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        dueDatePicker.isHidden = isPickerHidden
        dueDatePicker.date = Date().addingTimeInterval(24*3600)
        updateDueDateLabel(date: dueDatePicker.date)
        updateSaveButtonState()
        

    }
    // Создаем функцию, которая задает состояние кнопки Save в зависимости от того - заполнено текстовое поле или нет и вызываем функцию из viewDidLoad
    func updateSaveButtonState () {
        let text = titleTestField.text ?? ""
        saveButton.isEnabled = !text.isEmpty
    }
    // метод который будет обновлять состояние DatePicker
    func updateDueDateLabel (date: Date) {
        dueDateLabel.text = ToDo.dueDateFormatter.string(from: date)
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let normalrowHeight = CGFloat(44)
        let largeCellHeght = CGFloat(200)
        
        switch indexPath {
        case [0, 2]:
            return isPickerHidden ? 0: largeCellHeght
        case [1,0]:
            return largeCellHeght
        default:
            return normalrowHeight
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        super.prepare(for: segue, sender: sender)
        guard segue.identifier == "saveUnwind" else {return}
        
        let title = titleTestField.text ?? ""
        let isComplete = isCompleteButton.isSelected
        let dueDate = dueDatePicker.date
        let notes = noteTextView.text
        
        todo = ToDo (title: title, isComplete: isComplete, date: dueDate, notes: notes)
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch indexPath{
        case [0, 1]:
            isPickerHidden = !isPickerHidden
            
            dueDateLabel.textColor = isPickerHidden ? .black : tableView.tintColor
            tableView.beginUpdates()
            tableView.endUpdates()
        default:
            break
        }
    }
    
    // данный метод при любом изменении в поле ввода обращается к функции updateSaveButtonState()
    @IBAction func textEditingChanged(_ sender: UITextField) {
        updateSaveButtonState()
    }
    // данный метод при нажатии клавиши ввода отказывается от экранной клавиатуры
    @IBAction func returnPressed(_ sender: UITextField) {
        titleTestField.resignFirstResponder()
    }
    // данный метод при нажатии на кнопку "чекмарк" переключает картинку в кнопку из сотояния Selected в Default и при сл.нажатии наоборот
    @IBAction func isCompleteButtonTapped(_ sender: UIButton) {
        isCompleteButton.isSelected = !isCompleteButton.isSelected
    }
    
    // при изменении пикера вызываем метод  updateDueDateLabel обновления лэйбла и передаем лэйблу выбранную дату u
    @IBAction func datePickerChange(_ sender: UIDatePicker) {
        updateDueDateLabel(date: dueDatePicker.date)
    }
    
}
