////
////  ViewController.swift
////  tuwaiq 1000
////
////  Created by m.Al-qhatani on 3/04/1443 AH.
////


import Foundation




// MARK: -  Create list of Students

// With Calendar and DateComponents class can create a new Date
// Calendar.current return actual Calendar 'Gregorian'
let defaultStudents: [Student] = [Student(photo: "me",
                                          name: "Mohammed Al-Bahal",
                                          age: Calendar.current.date(from: DateComponents(year: 1997,
                                                                                          month: 5)),
                                          email: "fawazmm79@gmail.com"),
                                  Student(photo: "tt",
                                          name: "Fawaz Mohammed",
                                          age: Calendar.current.date(from: DateComponents(year: 1995,
                                                                                          month: 5)),
                                          email: "m.albahl.q@gmail.com"),
                                  Student(photo: "ww",
                                          name: "Ibrhaem Ahmed",
                                          age: Calendar.current.date(from: DateComponents(year: 1993,
                                                                                          month: 5)),
                                          email: "m.albahl.q@gmail.com"),
                                  Student(photo: "ee",
                                          name: "Abdulaziz Alshehri",
                                          age: Calendar.current.date(from: DateComponents(year: 2000,
                                                                                          month: 5)),
                                          email: "m.albahl.q@gmail.com"),
                                  Student(photo: "rr",
                                          name: "Ahmed Assiri",
                                          age: Calendar.current.date(from: DateComponents(year: 1995,
                                                                                          month: 5)),
                                          email: "m.albahl.q@gmail.com"),
                                  Student(photo: "img_student_5",
                                          name: "Sara Saud",
                                          age: Calendar.current.date(from: DateComponents(year: 1990,
                                                                                          month: 5)),
                                          email: "Sarasaud379@gmail.com"),
                                  Student(photo: "img_student_4",
                                          name: "Jawaher Hassan",
                                          age: Calendar.current.date(from: DateComponents(year: 1997,
                                                                                          month: 9)),
                                          email: "jawaherhassan24@gmail.com"),
                                  Student(photo: "img_teacher_1",
                                          name: "Sara Mohammed",
                                          age: Calendar.current.date(from: DateComponents(year: 1997,
                                                                                          month: 9)),
                                          email: "sara@gmail.com"),
                                  Student(photo: "img_student_4",
                                          name: "Tasneem Jafsher",
                                          age: Calendar.current.date(from: DateComponents(year: 2000,
                                                                                          month: 12)),
                                          email: "TasneemJafsher@gmail.com"),
                                  Student(photo: "img_student_5",
                                          name: "Munira alahmry",
                                          age: Calendar.current.date(from: DateComponents(year: 1991,
                                                                                          month: 4)),
                                          email: "alahmryn5@gmail.com"),
                                  Student(photo: "img_student_1",
                                          name: "Kholod Sultan",
                                          age: Calendar.current.date(from: DateComponents(year: 1994,
                                                                                          month: 6)),
                                          email: "Kholod-656@hotmail.com"),
                                  Student(photo: "img_student_1",
                                          name: "Alanoodal Sultan",
                                          age: Calendar.current.date(from: DateComponents(year: 1999,
                                                                                          month: 6)),
                                          email: "Alanoodalsultan98@outlook.sa"),
                                  Student(photo: "img_student_1",
                                          name: "Amal",
                                          age: Calendar.current.date(from: DateComponents(year: 1998,
                                                                                          month: 6)),
                                          email: "amal.141726@gmail.co"),
                                  Student(photo: "img_student_1",
                                          name: "Sana Al-shahrani",
                                          age: Calendar.current.date(from: DateComponents(year: 1994,
                                                                                          month: 6)),
                                          email: "Sanaalshahrani99@gmail.com"),
                                  Student(photo: "img_student_1",
                                          name: "Marram Al-shahrani",
                                          age: Calendar.current.date(from: DateComponents(year: 1993,
                                                                                          month: 6)),
                                          email: "maarram36@gmail.com"),
                                  Student(photo: "img_student_1",
                                          name: "Miguel",
                                          age: Calendar.current.date(from: DateComponents(year: 1983,
                                                                                          month: 6)),
                                          email: "miguel@gmail.com"),
                                  Student(photo: "img_student_1",
                                          name: "Miguel",
                                          age: Calendar.current.date(from: DateComponents(year: 1983,
                                                                                          month: 6)),
                                          email: "miguel@gmail.com"),
                                  Student(photo: "img_student_1",
                                          name: "Miguel",
                                          age: Calendar.current.date(from: DateComponents(year: 1983,
                                                                                          month: 6)),
                                          email: "miguel@gmail.com"),
                                  Student(photo: "img_student_1",
                                          name: "Miguel",
                                          age: Calendar.current.date(from: DateComponents(year: 1983,
                                                                                          month: 6)),
                                          email: "miguel@gmail.com"),
                                  Student(photo: "img_student_1",
                                          name: "Miguel",
                                          age: Calendar.current.date(from: DateComponents(year: 1983,
                                                                                          month: 6)),
                                          email: "miguel@gmail.com"),
                                  Student(photo: "img_student_1",
                                          name: "Miguel",
                                          age: Calendar.current.date(from: DateComponents(year: 1983,
                                                                                          month: 6)),
                                          email: "miguel@gmail.com"),
                                  Student(photo: "img_teacher_1",
                                          name: "Lucía",
                                          age: Calendar.current.date(from: DateComponents(year: 2021,
                                                                                          month: 10)),
                                          email: "lucia@gmail.com")]


