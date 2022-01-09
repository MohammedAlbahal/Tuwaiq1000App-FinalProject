//
//  ViewController.swift
//  ExcelCollectionViewLayout
//
//  Created by Rafael Rocha on 10/02/2017.
//  Copyright (c) 2017 Rafael Rocha. All rights reserved.
//

import UIKit
import FirebaseFirestore
import ExcelCollectionViewLayout

struct ProjectGrade: Codable {
    var id = UUID().uuidString
    let studentName: String
    let gradeValue: Double
    let projectNumber: String
//    let interaction: String
    
    var json: [String: Any] {
        guard let jsonData = try? JSONEncoder().encode(self) else {
            return [:]
        }
        
        let dict = try? JSONSerialization.jsonObject(with: jsonData, options: .allowFragments) as? [String: Any]
        return dict ?? [:]
        
    }
}

struct GradeValue {
    let value: Double
    let projectGradeId: String
}


class VvviewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate, ExcelCollectionViewLayoutDelegate {

    @IBOutlet weak var collectionView: UICollectionView!
    
    // Data
    let salary: Int = 2000
    let topLeftString: String = "Student Name"
    var topLabels: [String] = []
    var studentsNames: [String] = []
    var gradesValues: [[GradeValue]] = []
//    var interactionn: [String] = []
    var projectsGrades = [
        ProjectGrade(studentName: "Hassan", gradeValue: 80, projectNumber: "Project 1" ),
        ProjectGrade(studentName: "Hassan", gradeValue: 25, projectNumber: "Midtearm" ),
        ProjectGrade(studentName: "Hassan", gradeValue: 28, projectNumber: "Final exam" ),
        ProjectGrade(studentName: "Hassan", gradeValue: 9, projectNumber: "Activity"),
        ProjectGrade(studentName: "Hanan", gradeValue: 90, projectNumber: "Project 1"),
        ProjectGrade(studentName: "Hanan", gradeValue: 9, projectNumber: "Activity"),
        ProjectGrade(studentName: "Fawaz", gradeValue: 80, projectNumber: "Project 1"),
        ProjectGrade(studentName: "Fawaz", gradeValue: 9, projectNumber: "Activity"),
        ProjectGrade(studentName: "Hassan", gradeValue: 60, projectNumber: "Project 2"),
        ProjectGrade(studentName: "Hanan", gradeValue: 70, projectNumber: "Project 2"),
        ProjectGrade(studentName: "Fawaz", gradeValue: 50, projectNumber: "Project 2"),
        ProjectGrade(studentName: "Hassan", gradeValue: 60, projectNumber: "Project 3"),
        ProjectGrade(studentName: "Hanan", gradeValue: 70, projectNumber: "Project 3"),
        ProjectGrade(studentName: "Fawaz", gradeValue: 50, projectNumber: "Project 3")
    ]
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        let newGrade = ProjectGrade(studentName: "moahhmed", gradeValue: 100, projectNumber: "p\(Int.random(in: 1...5))")
        Firestore.firestore()
            .collection("grades").document(newGrade.id)
            .setData(newGrade.json)
        
