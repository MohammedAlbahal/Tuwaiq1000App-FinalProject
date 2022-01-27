//  tuwaiq 1000
//
//  Created by M.Al-qhtani on 07/05/1443 AH.
//

import UIKit
import FirebaseFirestore


class StudentsSservice {
	static let shared = StudentsSservice()
	
	let studentsCollection = Firestore.firestore().collection("students")
	
	
	func addStudent(student: Studentsss) {
		studentsCollection.document(student.id).setData([
			"name": student.name,
			"id": student.id
		])
	}
	
	
	func deleteStudent(studentId: String) {
		studentsCollection.document(studentId).delete()
	}
	
	
	func listenToStudents(completion: @escaping (([Studentsss]) -> Void)) {
		
		studentsCollection.addSnapshotListener { snapshot, error in
			if error != nil {
				return
			}
			
			guard let documents = snapshot?.documents else { return }
			
			var students: Array<Studentsss> = []
			for document in documents {
				let data = document.data()
				let student = Studentsss(
					name: (data["name"] as? String) ?? "No name",
					id: (data["id"] as? String) ?? "No id"
				)
				students.append(student)
			}
			
			completion(students)
		}
	}
	
	
	func listenToStudentCount(completion: @escaping ((Int) -> Void)) {
		listenToStudents { students in
			completion(students.count)
		}
	}
}
