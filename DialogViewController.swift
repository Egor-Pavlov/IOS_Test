//https://russianblogs.com/article/11031568214/
//https://stackoverflow.com/questions/26070242/move-view-with-keyboard-using-swift

import UIKit

//самый нижний слой
class DialogViewController: UIViewController
{
    let TextArea = UITextView()
    let MainView = UIView()
    var messages: [String] = ["1", "jhds"]
    var labels: [UILabel] = []
    //размеры экрана
    public var screenWidth: CGFloat
    {
        return UIScreen.main.bounds.width
    }

    public var screenHeight: CGFloat
    {
        return UIScreen.main.bounds.height
    }
    
    override func viewDidDisappear(_ animated: Bool)
    {
        super.viewDidDisappear(animated)

    }
    deinit {
         NotificationCenter.default.removeObserver(self)
       }

// клавиатура вылезает
    @objc func keyboardWillShow(notification: NSNotification)
    {
        if let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue
        {
            if self.view.frame.origin.y == 0
            {
                self.view.frame.origin.y -= keyboardSize.height
            }
        }
    }
//клавиатура прячется
    @objc func keyboardWillHide(notification: NSNotification)
    {
        if self.view.frame.origin.y != 0
        {
            self.view.frame.origin.y = 0
        }
    }
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
        
        MainView.backgroundColor = UIColor.systemGray5

        view.addSubview(MainView)

        MainView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate(
            [
                MainView.rightAnchor.constraint(equalTo: view.rightAnchor),
                MainView.topAnchor.constraint(equalTo: view.topAnchor),
                MainView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
                MainView.leftAnchor.constraint(equalTo: view.leftAnchor)

            ]
        )
        for i in 0..<messages.count
        {
            labels.append(UILabel())
            labels.last!.text = messages[i]
            labels.last!.backgroundColor = .systemGreen
            labels.last!.textColor = .white
            
            MainView.addSubview(labels.last!)
            labels.last!.textAlignment = .right
            labels.last!.font = UIFont(name: TextArea.font?.fontName ?? "HelveticaNeue", size: 20)
            labels.last!.layer.cornerRadius = 30
            labels.last!.translatesAutoresizingMaskIntoConstraints = false
            if i == 0 {
                NSLayoutConstraint.activate(
                [
                    labels.last!.rightAnchor.constraint(equalTo: labels.last!.superview!.safeAreaLayoutGuide.rightAnchor, constant: -10),
                    labels.last!.topAnchor.constraint(equalTo: labels.last!.superview!.safeAreaLayoutGuide.topAnchor, constant: 0),
                    labels.last!.bottomAnchor.constraint(equalTo: labels.last!.superview!.safeAreaLayoutGuide.topAnchor, constant: 50),
                    labels.last!.leftAnchor.constraint(equalTo: labels.last!.superview!.safeAreaLayoutGuide.leftAnchor, constant: 10)
                ])
            }
            else{
                
            NSLayoutConstraint.activate(
            [
                labels.last!.rightAnchor.constraint(equalTo: MainView.safeAreaLayoutGuide.rightAnchor, constant: -10),
                labels.last!.topAnchor.constraint(equalTo: MainView.subviews[MainView.subviews.count - 2].safeAreaLayoutGuide.bottomAnchor, constant: 10),
                labels.last!.bottomAnchor.constraint(equalTo: labels.last!.topAnchor, constant: 50),
                labels.last!.leftAnchor.constraint(equalTo: MainView.safeAreaLayoutGuide.leftAnchor, constant: 10)
            ])
            }
        }
        
      
        
        TextArea.translatesAutoresizingMaskIntoConstraints = false
        TextArea.backgroundColor = .systemBackground
        TextArea.font = UIFont(name: TextArea.font?.fontName ?? "HelveticaNeue", size: 18)
        TextArea.layer.cornerRadius = 10
        MainView.addSubview(TextArea)
        
        NSLayoutConstraint.activate(
            [
                TextArea.rightAnchor.constraint(equalTo: TextArea.superview!.safeAreaLayoutGuide.rightAnchor, constant: -70),
                TextArea.topAnchor.constraint(equalTo: TextArea.superview!.safeAreaLayoutGuide.bottomAnchor, constant: -45 ),
                TextArea.bottomAnchor.constraint(equalTo: TextArea.superview!.safeAreaLayoutGuide.bottomAnchor, constant: -10),
                TextArea.leftAnchor.constraint(equalTo: TextArea.superview!.safeAreaLayoutGuide.leftAnchor, constant: 20)

            ]
        )
        
        let SendButton = UIButton()
        
        SendButton.setImage(UIImage(named: "send.png"), for: .normal)
        SendButton.addTarget(self, action: #selector(SendButtonClicked), for: .touchUpInside)
        MainView.addSubview(SendButton)
        
        SendButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate(
            [
                SendButton.rightAnchor.constraint(equalTo: SendButton.superview!.safeAreaLayoutGuide.rightAnchor, constant: -15),
                SendButton.topAnchor.constraint(equalTo: SendButton.superview!.safeAreaLayoutGuide.bottomAnchor, constant: -50 ),
                SendButton.bottomAnchor.constraint(equalTo: SendButton.superview!.safeAreaLayoutGuide.bottomAnchor, constant: -10),
                SendButton.leftAnchor.constraint(equalTo: SendButton.superview!.safeAreaLayoutGuide.rightAnchor, constant: -55)

            ]
        )
        
    }
    
    
    
    @objc func SendButtonClicked(_ sender: Any)
    {
        messages.append(TextArea.text)
        self.viewDidLoad()
    }
    
}
