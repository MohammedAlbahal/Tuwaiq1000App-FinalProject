//
//  NoteListVC.swift
//  note
//
//  Created by Hadi Albinsaad on 11/18/21.
//

import UIKit

class NoteListVC: UIViewController {
	
	let cellId = "NoteCell"
	var notes = [
		Note(id: UUID().uuidString, content: "Hello this is a test")
	]
	
	lazy var notesTV: UITableView = {
		let tv = UITableView()
		tv.register(UITableViewCell.self, forCellReuseIdentifier: cellId)
		tv.delegate = self
		tv.dataSource = self
		tv.translatesAutoresizingMaskIntoConstraints = false
		return tv
	}()
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		NotesService.shared.listenToNotes { newNotes in
			self.notes = newNotes
			self.notesTV.reloadData()
		}
		
		title = "Notes"
		navigationItem.rightBarButtonItem = UIBarButtonItem(
			barButtonSystemItem: .add,
			target: self,
			action: #selector(addNewNote)
		)
		view.backgroundColor = .white
		
		view.addSubview(notesTV)
		NSLayoutConstraint.activate([
			notesTV.topAnchor.constraint(equalTo: view.topAnchor),
			notesTV.leftAnchor.constraint(equalTo: view.leftAnchor),
			notesTV.rightAnchor.constraint(equalTo: view.rightAnchor),
			notesTV.bottomAnchor.constraint(equalTo: view.bottomAnchor),
		])
	}
	
	@objc func addNewNote() {
		let note = Note(id: UUID().uuidString, content: "New note")
		NotesService.shared.updateOrAddNote(note: note)
	}
}

extension NoteListVC: UITableViewDataSource, UITableViewDelegate {
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return notes.count
	}
	
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		let cell = UITableViewCell(style: .default, reuseIdentifier: cellId)
		
		let note = notes[indexPath.row]
		cell.textLabel?.text = note.content
		
		return cell
	}
	
	func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
		let note = notes[indexPath.row]
		
		let noteVC = NoteVC()
		noteVC.note = note
		
		navigationController?.pushViewController(
			noteVC,
			animated: true
		)
	}
}
