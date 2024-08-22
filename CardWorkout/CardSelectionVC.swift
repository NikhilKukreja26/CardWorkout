//
//  CardSelectionVC.swift
//  CardWorkout
//
//  Created by Nikhil Kukreja on 21/08/24.
//

import UIKit

class CardSelectionVC: UIViewController {
    
//    Outlet is used for accessing object and manipulate the properties from code.
    
//    Action is used to perform some action.

    @IBOutlet var cardImageView: UIImageView!;
    
    @IBOutlet var buttons: [UIButton]!;
    
    var timer: Timer!;
    
    var cards: [UIImage] = Deck.allValues;
    
    
    override func viewDidLoad() {
        super.viewDidLoad();
        
        startTimer();
        
        for button in buttons {
            button.layer.cornerRadius = 8;
        }
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated);
        timer.invalidate();
    }
    
    func startTimer() {
        timer = Timer.scheduledTimer(timeInterval: 0.2, target: self, selector: #selector(showRandomImage), userInfo: nil, repeats: true);
    }
    
    @objc func showRandomImage() {
        cardImageView.image = cards.randomElement() ?? UIImage(named: "AS");
        
    }
    
    
    @IBAction func stopButtonTapped(_ sender: UIButton) {
        timer.invalidate();
    }
    

    @IBAction func restartButtonTapped(_ sender: UIButton) {
        timer.invalidate();
        startTimer();
    }
    
}
