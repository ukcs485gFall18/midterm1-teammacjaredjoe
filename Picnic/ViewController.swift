import AVFoundation
import UIKit

public class ViewController: UIViewController {
    
    // MARK: These outlets were added during the tutorial.
    
    @IBOutlet public weak var bug: UIImageView!
    
    @IBOutlet public weak var basketTop: UIImageView!
    
    @IBOutlet public weak var basketBottom: UIImageView!
    
    @IBOutlet public weak var fabricTop: UIImageView!
    
    @IBOutlet public weak var fabricBottom: UIImageView!
    
    @IBOutlet public weak var basketTopConstraint: NSLayoutConstraint!
    
    @IBOutlet public weak var basketBottomConstraint: NSLayoutConstraint!
    
    // MARK: These outlets were added by Mac McNerney and Jared Payne respectively.
    
    @IBOutlet public weak var macsButton: UIButton!
    
    @IBOutlet public weak var jaredsButton: UIButton!
    
    // MARK: These instance variables were added during the tutorial.
    
    private var bugIsDead: Bool = false
    
    private var audioPlayer: AVAudioPlayer!
    
    public override func viewDidLoad() {
        // This code block was added during the tutorial.
        let url = Bundle.main.url(forResource: "squish", withExtension: "caf")!
        self.audioPlayer = try! AVAudioPlayer(contentsOf: url)
        self.audioPlayer.prepareToPlay()
        
        // This code block was added by Joe Clements.
        let upSwipeGestureRecognizer = UISwipeGestureRecognizer(target: self, action: #selector(self.handleSwipes))
        self.view.addGestureRecognizer(upSwipeGestureRecognizer)
        upSwipeGestureRecognizer.direction = .up
        let downSwipeGestureRecognizer = UISwipeGestureRecognizer(target: self, action: #selector(self.handleSwipes))
        self.view.addGestureRecognizer(downSwipeGestureRecognizer)
        downSwipeGestureRecognizer.direction = .down
        
        // This code block was added by Jared Payne.
        self.bug.image = UIImage(named: "bug")!.withRenderingMode(.alwaysTemplate)
        self.bug.tintColor = UIColor.black
    }
    
    // MARK: These methods were added during the tutorial.
    
    public override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard !self.bugIsDead else { return }
        if touches.contains(where: { self.bug.frame.contains($0.location(in: super.view)) }) {
            self.audioPlayer.play()
            self.bugIsDead = true
            self.squishBug()
        }
    }
    
    private func squishBug() {
        UIView.animate(withDuration: 0.7, delay: 0.0, options: .curveEaseOut, animations: {
            self.bug.transform = CGAffineTransform(scaleX: 1.25, y: 0.75)
        }, completion: { didFinish in
            self.fadeBug()
        })
    }
    
    private func fadeBug() {
        UIView.animate(withDuration: 2.0, delay: 0.0, options: [], animations: {
            self.bug.alpha = 0.0
        }, completion: { didFinish in
            self.bug.removeFromSuperview()
        })
    }
    
    // MARK: This method was added by Joe Clements.

    @objc private func handleSwipes(sender: UISwipeGestureRecognizer) {
        switch sender.direction {
        case .up:
            UIView.animate(withDuration: 1.0, delay: 0.0, options: .transitionFlipFromBottom, animations: {
                self.basketTop.frame.origin.y -= self.basketTop.frame.size.height
                self.fabricTop.frame.origin.y -= self.fabricTop.frame.size.height
                self.macsButton.isHidden = false
                self.macsButton.alpha = 1.0
                self.bug.isHidden = false
            })
        case .down:
            UIView.animate(withDuration: 1.0, delay: 0.0, options: .transitionFlipFromTop, animations: {
                self.basketBottom.frame.origin.y += self.basketBottom.frame.size.height
                self.fabricBottom.frame.origin.y += self.fabricBottom.frame.size.height
                self.jaredsButton.isHidden = false
                self.jaredsButton.alpha = 1.0
            })
        default:
            break
        }
    }
    
    // MARK: These methods were added by Mac McNerney.
    
    @IBAction public func macsButtonTapped(_sender: UIButton) {
        guard !self.macsButton.isSelected else { return }
        self.macsButton.isSelected = true
        self.moveBugToMacsButton1()
    }
    
    private func moveBugToMacsButton1() {
        UIView.animate(withDuration: 1.0, delay: 0.0, options: .curveEaseInOut, animations: {
            self.bug.center = CGPoint(x: 75, y: 200)
        }, completion: { _ in
            self.moveBugToMacsButton2()
        })
    }
    
    private func moveBugToMacsButton2() {
        UIView.animate(withDuration: 1.0, delay: 0.0, options: .curveEaseInOut, animations: {
            self.bug.transform = CGAffineTransform(rotationAngle: 700.0)
        }, completion: { _ in
            self.moveBugToMacsButton3()
        })
    }
    
    private func moveBugToMacsButton3() {
        UIView.animate(withDuration: 1.0, delay: 0.0, options: .curveEaseInOut, animations: {
            self.bug.center = CGPoint(x: self.view.frame.width - 75, y: 150)
        }, completion: { _ in
            self.moveBugToMacsButton4()
        })
    }
    
    private func moveBugToMacsButton4() {
        UIView.animate(withDuration: 1.0, delay: 0.0, options: .curveEaseInOut, animations: {
            self.bug.transform = CGAffineTransform(rotationAngle: -75.0)
        }, completion: { _ in
            self.moveBugToMacsButton5()
        })
    }
    
    private func moveBugToMacsButton5() {
        UIView.animate(withDuration: 1.0, delay: 0.0, options: .curveEaseInOut, animations: {
            self.bug.center = CGPoint(x: self.view.frame.width - 175, y: 75)
        }, completion: { _ in
            self.moveBugToMacsButton6()
        })
    }
    
    private func moveBugToMacsButton6() {
        UIView.animate(withDuration: 1.0, delay: 0.0, options: .curveEaseInOut, animations: {
            self.bug.transform = CGAffineTransform(rotationAngle: 450.0)
        }, completion: { _ in
            self.moveBugBackHome1()
        })
    }
    
    private func moveBugBackHome1() {
        UIView.animate(withDuration: 1.0, delay: 0.0, options: .curveEaseInOut, animations: {
            self.bug.center = CGPoint(x: self.view.frame.width - 75, y: 250)
        }, completion: { _ in
            self.moveBugBackHome2()
        })
    }
    
    private func moveBugBackHome2() {
        UIView.animate(withDuration: 1.0, delay: 0.0, options: .curveEaseInOut, animations: {
            self.bug.transform = CGAffineTransform(rotationAngle: 0.0)
        }, completion: { _ in
            self.macsButton.isSelected = false
        })
    }
    
    // MARK: These methods were added by Jared Payne.
    
    @IBAction public func jaredsButtonTapped(_ sender: UIButton) {
        self.jaredsButton.isSelected = !self.jaredsButton.isSelected
        self.tintBugRed()
    }
    
    private func tintBugRed() {
        UIView.animate(withDuration: 1.0, delay: 0.0, options: .curveEaseInOut, animations: {
            self.bug.tintColor = UIColor.red
        }, completion: { _ in
            self.jaredsButton.isSelected ? self.tintBugBlue() : self.tintBugBlack()
        })
    }
    
    private func tintBugBlue() {
        UIView.animate(withDuration: 1.0, delay: 0.0, options: .curveEaseInOut, animations: {
            self.bug.tintColor = UIColor.blue
        }, completion: { _ in
            self.jaredsButton.isSelected ? self.tintBugGreen() : self.tintBugBlack()
        })
    }
    
    private func tintBugGreen() {
        UIView.animate(withDuration: 1.0, delay: 0.0, options: .curveEaseInOut, animations: {
            self.bug.tintColor = UIColor.green
        }, completion: { _ in
            self.jaredsButton.isSelected ? self.tintBugRed() : self.tintBugBlack()
        })
    }
    
    private func tintBugBlack() {
        UIView.animate(withDuration: 1.0, delay: 0.0, options: .curveEaseInOut, animations: {
            self.bug.tintColor = UIColor.black
        })
    }
}
