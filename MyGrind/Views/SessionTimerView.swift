//
//  SessionTimerView.swift
//  MyGrind
//
//  Created by Christopher Villanueva on 2/6/19.
//  Copyright © 2019 Christopher Villanueva. All rights reserved.
//

import UIKit

protocol SessionTimerViewDelegate: class {
    func turnTimerToOn(_ sessionTimerView: SessionTimerView)
    func pauseTimer(_ sessionTimerView: SessionTimerView)
    func resetTimer(_ sessionTimerView: SessionTimerView)
}

class SessionTimerView: UIView {

    let circleAnimatedLayer = CAShapeLayer()
    let circleTrackLayer = CAShapeLayer()
    var radius: CGFloat
    var lineWidth: CGFloat
    var turnsClockwise: Bool
    var centerPoint: CGPoint
    var timerStatus: TimerStatus

    weak var delegate: SessionTimerViewDelegate?

    init(centerPoint: CGPoint, radius: CGFloat, lineWidth: CGFloat, turnsClockwise: Bool ) {
        self.radius = radius
        self.turnsClockwise = turnsClockwise
        self.lineWidth = lineWidth
        self.centerPoint = centerPoint
        self.timerStatus = .off
//        super.init(frame: CGRect(x: centerPoint.x,
//                                 y: centerPoint.y,
//                                 width: radius,
//                                 height: radius)
//        )
        super.init(frame: .zero)
        drawCircle()
    }
    

    func drawCircle() {
        self.translatesAutoresizingMaskIntoConstraints = false
        let circularPath = UIBezierPath(arcCenter: centerPoint,
                                        radius: radius,
                                        startAngle: -CGFloat.pi / 2,
                                        endAngle: 2 * CGFloat.pi,
                                        clockwise: turnsClockwise)
        circleTrackLayer.path = circularPath.cgPath
        circleTrackLayer.strokeColor = UIColor.darkModeLite.cgColor
        circleTrackLayer.fillColor = UIColor.clear.cgColor
        circleTrackLayer.lineWidth = lineWidth
        layer.addSublayer(circleTrackLayer)
        circleAnimatedLayer.lineWidth = lineWidth
        circleAnimatedLayer.strokeColor = UIColor.red.cgColor
        circleAnimatedLayer.path = circularPath.cgPath
        circleAnimatedLayer.lineCap = .round
        circleAnimatedLayer.fillColor = UIColor.clear.cgColor
        circleAnimatedLayer.strokeEnd = 0
        layer.addSublayer(circleAnimatedLayer)
    }

    func switchTimerToOn() {
        self.timerStatus = .running
        let basicAnimation = CABasicAnimation(keyPath: "strokeEnd")
        basicAnimation.toValue = 1
        basicAnimation.duration = 5 * 60
        basicAnimation.fillMode = .forwards
        basicAnimation.isRemovedOnCompletion = false
        circleAnimatedLayer.add(basicAnimation, forKey: "timerAnimation")
    }




    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

