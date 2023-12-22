//
//  main.swift
//  Swift_ProtocolPractice
//
//  Created by 강창현 on 12/22/23.
//

import Foundation

struct Puppy {
    let name: String
}

// 프로토콜이란 무엇인가? 구현 요구사항의 청사진, 기능의 청사진, 설계도, 기능의 요구사항 명세
// 개라면 할 수 있는 것(해야하는 것) / 지구상의 개라면 응당 해야하는 것
// 우리가 알고 있는 생명체의 개라면 무조건 이러이러한 기능을 가지고 있어야한다.
protocol Dog {
    var name: String { get }
    var color: String { get }
    var weight: Double { get }
    
    func bark()
    func eat(_ something: String)
    func move(to: String)
    func giveBirth() -> Puppy
}

/*
 채택: 타입에 명찰을 달아주는 것. 개라면 이런이런 역할을 하기 위해 구현해줘야한다(준수).
 준수: 프로토콜이 요구했던 사항들을 구현해야하는 것
 요구? : 개라면 응당해야하는 것
*/

struct Bichon: Dog, Ownerable {
    func own(to: String) {
        //
    }
    
    var name: String = "엘"
    var color: String = "흰색"
    var weight: Double = 3.5
    
    func bark() {
        print("멍멍")
    }
    
    func eat(_ something: String) {
        print("아 배고파" + something + "냠냠 굿~")
    }
    
    func move(to: String) {
        print("\(to)로 가자")
    }
    
    func giveBirth() -> Puppy {
        return Puppy(name: "뽀삐")
    }
}

struct Husky: Dog, Ownerable {
    func own(to: String) {
        //
    }
    

    var name: String = "해피"
    var color: String = "흰검"
    var weight: Double = 18
    
    func bark() {
        print("망망")
    }
    
    func eat(_ something: String) {
        print("아 배고파" + something + "냠냠 굿~")
    }
    
    func move(to: String) {
        print("\(to)로 가자")
    }
    
    func giveBirth() -> Puppy {
        return Puppy(name: "찰스")
    }
}

protocol Ownerable {
    func own(to: String)
}

struct Person: Ownerable {
    func own(to: String) {
        //
    }
    
    var name: String
    var age: Int
    
    func feed(to: Dog) {
        print("\(to)야 맛있게 먹어~")
    }
    
    func givingName(of dog: Dog) {
        let pup = dog.giveBirth()
        print("\(name)가 \(pup)의 이름을 지어줬습니다.")
    }
    
    func takeAWalk(with: Dog) {
        print("\(name)이 \(with.name)이랑 산책합니다.")
    }
}

var bichon = Bichon()

// MARK: - 활동학습
/*
 Protocol 구현하기
 Step 1 : 내가 사장이라면, 내 비서는 이런일을 해줬으면 좋겠다 상상하기
 Step 2 : 상상한 것을 프로토콜로 표현해보기
 Step 3 : 비서 프로토콜을 따르는 타입 3개 만들어보기
 Step 4 : 사장 타입 만들어보기
*/
@objc
protocol Assistant {
    var name: String { get }
    func alertDailyReport()
    func alertTIL()
    @objc optional func leave()
}

extension Assistant {
    func alertDailyReport() {
        print("\(name): 야호! 벌써 5시에요! 일일회고 작성해주세요!")
    }
    
    func alertTIL() {
        print("\(name): 야호! 벌써 5시에요! TIL 작성해주세요!")
    }
}

class MecaDio: Assistant {
    var name: String = "디오봇"
}

class MecaTaco: Assistant {
    var name: String = "타코봇"
}

class MecaJamking: Assistant {
    var name: String = "잼킹봇"
}

class Boss {
    var name: String
    
    init(name: String) {
        self.name = name
    }
    
    func hire(assistant: Assistant) {
        print("\(name)(이)가 \(assistant.name) 채용!")
    }
    func makeWork(to assistant: Assistant) {
        assistant.alertDailyReport()
        assistant.alertTIL()
    }
}

let dioBot: Assistant = MecaDio()
let dio = Boss(name: "디오")
dio.hire(assistant: dioBot)
dio.makeWork(to: dioBot)

let jamkingBot: Assistant = MecaJamking()
let jamking = Boss(name: "잼킹")
jamking.hire(assistant: jamkingBot)
jamking.makeWork(to: jamkingBot)

let tacoBot: Assistant = MecaTaco()
let tacoCat = Boss(name: "타코캣")
tacoCat.hire(assistant: tacoBot)
tacoCat.hire(assistant: dioBot)
tacoCat.makeWork(to: tacoBot)
tacoCat.makeWork(to: dioBot)
