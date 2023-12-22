//
//  main.swift
//  Swift_ProtocolPractice
//
//  Created by 강창현 on 12/22/23.
//

import Foundation

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
}
