//  tuwaiq 1000
//
//  Created by M.Al-qhtani.
//


import Foundation




// MARK: -  Create list of Students

// With Calendar and DateComponents class can create a new Date
// Calendar.current return actual Calendar 'Gregorian'
let defaultStudents: [Student] = [Student(photo: "me",
                                          name:  "Mohammed Al-Bahal",
                                          age: Calendar.current.date(from: DateComponents(year: 1997,
                                                                                          month: 5)),
                                          email: "m.albahl.q@gmail.com"),
                                  Student(photo: "tt",
                                          name: "Fawaz Mohammed",
                                          age: Calendar.current.date(from: DateComponents(year: 1995,
                                                                                          month: 5)),
                                          email: "fawazmm79@gmail.com"),
                                  Student(photo: "ww",
                                          name: "Ibrhaem Ahmed",
                                          age: Calendar.current.date(from: DateComponents(year: 1993,
                                                                                          month: 5)),
                                          email: "Ibrhaem@gmail.com"),
                                  Student(photo: "ee",
                                          name: "Abdulaziz Alshehri",
                                          age: Calendar.current.date(from: DateComponents(year: 2000,
                                                                                          month: 5)),
                                          email: "Abdulaziz@gmail.com"),
                                  Student(photo: "rr",
                                          name: "Ahmed Assiri",
                                          age: Calendar.current.date(from: DateComponents(year: 1995,
                                                                                          month: 5)),
                                          email: "Ahmed.707@gmail.com"),
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
                                  Student(photo: "img_student_4",
                                          name: "Alanoodal Sultan",
                                          age: Calendar.current.date(from: DateComponents(year: 1999,
                                                                                          month: 6)),
                                          email: "Alanoodalsultan98@outlook.sa"),
                                  Student(photo: "img_student_1",
                                          name: "Amal",
                                          age: Calendar.current.date(from: DateComponents(year: 1998,
                                                                                          month: 6)),
                                          email: "amal.141726@gmail.co"),
                                  Student(photo: "img_student_5",
                                          name: "Sana Al-shahrani",
                                          age: Calendar.current.date(from: DateComponents(year: 1994,
                                                                                          month: 6)),
                                          email: "Sanaalshahrani99@gmail.com"),
                                  Student(photo: "img_student_4",
                                          name: "Marram Al-shahrani",
                                          age: Calendar.current.date(from: DateComponents(year: 1993,
                                                                                          month: 6)),
                                          email: "maarram36@gmail.com"),
                                  Student(photo: "img_student_1",
                                          name: "Atheer",
                                          age: Calendar.current.date(from: DateComponents(year: 1995,
                                                                                          month: 6)),
                                          email: "Atheer@gmail.com"),
                                  Student(photo: "img_teacher_1",
                                          name: "Sara",
                                          age: Calendar.current.date(from: DateComponents(year: 1996,
                                                                                          month: 6)),
                                          email: "Sara@gmail.com"),
                                  Student(photo: "img_student_4",
                                          name: "Hanan",
                                          age: Calendar.current.date(from: DateComponents(year: 1995,
                                                                                          month: 6)),
                                          email: "Hanan@gmail.com"),
                                  Student(photo: "img_student_5",
                                          name: "Amel",
                                          age: Calendar.current.date(from: DateComponents(year: 1998,
                                                                                          month: 6)),
                                          email: "Amel@gmail.com"),
                                  Student(photo: "img_student_1",
                                          name: "Afnan",
                                          age: Calendar.current.date(from: DateComponents(year: 1998,
                                                                                          month: 6)),
                                          email: "Afnan@gmail.com"),
                                  Student(photo: "img_student_4",
                                          name: "Dema",
                                          age: Calendar.current.date(from: DateComponents(year: 1999,
                                                                                          month: 6)),
                                          email: "Dema@gmail.com"),
                                  Student(photo: "img_teacher_1",
                                          name: "Sara M",
                                          age: Calendar.current.date(from: DateComponents(year: 2021,
                                                                                          month: 10)),
                                          email: "Sara.m@gmail.com")]


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
            students: defaultStudents.filter{$0.name.contains("a") }
           ),
]
