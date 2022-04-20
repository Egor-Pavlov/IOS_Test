import UIKit

class ViewController: UIViewController
{
    let ExitButton = UIButton()
	//размеры экрана
	public var screenWidth: CGFloat
	{
		return UIScreen.main.bounds.width
	}

	public var screenHeight: CGFloat
	{
		return UIScreen.main.bounds.height
	}

	let label2 = UILabel()
	let Stack1 = UIStackView()
	
	
	@objc func ExitButtonClicked(_ sender: Any)
	{
		
        exit(0)
	}
	
	override func viewDidLoad()
	{
		super.viewDidLoad()

	
		super.viewDidLoad()
		label2.text = "label2"
		label2.backgroundColor = UIColor.blue
		label2.textAlignment = .center

		//1. Создаём объект
		let newView = UIView()

		//2. Устанавливаем ему цвет и другие параметры
        newView.backgroundColor = UIColor.systemBackground

		//3. Добавляем его (newView) на наше основное View
		view.addSubview(newView)
		//newView.addSubview(label2)
		//4. Отключаем constraint перед установкой своих
		newView.translatesAutoresizingMaskIntoConstraints = false
		label2.translatesAutoresizingMaskIntoConstraints = false
		NSLayoutConstraint.activate(
			[
                newView.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor),
				newView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
                newView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
                newView.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor)

			]
		)

		
        
        
        
        ExitButton.backgroundColor = UIColor.systemBackground
        ExitButton.titleLabel?.textColor = UIColor.red
//        ExitButton.layer.borderColor = UIColor.gray.cgColor
//        ExitButton.layer.borderWidth = 1
    
        
		let buttonText = "ButtonText"
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
            ExitButton.rightAnchor.constraint(equalTo: ExitButton.superview!.rightAnchor, constant: 0),
            ExitButton.topAnchor.constraint(equalTo: ExitButton.superview!.bottomAnchor, constant: -50),
            ExitButton.bottomAnchor.constraint(equalTo: ExitButton.superview!.bottomAnchor, constant: 0),
            ExitButton.leftAnchor.constraint(equalTo: ExitButton.superview!.leftAnchor, constant: 0)
		 
		])
	}
}
