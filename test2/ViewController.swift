
//https://swiftbook.ru/post/tutorials/ios-root-controller-navigation/
//https://translated.turbopages.org/proxy_u/en-ru.ru.093428d6-62611c3a-545be753-74722d776562/https/developer.apple.com/library/archive/documentation/WindowsViews/Conceptual/ViewControllerCatalog/Chapters/NavigationControllers.html
import UIKit

//самый нижний слой
class ViewController: UIViewController
{
    let DialogButton = UIButton()
    let label2 = UILabel()
    let newView = UIView()
    let buttonlabel = UILabel()
    
    @objc func ExitButtonClicked(_ sender: Any)
    {
        //создаем новое окно
        let a = DialogViewController()
        let b:UIViewController = a as UIViewController
        //добавляем окно в стек окон
        navigationController?.pushViewController(b, animated: true)

    }
    override func viewDidAppear(_ animated: Bool)
    {
        super.viewDidAppear(animated)
        super.viewDidLoad()
        print(navigationController!.viewControllers.count)
    
    }
    override func viewDidLoad()
    {
        
        super.viewDidLoad()

        //Устанавливаем ему цвет и другие параметры
        newView.backgroundColor = UIColor.systemGray6

        //Добавляем его на основное View (чтобы полностью перекрасить)
        view.addSubview(newView)

        //Отключаем constraint перед установкой своих
        newView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate(
            [
                newView.rightAnchor.constraint(equalTo: view.rightAnchor),
                newView.topAnchor.constraint(equalTo: view.topAnchor),
                newView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
                newView.leftAnchor.constraint(equalTo: view.leftAnchor)
            ]
        )
        
        let buttonText = "Диалог №1"
        let font = UIFont.systemFont(ofSize: 25)
        let attributes = [NSAttributedString.Key.font: font]
        let attributeString = NSAttributedString(string: buttonText, attributes: attributes)
        DialogButton.setAttributedTitle(attributeString, for: .normal)
        DialogButton.backgroundColor = UIColor.systemBackground
        DialogButton.addTarget(self, action: #selector(ExitButtonClicked), for: .touchUpInside)
        DialogButton.translatesAutoresizingMaskIntoConstraints = false
                
        newView.addSubview(DialogButton)
    
        NSLayoutConstraint.activate(
        [
            DialogButton.rightAnchor.constraint(equalTo: DialogButton.superview!.safeAreaLayoutGuide.rightAnchor, constant: 0),
            DialogButton.topAnchor.constraint(equalTo: DialogButton.superview!.safeAreaLayoutGuide.topAnchor, constant: 0),
            DialogButton.bottomAnchor.constraint(equalTo: DialogButton.superview!.safeAreaLayoutGuide.topAnchor, constant: 50),
            DialogButton.leftAnchor.constraint(equalTo: DialogButton.superview!.safeAreaLayoutGuide.leftAnchor, constant: 0)
         
        ])
        

    }
}