        fetchData()
    }
    
    func fetchData() {
        Firestore.firestore().collection("grades").getDocuments(source: .server) { query, error in
            let docs = query?.documents ?? []
            let docsData = docs.compactMap { $0.data() }
            self.projectsGrades = docsData.map { data in
                ProjectGrade(
                    id: data["id"] as? String ?? "",
                    studentName: data["studentName"] as? String ?? "",
                    gradeValue: data["gradeValue"] as? Double ?? 0,
                    projectNumber: data["projectNumber"] as? String ?? ""
                )
            }
            
            self.setupData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.dataSource = self
        collectionView.delegate = self
        
        if let collectionLayout = collectionView.collectionViewLayout as? ExcelCollectionViewLayout {
            collectionLayout.delegate = self
        }
    }
    
    func setupData() {
        topLabels = []
        studentsNames = []
        gradesValues = []
        
        for projectGrade in projectsGrades {
            let projectName = "\(projectGrade.projectNumber)"
            if !topLabels.contains(projectName) {
                topLabels.append(projectName)
            }
            let studentName = projectGrade.studentName
            if !studentsNames.contains(studentName) {
                studentsNames.append(studentName)
            }
        }
        topLabels = topLabels.sorted()
        studentsNames = studentsNames.sorted()
        
        for studentsName in studentsNames {
            var studentProjectsGrades: [GradeValue] = []
            
            for topLabel in topLabels {
                guard let gradeValue = (projectsGrades.first { projectGrade in
                    "\(projectGrade.projectNumber)" == topLabel
                    && projectGrade.studentName == studentsName
                }) else { continue }
                studentProjectsGrades.append(GradeValue(value: gradeValue.gradeValue, projectGradeId: gradeValue.id))
            }
                    
            gradesValues.append(studentProjectsGrades)
        }
        
        collectionView.reloadData()
    }
    
    // MARK: - ExcelCollectionViewLayoutDelegate
    
    func collectionViewLayout(_ collectionViewLayout: ExcelCollectionViewLayout, sizeForItemAtColumn columnIndex: Int) -> CGSize {
        if columnIndex == 0 {
//            let biggestMo = interactionn.max(by: { $1.count > $0.count })!
            let biggestMonth = studentsNames.max(by: { $1.count > $0.count }) ?? ""
            let biggestString = biggestMonth.count > topLeftString.count ? biggestMonth : topLeftString
            
            let size: CGSize = biggestString.size(withAttributes: [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 17)])
            let width: CGFloat = size.width + 30
            return CGSize(width: width, height: 70)
        }
        
//        var columnData: [String] = []
//        for index in 0..<monthlyValues.count {
//            let valueFormatted = formatCurrency(monthlyValues[index][columnIndex - 1])
//            columnData.append(valueFormatted)
//        }
//        let biggestValue = String(describing:
//            columnData.max(by: {
//                String(describing: $1).count > String(describing: $0).count
//            })!
//        )
//        let topString = topLabels[columnIndex - 1]
//        let biggestString = biggestValue.count > topString.count ? biggestValue : topString
//
//        let size: CGSize = biggestString.size(withAttributes: [NSAttributedStringKey.font: UIFont.systemFont(ofSize: 17)])
//        let width: CGFloat = size.width + 30
        return CGSize(width: 100, height: 70)
    }

    // MARK: - Collection view
    
    // Rows
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return studentsNames.count + 1
    }
    
    // Columns
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return topLabels.count + 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CollectionCell", for: indexPath)
        
        let label = cell.viewWithTag(10) as! UILabel
        
        if indexPath.section == 0 && indexPath.row == 0 {
            label.text = topLeftString
        } else if indexPath.section == 0 {
            label.text = topLabels[indexPath.row - 1]
            label.textColor = .black
//        } else if indexPath.section == 0 {
//            label.text = interactionn[indexPath.row - 1]
//            label.textColor = .black
        } else if indexPath.row == 0 {
            label.text = studentsNames[indexPath.section - 1]
            label.textColor = .black
        } else {
            let value = gradesValues[indexPath.section - 1][indexPath.row - 1]
            label.text = "\(value.value)"
//            label.textColor = value < 0 ? .red : .black
        }
        
        if indexPath.section == 0 || indexPath.row == 0 {
            label.font = UIFont.boldSystemFont(ofSize: label.font.pointSize)
        } else {
            label.font = UIFont.systemFont(ofSize: label.font.pointSize)
        }
        
        cell.backgroundColor = indexPath.section % 2 == 0 ? .white : UIColor(white: 0.95, alpha: 1)
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let gradeValue = gradesValues[indexPath.section - 1][indexPath.row - 1]
        
        Firestore.firestore()
            .collection("grades").document(gradeValue.projectGradeId)
            .setData([
                "id": gradeValue.projectGradeId,
                "gradeValue": Int.random(in: 1...4)
            ], merge: true) { error in
                self.fetchData()
            }
        
        
    }
    
    
    func formatCurrency(_ value: Int) -> String {
        let number = NSNumber(value: value)
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        return formatter.string(from: number)!
    }
}
    
    
