//
//  NoteVC.swift
//  note
//
//  Created by Hadi Albinsaad on 11/18/21.
//

import Foundation
import UIKit

class NoteVC: UIViewController, UITextFieldDelegate {
	
	var note: Note?
	
	lazy var contentTF: UITextField = {
		let tf = UITextField()
		tf.translatesAutoresizingMaskIntoConstraints = false
		tf.placeholder = "Add some note.."
		tf.delegate = self
		return tf
	}()
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		title = "Edit Note"
		view.backgroundColor = .white
		view.addSubview(contentTF)
		NSLayoutConstraint.activate([
			contentTF.topAnchor.constraint(equalTo: view.topAnchor, constant: 100),
			contentTF.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 16),
			contentTF.rightAnchor.constraint(equalTo: view.rightAnchor, constant: 16),
			contentTF.heightAnchor.constraint(equalToConstant: 100),
		])
		
		contentTF.text = note?.content
	}
	
	func textFieldShouldReturn(_ textField: UITextField) -> Bool {
		contentTF.resignFirstResponder()
		note?.content = contentTF.text ?? ""
		guard let note = note else { return true }
		NotesService.shared.updateOrAddNote(note: note)
		return true
	}
}
