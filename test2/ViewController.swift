
//https://swiftbook.ru/post/tutorials/ios-root-controller-navigation/
//https://translated.turbopages.org/proxy_u/en-ru.ru.093428d6-62611c3a-545be753-74722d776562/https/developer.apple.com/library/archive/documentation/WindowsViews/Conceptual/ViewControllerCatalog/Chapters/NavigationControllers.html
import UIKit

//самый нижний слой
class ViewController: UIViewController
{
    let ExitButton = UIButton()
    let label2 = UILabel()
    @objc func ExitButtonClicked(_ sender: Any)
    {
        
        let a = DialogListViewController()
        let b:UIViewController = a as UIViewController
        navigationController?.pushViewController(b, animated: true)

    }
    override func viewDidAppear(_ animated: Bool)
    {
        super.viewDidAppear(animated)
        super.viewDidLoad()
        print(navigationController!.viewControllers.count)
        //navigationController?.accessibilityElements?.removeAll()
//        let date = Date()
//        let calendar = Calendar.current
//        let hour = calendar.component(.hour, from: date)
//        let minute = calendar.component(.minute, from: date)
//        let second = calendar.component(.second, from: date)
//        label2.text = String(hour) + " " + String (minute) + " " + String(second)
        
    }
    override func viewDidLoad()
    {
        
        super.viewDidLoad()
        let date = Date()
        let calendar = Calendar.current
        let hour = calendar.component(.hour, from: date)
        let minute = calendar.component(.minute, from: date)
        let second = calendar.component(.second, from: date)

      
        //1. Создаём объект
        let newView = UIView()

        //2. Устанавливаем ему цвет и другие параметры
        newView.backgroundColor = UIColor.systemBackground

        //3. Добавляем его (newView) на наше основное View
        view.addSubview(newView)

        //4. Отключаем constraint перед установкой своих
        newView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate(
            [
                newView.rightAnchor.constraint(equalTo: view.rightAnchor),
                newView.topAnchor.constraint(equalTo: view.topAnchor),
                newView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
                newView.leftAnchor.constraint(equalTo: view.leftAnchor)

            ]
        )
        newView.addSubview(label2)

        label2.textAlignment = .center
        label2.text = String(hour) + " " + String (minute) + " " + String(second)
        label2.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate(
            [
                label2.rightAnchor.constraint(equalTo: label2.superview!.safeAreaLayoutGuide.rightAnchor, constant: 0),
                label2.topAnchor.constraint(equalTo: label2.superview!.safeAreaLayoutGuide.topAnchor, constant: 70),
                label2.bottomAnchor.constraint(equalTo: label2.superview!.safeAreaLayoutGuide.topAnchor, constant: 100),
                label2.leftAnchor.constraint(equalTo: label2.superview!.safeAreaLayoutGuide.leftAnchor, constant: 0)

            ]
        )
        
        ExitButton.backgroundColor = UIColor.systemBackground
        ExitButton.titleLabel?.textColor = UIColor.blue
//        ExitButton.layer.borderColor = UIColor.gray.cgColor
//        ExitButton.layer.borderWidth = 1
    
        
        let buttonText = "Exit"
        let font = UIFont.systemFont(ofSize: 25)
        let attributes = [NSAttributedString.Key.font: font]
        let attributeString = NSAttributedString(string: buttonText, attributes: attributes)
        ExitButton.setAttributedTitle(attributeString, for: .normal)
                //button.setTitle(" Button", forState: .Normal)

        ExitButton.addTarget(self, action: #selector(ExitButtonClicked), for: .touchUpInside)
        ExitButton.translatesAutoresizingMaskIntoConstraints = false
        newView.addSubview(ExitButton)
    
        NSLayoutConstraint.activate(
        [
            ExitButton.rightAnchor.constraint(equalTo: ExitButton.superview!.safeAreaLayoutGuide.rightAnchor, constant: 0),
            ExitButton.topAnchor.constraint(equalTo: ExitButton.superview!.safeAreaLayoutGuide.topAnchor, constant: 0),
            ExitButton.bottomAnchor.constraint(equalTo: ExitButton.superview!.safeAreaLayoutGuide.topAnchor, constant: 50),
            ExitButton.leftAnchor.constraint(equalTo: ExitButton.superview!.safeAreaLayoutGuide.leftAnchor, constant: 0)
         
        ])
    }
}
