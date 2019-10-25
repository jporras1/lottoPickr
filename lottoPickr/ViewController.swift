//
//  ViewController.swift
//  lottoPickr
//
//  Created by Javier Porras jr on 10/23/19.
//  Copyright © 2019 Javier Porras jr. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    //MARK: Properties
    let padding: CGFloat = 30
    
    // five different numbers from 1 to 70 (the white balls) and one number from 1 to 25
    let label1 = labelFor(text: "0")
    let label2 = labelFor(text: "0")
    let label3 = labelFor(text: "0")
    let label4 = labelFor(text: "0")
    let label5 = labelFor(text: "0")
    let label6 = labelFor(text: "0")
    let button: UIButton = {
        let button = UIButton()
        button.setTitle("Get Random Numbers", for: .normal)
        //button.backgroundColor = .red
        button.translatesAutoresizingMaskIntoConstraints = false
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 24)
        button.addTarget(self, action: #selector(getRandomNumbers), for: .touchUpInside)
        return button
    }()
    
    //MARK: Init
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .gray
        setupViews()    }

    //MARK: Handlers
    static func labelFor(text: String) -> UILabel {
        let label = UILabel()
        label.text = text
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.font = UIFont.boldSystemFont(ofSize: 14)
        label.backgroundColor = .white
        return label
    }
    func setupViews(){
        view.addSubviews(label1, label2, label3, label4, label5, label6, button)
        
        addXConstraintWith(padding, label1, label2, label3, label4, label5, label6)
        label1.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -80).isActive = true
        addTopAnchorRelative(to: label1, for: label2, label3, label4, label5, label6)
        addWidthConstraintWith(constant: 35, label1, label2, label3, label4, label5, label6)
        addHeightConstraintWith(constant: 35, label1, label2, label3, label4, label5, label6)
        
        button.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        button.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: 150).isActive = true
        button.widthAnchor.constraint(equalToConstant: 300).isActive = true
        button.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        label6.backgroundColor = .lightGray
    }
    func addXConstraintWith(_ Padding: CGFloat, _ views: UIView...){
        var paddingFunc = Padding
        let middle: Int = views.count/2
        let last: Int = views.count
        
        for i in (0..<middle).reversed() {
            paddingFunc = -1 * Padding
            if (i == middle){
                paddingFunc = paddingFunc / 2
                views[i].rightAnchor.constraint(equalTo: view.centerXAnchor, constant: paddingFunc).isActive = true
            }else{
                views[i].rightAnchor.constraint(equalTo: views[i+1].leftAnchor, constant: paddingFunc).isActive = true
            }
        }
        for i in (middle..<last) {
            paddingFunc = Padding
            if (i == middle){
                paddingFunc = paddingFunc / 2
                views[i].leftAnchor.constraint(equalTo: view.centerXAnchor, constant: paddingFunc).isActive = true
            }else{
                views[i].leftAnchor.constraint(equalTo: views[i-1].rightAnchor, constant: paddingFunc).isActive = true
            }
        }
    }
    
    func addWidthConstraintWith(constant: CGFloat, _ views: UIView...){
        views.forEach{
            $0.widthAnchor.constraint(equalToConstant: constant).isActive = true
        }
    }
    func addHeightConstraintWith(constant: CGFloat, _ views: UIView...){
        views.forEach{
            $0.heightAnchor.constraint(equalToConstant: constant).isActive = true
        }
    }
    func addTopAnchorRelative(to view: UIView, for views: UIView...){
        views.forEach{
            $0.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        }
    }
    @objc func getRandomNumbers(){
        var whiteBalls = [Int]()
        var goldBalls = [Int]()
        for i in 1...70{
            whiteBalls.append(i)
        }
        for i in 1...25{
            goldBalls.append(i)
        }
        
        for label in [label1, label2, label3, label4, label5]{
        //for i in (0..<5).reversed(){
            let randNumb = Int.random(in: 0..<whiteBalls.count)
            let numb = whiteBalls[randNumb]
            label.text = "\(numb)"
            whiteBalls.remove(at: randNumb)
        }
        
        let randNumb = Int.random(in: 0..<goldBalls.count)
        let numb = goldBalls[randNumb]
        goldBalls.remove(at: randNumb)
        label6.text = "\(numb)"
    }
}

extension UIView{
    func addSubviews(_ views: UIView...){
        views.forEach{
            self.addSubview($0)
        }
    }
}
