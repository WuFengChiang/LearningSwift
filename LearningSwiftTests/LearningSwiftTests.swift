//
//  LearningSwiftTests.swift
//  LearningSwiftTests
//
//  Created by wuufone on 2019/6/17.
//  Copyright © 2019 江武峯. All rights reserved.
//

import XCTest
@testable import LearningSwift

class LearningSwiftTests: XCTestCase {

    override func setUp() { }
    override func tearDown() { }

    func testIntExpression() {
        XCTAssertEqual(10000000, 1000_0000)
        XCTAssertEqual(10000000, 1.0e7)
        XCTAssertEqual(16, 0b10000)
        XCTAssertEqual(16, 0o20)
        XCTAssertEqual(16, 0x10)
        XCTAssertEqual(16, 0x1p4)
    }
    
    func testTypeInference() {
        let integer1 = 7
        let integer2: Int = 8
        XCTAssertTrue(type(of: integer1) == type(of: integer2))
        
        let float1 = 1.0
        let float2: Float = 1.0
        let float3: Double = 1.0
        XCTAssertFalse(type(of: float1) == type(of: float2))
        XCTAssertTrue(type(of: float1) == type(of: float3))
    }
    
    func testMaxInt() {
        XCTAssertEqual(9223372036854775807, Int.max)
    }
    
    func testIfElse() {
        let score = 55
        func functionWithIfElse() -> String {
            if score < 40 {
                return "死當"
            } else if score >= 40, score < 60 {
                return "活當"
            } else {
                return "pass"
            }
        }
        XCTAssertEqual(functionWithIfElse(), "活當")
    }
    
    func testSwitch() {
        let score = 55
        func functionWithSwitch() -> String {
            switch score {
            case 0...39:
                return "死當"
            case 40...59:
                return "活當"
            default:
                return "pass"
            }
        }
        XCTAssertEqual(functionWithSwitch(), "活當")
    }
    
    func testArrayRevese() {
        let avengers = ["Iron man",
                        "American captain",
                        "Thor"]
        let reversedAvengers = ["Thor",
                                "American captain",
                                "Iron man"]
        let disorderAvengers = ["American captain",
                                "Thor",
                                "Iron man"]
        XCTAssertEqual(avengers.reversed(), reversedAvengers)
        XCTAssertTrue(avengers.reversed() != disorderAvengers)
    }
    
    func testFaceClass() {
        class Face {
            var leftEye: Eye!
            var rightEye: Eye!
            private var isClosedEye = true
            
            func closeEyes() {
                isClosedEye = false
            }
            func isCloseEye() -> Bool {
                return isClosedEye
            }
        }
        class Eye {}
        
        let face = Face()
        XCTAssertEqual(face.isCloseEye(), true)
        face.closeEyes()
        XCTAssertEqual(face.isCloseEye(), false)
    }
    
    func testIsA() {
        class Phone {
            var ownNumber: String!
            private var rj11Connector: Any!
            func call(number: String) -> String {
                return "call \(number)"
            }
        }
        class iPhone: Phone {
            func surfing() {}
        }
        
        let myiPhone = iPhone()
        myiPhone.ownNumber = "0999999999"
        
        /* 'rj11Connector' is inaccessible due to 'private' protection level*/
        //myiPhone.rj11Connector
        
        XCTAssertEqual("call 28825252", myiPhone.call(number: "28825252"))
    }
    
    func testHasA() {
        
        let myiPhone = iPhone()
        XCTAssertEqual("call 28825252", myiPhone.call(number: "28825252"))

        class Phone {
            func call(number: String) -> String {
                return "call \(number)"
            }
        }
        class iPhone {
            let phone = Phone()
            func surfing() {}
            func call(number: String) -> String {
                return phone.call(number: number)
            }
        }
    }
    
    func testProtocol() {
        
        let man = Man()
        
        let iPhone = IPhone()
        man.deviceForSurfing = iPhone
        man.surfing()
        
        class Man {
            var deviceForSurfing: InternetAccessible!
            func surfing() {
                deviceForSurfing.surfing()
            }
        }
        class IPhone: InternetAccessible {
            func surfing() {
                print("用 iPhone 上網")
            }
        }
        class MBP: InternetAccessible {
            func surfing() {
                print("用 MBP 上網")
            }
        }
    }
    
    func testDelegate() {
        
        let burgerStand = BurgerStand()
        burgerStand.sellBurger()
        
        class BurgerStand: BurgerMakerDelegate {
            let burgerMaker = BurgerMaker()
            
            func sellBurger() {
                burgerMaker.delegate = self
                burgerMaker.make()
            }
            
            // MARK: - BurgerMakerDelegate functions
            func spread() {
                print("健康取向：一點點醬")
            }
            func addPickled() {
                print("日本鄉土極品醃黃瓜")
            }
            func addPatty() {
                print("安格斯黑毛牛肉")
            }
        }
        
        class BurgerMaker {
            public var delegate: BurgerMakerDelegate!
            private func heat() { print("單純地加熱1分鐘") }
            private func spread() { delegate.spread() }
            private func addPickled() { delegate.addPickled() }
            private func addPatty() { delegate.addPatty() }
            private func addLettuce() { print("單純地鋪上美生菜") }
            public func make() {
                heat()
                spread()
                addPickled()
                addPatty()
                addLettuce()
            }
        }
    }
    
    func testLet() {
        class Face {
            var length: Int!
        }
        let aFace = Face()
        aFace.length = 10
        aFace.length = 15 // aFace 不可變，但是 length 可變哦
        XCTAssertTrue(aFace.length == 15)
    }
    
