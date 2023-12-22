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


