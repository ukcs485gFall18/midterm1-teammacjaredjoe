import AVFoundation
import UIKit

public class ViewController: UIViewController {
    
    @IBOutlet weak var Joe: UIButton!
    
    @IBOutlet weak var Jared: UIButton!
    
    @IBOutlet weak var bug: UIImageView!
    
    @IBOutlet weak var basketTop: UIImageView!
    
    @IBOutlet weak var basketBottom: UIImageView!
    
    @IBOutlet weak var fabricTop: UIImageView!
    
    @IBOutlet weak var fabricBottom: UIImageView!
    
    @IBOutlet weak var basketTopConstraint : NSLayoutConstraint!
    
    @IBOutlet weak var basketBottomConstraint : NSLayoutConstraint!
    
    
    private var bugIsDead: Bool = false
    
    private var audioPlayer: AVAudioPlayer!
    
    public override func viewDidLoad() {
        let url = Bundle.main.url(forResource: "squish", withExtension: "caf")!
        self.audioPlayer = try! AVAudioPlayer(contentsOf: url)
        self.audioPlayer.prepareToPlay()
        
        //Joe Clements (let UpSwipe, downSwipe to end of viewDidLoad
        let upSwipe = UISwipeGestureRecognizer(target: self, action: #selector(ViewController.handleSwipes(_:)))
    
        let downSwipe = UISwipeGestureRecognizer(target: self, action: #selector(ViewController.handleSwipes(_:)))
        
        upSwipe.direction = .up
        downSwipe.direction = .down
    
        view.addGestureRecognizer(upSwipe)
        view.addGestureRecognizer(downSwipe)
    }
    
    public override func viewDidAppear(_ animated: Bool) {
        //self.openBasket()
        self.openNapkins()

    }
    
    public override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard !self.bugIsDead else { return }
        if touches.contains(where: { self.bug.frame.contains($0.location(in: super.view)) }) {
            self.audioPlayer.play()
            self.bugIsDead = true
            self.squishBug()
        }
    }

    private func openBasket() {
        self.basketTopConstraint.constant -= self.basketTop.frame.size.height
        self.basketBottomConstraint.constant -= self.basketBottom.frame.size.height
        UIView.animate(withDuration: 0.7, delay: 1.0, options: .curveEaseOut, animations: {
            self.view.layoutIfNeeded()
        }, completion: nil)
    }
    
    private func openNapkins() {
        UIView.animate(withDuration: 1.0, delay: 1.2, options: .curveEaseOut, animations: {
            self.fabricTop.frame.origin.y -= self.fabricTop.frame.size.height
            self.fabricBottom.frame.origin.y += self.fabricBottom.frame.size.height
        }, completion: nil)
    }
    
    //The following code was added by Joe Clements (handleSwipes)
    func handleSwipes(sender:UISwipeGestureRecognizer) {
        if (sender.direction == .up) {
            print ("Swipe Up")
            UIView.animate(withDuration: 1.0, delay: 1.2, options: .curveEaseOut, animations: {
                self.basketTop.frame.origin.y -= self.basketTop.frame.size.height
                self.basketBottom.frame.origin.y += self.basketBottom.frame.size.height
            }, completion: nil)
        }
        else if (sender.direction == .down) {
            print ("Swipe Down")
            UIView.animate(withDuration: 1.0, delay: 1.2, options: .curveEaseOut, animations: {
                self.basketTop.frame.origin.y -= self.basketTop.frame.size.height
                self.basketBottom.frame.origin.y += self.basketBottom.frame.size.height
            }, completion: nil)
        }
        else {return}
    }
    
    @IBAction func JoeTapped(_sender: Any) {
        if Joe.state == .highlighted {
            Joe.isSelected = true
            moveBugToJoe1()
        }
        else {
            Joe.isSelected = false
        }
    }
    
    @IBAction func JaredTapped(_sender: Any) {
        if Jared.state == .highlighted {
            Jared.isSelected = true
            moveBugToJared1()
        }
        else {
            Jared.isSelected = false
        }
    }
    
    func moveBugToJoe1() {
        UIView.animate(withDuration: 1.0,
                       delay: 2.0,
                       options: [.curveEaseInOut , .allowUserInteraction],
                       animations: {
                        self.bug.center = CGPoint(x: 75, y: 200)
        },
                       completion: { finished in
                        print("Zig")
                        self.moveBugToJoe2()
        })
    }
    
    func moveBugToJoe2() {
        UIView.animate(withDuration: 1.0,
                       delay: 0.0,
                       options: [.curveEaseInOut , .allowUserInteraction],
                       animations: {
                        self.bug.transform = CGAffineTransform(rotationAngle: 700.0)
        },
                       completion: { finished in
                        print("Turn Right")
                        self.moveBugToJoe3()
        })
    }
    
    func moveBugToJoe3() {
        UIView.animate(withDuration: 1.0,
                       delay: 2.0,
                       options: [.curveEaseInOut , .allowUserInteraction],
                       animations: {
                        self.bug.center = CGPoint(x: self.view.frame.width - 75, y: 150)
        },
                       completion: { finished in
                        print("Zag")
                        self.moveBugToJoe4()
        })
    }
    
    func moveBugToJoe4() {
        UIView.animate(withDuration: 1.0,
                       delay: 0.0,
                       options: [.curveEaseInOut , .allowUserInteraction],
                       animations: {
                        self.bug.transform = CGAffineTransform(rotationAngle: -75.0)
        },
                       completion: { finished in
                        print("Turn Left")
                        self.moveBugToJoe5()
        })
    }
    
    func moveBugToJoe5() {
        UIView.animate(withDuration: 1.0,
                       delay: 2.0,
                       options: [.curveEaseInOut , .allowUserInteraction],
                       animations: {
                        self.bug.center = CGPoint(x: self.view.frame.width - 175, y: 75)
        },
                       completion: { finished in
                        print("Zig")
                        self.moveBugToJoe6()
        })
    }
    
    func moveBugToJoe6() {
        UIView.animate(withDuration: 1.0,
                       delay: 0.0,
                       options: [.curveEaseInOut , .allowUserInteraction],
                       animations: {
                        self.bug.transform = CGAffineTransform(rotationAngle: 450.0)
        },
                       completion: { finished in
                        print("Turn Right")
                        self.moveBugBackHome1()
        })
    }
    
    func moveBugBackHome1() {
        UIView.animate(withDuration: 1.0,
                       delay: 2.0,
                       options: [.curveEaseInOut , .allowUserInteraction],
                       animations: {
                        self.bug.center = CGPoint(x: self.view.frame.width - 75, y: 250)
        },
                       completion: { finished in
                        print("Back Home")
                        self.moveBugBackHome2()
        })
    }
    
    func moveBugBackHome2() {
        UIView.animate(withDuration: 1.0,
                       delay: 0.0,
                       options: [.curveEaseInOut , .allowUserInteraction],
                       animations: {
                        self.bug.transform = CGAffineTransform(rotationAngle: 0.0)
        },
                       completion: { finished in
                        print("Turn Left")
        })
    }
    
    func moveBugToJared1() {
        print("working")
    }
    
    private func squishBug() {
        UIView.animate(withDuration: 0.7, delay: 0.0, options: [.curveEaseOut , .beginFromCurrentState], animations: {
            self.bug.transform = CGAffineTransform(scaleX: 1.25, y: 0.75)
        }, completion: { didFinish in
            self.fadeBug()
        })
    }
    
    private func fadeBug() {
        UIView.animate(withDuration: 2.0, delay: 2.0, options: [], animations: {
            self.bug.alpha = 0.0
        }, completion: { didFinish in
            self.bug.removeFromSuperview()
        })
    }
}