    func testInitializer() {
        class Account {
            var email: String
            var password: String
            
            init(email _email: String, password _password: String = "0000") {
                self.email = _email
                self.password = _password
            }
        }
        let aNewAccount = Account(email: "my@email.com",
                                  password: "xO8P9zBB")
        XCTAssertEqual("my@email.com", aNewAccount.email)

        let anotherAccount = Account(email: "my2@email.com")
        XCTAssertEqual("0000", anotherAccount.password)
    }
    
    func testOverride() {
        class Super {
            func method1() -> String {
                return "Super"
            }
        }
        class Sub: Super {
            override func method1() -> String {
                return super.method1()
            }
        }
        XCTAssertEqual("Super", Sub().method1())
    }
    
    func testOverload() {
        class Member {
            init(withEmail: String){}
            init(phoneNumber: String) {}
        }
        let aMember = Member(withEmail: "my@email.com")
        let anotherMember = Member(phoneNumber: "0930000000")
        XCTAssertNotNil(aMember)
        XCTAssertNotNil(anotherMember)
    }
    
    func testStoredProperty() {
        class Member {
            let name: String
            let email: String!
            let password: String?
            let registerTime = Date()
            init(name: String, email:String) {
                self.name = name
                self.email = email
                self.password = nil
            }
        }
        let aMember = Member(name: "me", email: "me@icloud.com")
        XCTAssertNil(aMember.password)
    }
    
    func testComputedProperty() {
        class Circle {
            var radius: Float
            var area: Float {
                return radius * radius * 3.14
            }
            init(radius: Float) {
                self.radius = radius
            }
        }
        XCTAssertEqual(Circle(radius: 10).area, 314)
    }
    
    func testComplexComputedProperty() {
        class Circle {
            var radius: Float!
            var area: Float {
                get {
                    return radius * radius * 3.14
                }
                set {
                    radius = sqrt(newValue / 3.14) as Float
                }
            }
        }
        let aCircle = Circle()
        aCircle.area = 314
        XCTAssertEqual(aCircle.radius, 10)
    }
    
    func testPropertyObservers() {
        class 恒溫器 {
            var log: String!
            var temperature: Float = 27 {
                willSet(感測到的新溫度) {
                    log = """
                    原來的溫度為：\(temperature)
                    感測到新的溫度為：\(感測到的新溫度)
                    """
                }
                didSet {
                    if temperature > oldValue {
                        log = """
                        \(log!)
                        天氣又變熱了呢!
                        """
                    }
                }
            }
        }
        let 一個恒溫器  = 恒溫器()
        一個恒溫器.temperature = 35.7
        
        XCTAssertEqual(一個恒溫器.log!,
                       """
                       原來的溫度為：27.0
                       感測到新的溫度為：35.7
                       天氣又變熱了呢!
                       """)
    }
    
    func testComplexPropertyWithClosure() {
        class MyUI {
            var passwordTextField: UITextField = {
                let result = UITextField()
                result.isSecureTextEntry = true
                result.keyboardType = .numberPad
                return result
            }()
        }
        XCTAssertTrue(MyUI().passwordTextField.isSecureTextEntry)
    }
    
    func testCompareToPropertyWithClosure() {
        class MyUI {
            var passwordTextField: UITextField {
                let result = UITextField()
                result.isSecureTextEntry = true
                result.keyboardType = .numberPad
                return result
            }
        }
        XCTAssertTrue(MyUI().passwordTextField.isSecureTextEntry)
    }
    
    func testLazyLoading() {
        class ComplexARComponent {}
        class MyApp {
            var log: String?
            lazy var component: ComplexARComponent = {
                log = "component was created."
                return ComplexARComponent()
            }()
        }
        let app = MyApp()
        XCTAssertNil(app.log)
        let _ = app.component
        XCTAssertEqual(app.log!, "component was created.")
    }
    
    func testClosureExpression() {
        class MyUI {
            let closureForPasswordTextField: () -> UITextField = {
                () -> UITextField in
                let result = UITextField()
                result.isSecureTextEntry = true
                result.keyboardType = .numberPad
                return result
            }
            var passwordTextField: UITextField
            init() {
                passwordTextField = closureForPasswordTextField()
            }
        }
        XCTAssertTrue(MyUI().passwordTextField.isSecureTextEntry)
    }
    
    func testSimpleClosure() {
        let aClosure: (String) -> String = { (name) in
            return "Hello, \(name)"
        }
        XCTAssertEqual("Hello, Tony", aClosure("Tony"))
    }
    
    func testClosureAsFunctionParameter() {
        func doesPass(score: Int) -> Bool {
            if score >= 60 {
                return true
            }
            return false
        }
        XCTAssertFalse(doesPass(score: 59))
        
        func doesPassVersion2(score: Int) -> Bool {
            if teacherzMagic(score) >= 60 {
                return true
            }
            return false
        }
        func teacherzMagic(_ score: Int) -> Int {
            return Int(sqrt(Double(score)) * 10.0)
        }
        XCTAssertTrue(doesPassVersion2(score: 36))
        
        func doesPassVersion3(score: Int, algorithm: (Int)->Int) -> Bool {
            if algorithm(score) >= 60 {
                return true
            }
            return false
        }
        XCTAssertTrue(doesPassVersion3(score: 36, algorithm: { (rawScore) -> Int in
            return Int(sqrt(Double(rawScore)) * 10.0)
        }))
    }
}

protocol BurgerMakerDelegate {
    func spread()
    func addPickled()
    func addPatty()
}

protocol InternetAccessible {
    func surfing()
}
