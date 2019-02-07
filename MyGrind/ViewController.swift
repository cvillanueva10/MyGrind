//
//  ViewController.swift
//  MyGrind
//
//  Created by Christopher Villanueva on 2/5/19.
//  Copyright © 2019 Christopher Villanueva. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var circle: SessionTimerView!

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .darkMode
        circle = SessionTimerView(centerPoint: view.center,
                                           radius: 100,
                                           lineWidth: 10,
                                           turnsClockwise: true)
        view.addSubview(circle)
        let tapGestureRecognizer = UITapGestureRecognizer(target: self,
                                                          action: #selector(handleDidTapTimerButton))
        view.addGestureRecognizer(tapGestureRecognizer)
    }

    @objc func handleDidTapTimerButton() {
        circle?.switchTimerToOn()
    }


}


