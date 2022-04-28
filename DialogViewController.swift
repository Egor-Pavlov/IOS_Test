//https://russianblogs.com/article/11031568214/
//https://stackoverflow.com/questions/26070242/move-view-with-keyboard-using-swift
//https://stackoverflow.com/questions/44931898/using-scrollview-programmatically-in-swift-3

import UIKit

//самый нижний слой
class DialogViewController: UIViewController
{
    let TextArea = UITextView()
    let MainView = UIView()
    let contentView = UIView()
    let ScrollView = UIScrollView()
    var messages: [String] = ["1", "jhds"]
    var labels: [UILabel] = []
    let container = UIView()
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
        
        ScrollView.translatesAutoresizingMaskIntoConstraints = false
        contentView.translatesAutoresizingMaskIntoConstraints = false
        MainView.addSubview(ScrollView)
        ScrollView.addSubview(contentView)
        NSLayoutConstraint.activate(
            [
                ScrollView.leftAnchor.constraint(equalTo: ScrollView.superview!.safeAreaLayoutGuide.leftAnchor),
                ScrollView.topAnchor.constraint(equalTo: ScrollView.superview!.safeAreaLayoutGuide.topAnchor),
                ScrollView.rightAnchor.constraint(equalTo: ScrollView.superview!.safeAreaLayoutGuide.rightAnchor),
                ScrollView.bottomAnchor.constraint(equalTo: ScrollView.superview!.safeAreaLayoutGuide.bottomAnchor, constant: -55.0),
                
                ScrollView.contentLayoutGuide.widthAnchor.constraint(equalTo: ScrollView.superview!.widthAnchor),
                //ScrollView.heightAnchor.constraint(equalToConstant: ScrollView.superview!.heightAnchor),
                
                
            ]
        )
        
        contentView.addSubview(container)
        //label.frame = CGRect(x: 50, y: 50, width: UIScreen.main.bounds.width , height: 100)
        container.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate(
        [
            container.leftAnchor.constraint(equalTo: container.superview!.leftAnchor, constant: 8.0),
            container.topAnchor.constraint(equalTo: container.superview!.topAnchor, constant: 8.0),

            container.rightAnchor.constraint(equalTo: container.superview!.rightAnchor, constant: -8.0),
            container.bottomAnchor.constraint(equalTo: container.superview!.bottomAnchor, constant: 108.0)
        ])
        contentView.sizeToFit()
        for i in 0..<messages.count
        {
            labels.append(UILabel())
            labels.last!.text = (messages[i])
            labels.last!.backgroundColor = UIColor.systemCyan
            labels.last!.textColor = .white
            
            ScrollView.addSubviewAtBottomOfAllSubviews(view: labels.last!)
            //ScrollView.addSubview(labels.last!)
            labels.last!.textAlignment = .center
            labels.last!.numberOfLines = 0
            labels.last!.sizeToFit()
            labels.last!.font = UIFont(name: TextArea.font?.fontName ?? "HelveticaNeue", size: 20)
            labels.last!.layer.cornerRadius = 15
            labels.last!.layer.masksToBounds = true
            labels.last!.translatesAutoresizingMaskIntoConstraints = false
            var size = 45
            if size < messages[i].count * 10 + 20
            {
                size = messages[i].count * 10 + 20
            }
            
            if i == 0
            {
                NSLayoutConstraint.activate(
                [
                    labels.last!.topAnchor.constraint(equalTo: labels.last!.superview!.topAnchor, constant: 10),
                    labels.last!.rightAnchor.constraint(equalTo: labels.last!.superview!.safeAreaLayoutGuide.rightAnchor, constant: -10),
                    labels.last!.bottomAnchor.constraint(equalTo: labels.last!.topAnchor, constant: 50),
                    labels.last!.leftAnchor.constraint(equalTo: labels.last!.rightAnchor, constant: -(CGFloat(size) + 10))
                ])
            }
            else
            {
                NSLayoutConstraint.activate(
                [
                    labels.last!.rightAnchor.constraint(equalTo: labels.last!.superview!.safeAreaLayoutGuide.rightAnchor, constant: -10),
                    labels.last!.topAnchor.constraint(equalTo: labels.last!.superview!.subviews[labels.last!.superview!.subviews.count - 2].safeAreaLayoutGuide.bottomAnchor, constant: 10),
                    labels.last!.bottomAnchor.constraint(equalTo: labels.last!.topAnchor, constant: 50),
                    labels.last!.leftAnchor.constraint(equalTo: labels.last!.rightAnchor, constant: -(CGFloat(size) + 10))
                ])
            }
            
        }

            ScrollView.resizeContentSize()
//       ScrollView.backgroundColor = .red
        
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
        if TextArea.text != ""
        {
            messages.append(TextArea.text)
            
        }
        TextArea.text = ""
        TextArea.endEditing(true)
        self.viewDidLoad()
    }

    
}