// MARK: -  Create list of Teachers

// With Calendar and DateComponents class can create a new Date
// Calendar.current return actual Calendar 'Gregorian'
var defaultTeachers: [Teacher] = [Teacher(photo: "img_teacher_3",
                                          name: "Hadi Abinsaad",
                                          age: Calendar.current.date(from: DateComponents(year: 1997,
                                                                                          month: 8)),
                                          email: "hadiabinsaad@gmail.com"),
                                  //                                  Teacher(photo: "img_teacher_2",
                                  //                                          name: "Carlos",
                                  //                                          age: Calendar.current.date(from: DateComponents(year: 1974,
                                  //                                                                                          month: 6)),
                                  //                                          email: "carlos@teacher.com"),
                                  //                                  Teacher(photo: "img_teacher_4",
                                  //                                          name: "Andrés",
                                  //                                          age: Calendar.current.date(from: DateComponents(year: 1979,
                                  //                                                                                          month: 9)),
                                  //                                          email: "andres@teacher.com"),
                                  Teacher(photo: "img_teacher_1",
                                          name: "Khadija Abuali",
                                          age: Calendar.current.date(from: DateComponents(year: 1992,
                                                                                          month: 2)),
                                          email: "star36699@gmail.com")]
//                                  Teacher(photo: "img_teacher_1",
//                                          name: "Laura",
//                                          age: Calendar.current.date(from: DateComponents(year: 1980,
//                                                                                          month: 10)),
//                                          email: "laura@teacher.com")]
//

// MARK: - Create list of Subjects
// Use a list.filter for get different values for each subject

// With Calendar and DateComponents class can create a new Date
// Calendar.current return actual Calendar 'Gregorian'
var defaultSubjects: [Subject] = [
    Subject(photo: "img_subject_ios",
            name: "iOS",
            year: Calendar.current.date(from: DateComponents(year: 2021,
                                                             month: 9)),
            teachers: defaultTeachers.filter{$0.name.contains("i") },
            students: defaultStudents.filter{$0.name.contains("a") }), ]
//                                  Subject(photo: "img_subject_javascript",
//                                          name: "JavaScript",
//                                          year: Calendar.current.date(from: DateComponents(year: 2018,
//                                                                                           month: 10)),
//                                          teachers: defaultTeachers.filter{$0.name.contains("e")  },
//                                          students: defaultStudents.filter{$0.name.contains("o") }), ]
//                                  Subject(photo: "img_subject_dart",
//                                          name: "Dart",
//                                          year: Calendar.current.date(from: DateComponents(year: 2018,
//                                                                                           month: 9)),
//                                          teachers: defaultTeachers.filter{$0.name.contains("a")},
//                                          students: defaultStudents.filter{$0.name.contains("u") })
//Subject(photo: "img_subject_android",
//                                          name: "Android",
//                                          year: Calendar.current.date(from: DateComponents(year: 2018,
//                                                                                           month: 9)),
//                                          teachers: defaultTeachers.filter{$0.name.contains("u")  },
//                                          students: defaultStudents.filter{$0.name.contains("a") }),
//                                  Subject(photo: "img_subject_ios",
//                                          name: "iOS",
//                                          year: Calendar.current.date(from: DateComponents(year: 2019,
//                                                                                           month: 3)),
//                                          teachers: defaultTeachers.filter{$0.name.contains("o") },
//                                          students: defaultStudents.filter{$0.name.contains("e") }),]
//
