////
////  ViewController.swift
////  tuwaiq 1000
////
////  Created by m.Al-qhatani on 19/04/1443 AH.
////
import UIKit



struct Item {
    let name : String
    let price1 : String
    let logo : UIImage?
    let spe : String
}

var importing : Array<Item> = []
var cart : Array<Item> = []
var purchsedPr : Array<Item> = []


var List : Array<Item> = [
    Item(
        name: "Cyber Security Twauiq ",
        price1 : "Riyadh",
        logo: UIImage(named: "1"),
        spe : "A training camp aimed at qualifying Saudi capabilities and developing their skills in various cybersecurity fields, including vulnerability assessment, penetration testing, incident response, and digital forensic investigation"
    ),
Item(
    name: "Cyber security",
    price1 : "Riyadh",
    logo: UIImage(named: "19"),
    spe : "The Cyber ​​Track gives 200 male and female trainees a unique opportunity to improve their skills and develop their capabilities in Linux server and network management, vulnerability assessment, penetration testing, incident response and digital forensics. At the end of the camp, the trainee will be qualified and able to work in one of the areas of cybersecurity The training camp consists of two phases A month-long foundation stage A specialized phase that lasts for three months and is divided into Offensive and defensive."
),
Item(
    name: "Cloud Computing",
    price1 : "Riyadh",
    logo: UIImage(named: "155"),
    spe : "Qualifying recent graduates to work and providing them with the technical and professional skills necessary to work in the field of cloud computing."
),
Item(
    name: "Game Development",
    price1 : "Jeddah",
    logo: UIImage(named: "15"),
    spe : "iOS ، Java، PHP ، Front-end ،Back-end Opcache Practice,SonarQube Application Introduction ,D3.js Introduction ,Game Robot AI Realization, RPG Game Skill Design,Introduction to Lua Garbage Collection Mechanism"

),
Item(
    name: "Java Script",
    price1 : "Hail",
    logo: UIImage(named: "11"),
    spe : "Camp enables you to design and build integrated web applications using JavaScript, React, Node for both Front-end and Back-end Technologies used: HTML, CSS, Javascript, React, NodeJS, ExpressJS, MongoDB, Mongoose, Jest The duration of the camp: 12 weeks (Sunday to Thursday - 9 am to 5 pm) and taught in English"

),
Item(
    name: "Swift",
    price1 : "Abha",
    logo: UIImage(named: "111"),
    
    spe : "Swift Camp enables you to build iOS apps and the ability to develop and publish mobile apps on the Apple App Store,Technologies used: Swift, Swift UI, Firebase,The duration of the camp: 12 weeks (Sunday to Thursday - 9 am to 5 pm) and taught in English"
),
Item(
    name: "C#",
    price1 : "Medina",
    logo: UIImage(named: "1111"),
    spe : "Camp enables you to design and build integrated web applications using #C"

),
Item(
    name: "Kotlin",
    price1 : "Tabuk",
    logo: UIImage(named: "11111"),
    spe : "Intensive Kotlin Boot Camp enables you to build and publish mobile apps on the Android App Store,Technologies used: Kotlin, SQLite, Room, JUnit, Mockito,The duration of the camp: 12 weeks (Sunday to Thursday - 9 am to 5 pm) and taught in English"

),
    Item(
        name: "Puthon",
        price1 : "Dammam",
        logo: UIImage(named: "16"),
        spe : "This 12-week intensive Python course is a unique experience that provides you with in-depth experience building and testing web applications"

    ),
    Item(
        name: "Java",
        price1 : "Najran",
        logo: UIImage(named: "1111111"),
        spe : "Camp enables you to design and build integrated web applications using Java"

    ),


]


