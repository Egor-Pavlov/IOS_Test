//https://russianblogs.com/article/11031568214/
//https://stackoverflow.com/questions/26070242/move-view-with-keyboard-using-swift
//https://stackoverflow.com/questions/44931898/using-scrollview-programmatically-in-swift-3

import UIKit

class DialogViewController: UIViewController
{
    let TextArea = UITextView()
    let MainView = UIView()
    let BottomPanel = UIView()
    let ScrollView = UIScrollView()
    var messages: [String] = ["1", "jhds"]
    var labels: [UILabel] = []

    override func viewDidDisappear(_ animated: Bool)
    {
        super.viewDidDisappear(animated)
    }
    deinit
    {
         NotificationCenter.default.removeObserver(self)
    }

// клавиатура вылезает
    @objc func keyboardDidShow(notification: NSNotification)
    {
        guard let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue
        else
        {
            return
        }
        //работает
        MainView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -keyboardSize.height).isActive = true
    }
//клавиатура прячется
    @objc func keyboardDidHide(notification: NSNotification)
    {

        MainView.translatesAutoresizingMaskIntoConstraints = false
        //не работает
        MainView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
    }
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardDidShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardDidHide), name: UIResponder.keyboardWillHideNotification, object: nil)
                
        CreateMainView()
        CreateBottomPanel()
        CreateScrollView()

        UpdateLabels()
        
    }
    func CreateMainView()
    {
        MainView.backgroundColor = UIColor.systemGray5
        view.backgroundColor = UIColor.systemGray5
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
    }
    func CreateScrollView()
    {
        ScrollView.translatesAutoresizingMaskIntoConstraints = false
        //contentView.translatesAutoresizingMaskIntoConstraints = false
        MainView.addSubview(ScrollView)
        //ScrollView.addSubview(contentView)
        NSLayoutConstraint.activate(
            [
                ScrollView.leftAnchor.constraint(equalTo: ScrollView.superview!.safeAreaLayoutGuide.leftAnchor),
                ScrollView.topAnchor.constraint(equalTo: ScrollView.superview!.safeAreaLayoutGuide.topAnchor),
                ScrollView.rightAnchor.constraint(equalTo: ScrollView.superview!.safeAreaLayoutGuide.rightAnchor),
                ScrollView.bottomAnchor.constraint(equalTo: BottomPanel.safeAreaLayoutGuide.topAnchor),
                
                ScrollView.contentLayoutGuide.widthAnchor.constraint(equalTo: ScrollView.superview!.widthAnchor),
                //ScrollView.heightAnchor.constraint(equalToConstant: ScrollView.superview!.heightAnchor),
            ]
        )
    }
    
    func CreateBottomPanel()
    {
        MainView.addSubview(BottomPanel)
        BottomPanel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate(
            [
                BottomPanel.rightAnchor.constraint(equalTo: BottomPanel.superview!.safeAreaLayoutGuide.rightAnchor),
                BottomPanel.topAnchor.constraint(equalTo: BottomPanel.superview!.safeAreaLayoutGuide.bottomAnchor, constant: -55 ),
                BottomPanel.bottomAnchor.constraint(equalTo: BottomPanel.superview!.safeAreaLayoutGuide.bottomAnchor, constant: -10),
                BottomPanel.leftAnchor.constraint(equalTo: BottomPanel.superview!.safeAreaLayoutGuide.leftAnchor)
            ]
        )
        TextArea.translatesAutoresizingMaskIntoConstraints = false
        TextArea.backgroundColor = .systemBackground
        TextArea.font = UIFont(name: TextArea.font?.fontName ?? "HelveticaNeue", size: 18)
        TextArea.layer.cornerRadius = 10
        BottomPanel.addSubview(TextArea)
        
        NSLayoutConstraint.activate(
            [
                TextArea.rightAnchor.constraint(equalTo: TextArea.superview!.safeAreaLayoutGuide.rightAnchor, constant: -70),
                TextArea.topAnchor.constraint(equalTo: TextArea.superview!.safeAreaLayoutGuide.topAnchor, constant: 5),
                TextArea.bottomAnchor.constraint(equalTo: TextArea.superview!.safeAreaLayoutGuide.bottomAnchor, constant: -5),
                TextArea.leftAnchor.constraint(equalTo: TextArea.superview!.safeAreaLayoutGuide.leftAnchor, constant: 20)

            ]
        )
        
        let SendButton = UIButton()
        
        SendButton.setImage(UIImage(named: "send.png"), for: .normal)
        SendButton.addTarget(self, action: #selector(SendButtonClicked), for: .touchUpInside)
        BottomPanel.addSubview(SendButton)
        
        SendButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate(
            [
                SendButton.rightAnchor.constraint(equalTo: SendButton.superview!.safeAreaLayoutGuide.rightAnchor, constant: -15),
                SendButton.topAnchor.constraint(equalTo: SendButton.superview!.safeAreaLayoutGuide.topAnchor, constant: 5 ),
                SendButton.bottomAnchor.constraint(equalTo: SendButton.superview!.safeAreaLayoutGuide.bottomAnchor, constant: -5),
                SendButton.leftAnchor.constraint(equalTo: SendButton.superview!.safeAreaLayoutGuide.rightAnchor, constant: -55)

            ]
        )
    }
    func AddLabel(_ i : Int)
    {
        labels.append(UILabel())
        labels.last!.text = (messages[i])
        labels.last!.backgroundColor = UIColor.systemCyan
        labels.last!.textColor = .white
    
        ScrollView.addSubview(labels.last!)
        labels.last!.textAlignment = .center
        labels.last!.numberOfLines = 0
        labels.last!.sizeToFit()
        labels.last!.font = UIFont(name: TextArea.font?.fontName ?? "HelveticaNeue", size: 20)
        labels.last!.layer.cornerRadius = 15
        labels.last!.layer.masksToBounds = true
        labels.last!.translatesAutoresizingMaskIntoConstraints = false
    }
    
    func CreateLabels()
    {
        for i in 0..<messages.count
        {
            AddLabel(i)
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
    }
    
    func UpdateLabels()
    {
        labels.removeAll()
        
        CreateLabels()
        
        var h = 0
        for i in 0..<labels.count
        {
            h += 60//временно
        }
        if CGFloat(h) > ScrollView.visibleSize.height
        {
            ScrollView.contentSize.height = CGFloat(h)
        }
        
        //пролистывание вниз при новом сообщении
        ScrollView.scrollRectToVisible(CGRect(x: 0, y: ScrollView.contentSize.height - ScrollView.visibleSize.height, width: ScrollView.visibleSize.width, height: ScrollView.visibleSize.height), animated: false)
    }
        
    @objc func SendButtonClicked(_ sender: Any)
    {
        if TextArea.text != ""
        {
            messages.append(TextArea.text)
            
        }
        TextArea.text = ""
        TextArea.endEditing(true)
        UpdateLabels()
    }

    
}
