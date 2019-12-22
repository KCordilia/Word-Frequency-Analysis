//
//  ViewController.swift
//  Word Frequency Analysis
//
//  Created by Karim Cordilia on 28/06/2019.
//  Copyright © 2019 Karim Cordilia. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextViewDelegate {

    @IBOutlet weak var textField: UITextView!
    @IBOutlet weak var tableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        textField.text = "Enter text here..."
        textField.textColor = UIColor.lightGray
        tableView.dataSource = self
        self.hideKeyboardWhenTappedAround()
    }
    
    func textViewDidBeginEditing(_ textView: UITextView) {
        if textView.textColor == .lightGray {
            textView.text = nil
            textView.textColor = .black
        }
    }
    
    func textViewDidEndEditing(_ textView: UITextView) {
        if textView.text.isEmpty {
            textView.text = "Enter text here..."
            textView.textColor = .lightGray
        }
    }
    
    @IBAction func clearEverything(_ sender: Any) {
        CountedWords.countedWords.removeAll()
        textField.text = ""
        textField.becomeFirstResponder()
        tableView.reloadData()
    }
    
    @IBAction func countWords(_ sender: Any) {
        separateAndCountWords(in: textField.text)
        tableView.reloadData()
        textField.resignFirstResponder()
//        CountedWords.history.append(textField.text)
//        print(CountedWords.history)
    }
}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return CountedWords.countedWords.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "wordCell", for: indexPath)
        cell.textLabel?.text = "\(CountedWords.countedWords[indexPath.row])"
        return cell
    }
}

extension UIViewController {
    func hideKeyboardWhenTappedAround() {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(UIViewController.dismissKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
}

