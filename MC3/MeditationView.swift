//
//  MeditationView.swift
//  MC3
//
//  Created by khadija Ait ElFqih on 19/02/24.
//
import SwiftUI
import UIKit

extension UIColor {
    static var brightRed: UIColor {
        return UIColor(red: 1.0, green: 0.0, blue: 0.0, alpha: 1.0)
    }

    static var darkRed: UIColor {
        return UIColor(red: 0.0, green: 50.0, blue: 0.0, alpha: 1.0)
    }
}

class ViewController: UIViewController {

    let circleView = UIView()

    override func viewDidLoad() {
        super.viewDidLoad()

        setupCircle()
        animateColorChange()
    }

    func setupCircle() {
        circleView.frame = CGRect(x: 100, y: 100, width: 100, height: 100)
        circleView.layer.cornerRadius = 50 // Make it a circle
        circleView.backgroundColor = .red // Use custom extension
        view.addSubview(circleView)
    }

    func animateColorChange() {
    
        UIView.animate(withDuration: 10.0, animations: {
            self.circleView.backgroundColor = .darkRed // Use custom extension
        }) { _ in
            UIView.animate(withDuration: 2.0) {
                self.circleView.backgroundColor = .brightRed // Use custom extension
            }
            
        }
    }

        }
    


struct MeditationView: View {
    var body: some View {
        ExerciseView(color: .red)
    }
}

// Preview code is omitted for brevity
