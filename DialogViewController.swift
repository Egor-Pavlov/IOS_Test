//https://russianblogs.com/article/11031568214/
//https://stackoverflow.com/questions/26070242/move-view-with-keyboard-using-swift

import UIKit

//самый нижний слой
class DialogViewController: UIViewController
{
    let MainView = UIView()
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
        
        MainView.backgroundColor = UIColor.systemGray6

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

        let TextArea = UITextView()
        
        TextArea.translatesAutoresizingMaskIntoConstraints = false
        TextArea.backgroundColor = .systemBackground
        TextArea.font = UIFont(name: TextArea.font?.fontName ?? "HelveticaNeue", size: 18)
        
        MainView.addSubview(TextArea)
        
        NSLayoutConstraint.activate(
            [
                TextArea.rightAnchor.constraint(equalTo: TextArea.superview!.safeAreaLayoutGuide.rightAnchor, constant: -10),
                TextArea.topAnchor.constraint(equalTo: TextArea.superview!.safeAreaLayoutGuide.bottomAnchor, constant: -50 ),
                TextArea.bottomAnchor.constraint(equalTo: TextArea.superview!.safeAreaLayoutGuide.bottomAnchor, constant: -10),
                TextArea.leftAnchor.constraint(equalTo: TextArea.superview!.safeAreaLayoutGuide.leftAnchor, constant: 10)

            ]
        )
        

        
    }
}
