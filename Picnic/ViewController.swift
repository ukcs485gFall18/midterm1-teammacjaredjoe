import AVFoundation
import UIKit

public class ViewController: UIViewController {
    
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
    }
    
    public override func viewDidAppear(_ animated: Bool) {
        self.openBasket()
        self.openNapkins()
        self.moveBugLeft()
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
    
    private func faceBugLeft() {
        guard !self.bugIsDead else { return }
        UIView.animate(withDuration: 1.0, delay: 0.0, options: [.curveEaseInOut , .allowUserInteraction], animations: {
            self.bug.transform = CGAffineTransform(rotationAngle: 0.0)
        }, completion: { didFinish in
            self.moveBugLeft()
        })
    }
    
    private func moveBugLeft() {
        guard !self.bugIsDead else { return }
        UIView.animate(withDuration: 1.0, delay: 0.5, options: [.curveEaseInOut , .allowUserInteraction], animations: {
            self.bug.center = CGPoint(x: 75, y: 200)
        }, completion: { didFinish in
            self.faceBugRight()
        })
    }
    
    private func faceBugRight() {
        guard !self.bugIsDead else { return }
        UIView.animate(withDuration: 1.0, delay: 0.0, options: [.curveEaseInOut , .allowUserInteraction], animations: {
            self.bug.transform = CGAffineTransform(rotationAngle: .pi)
        }, completion: { didFinish in
            self.moveBugRight()
        })
    }
    
    private func moveBugRight() {
        guard !self.bugIsDead else { return }
        UIView.animate(withDuration: 1.0, delay: 0.5, options: [.curveEaseInOut , .allowUserInteraction], animations: {
            self.bug.center = CGPoint(x: self.view.frame.width - 75, y: 250)
        }, completion: { didFinish in
            self.faceBugLeft()
        })
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
