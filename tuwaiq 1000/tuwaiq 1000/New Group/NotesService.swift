//
//  NotesService.swift
//  note
//
//  Created by Hadi Albinsaad on 11/18/21.
//

import UIKit
import FirebaseFirestore


class NotesService {
	static let shared = NotesService()
	let notesCollection = Firestore.firestore().collection("notes")
	
	func updateOrAddNote(note: Note) {
		notesCollection.document(note.id).setData([
			"id": note.id,
			"content": note.content
		], merge: true)
	}
	
	func listenToNotes(completion: @escaping (([Note]) -> Void)) {
		notesCollection.addSnapshotListener { snapshot, error in
			if error != nil {
				return
			}
			
			guard let docs = snapshot?.documents else { return }
			var notes = [Note]()
			
			for doc in docs {
				let data = doc.data()
				guard
					let id = data["id"] as? String,
					let content = data["content"] as? String
				else {
					continue
				}
				
				notes.append(Note(id: id, content: content))
			}
			
			completion(notes)
		}
	}
}


