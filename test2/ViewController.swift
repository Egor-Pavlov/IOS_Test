import UIKit

class ViewController: UIViewController
{
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
	
	
	@objc func buttonClicked(_ sender: Any)
	{
		
		label2.text! += "aa "
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
		newView.backgroundColor = UIColor.red

		//3. Добавляем его (newView) на наше основное View
		view.addSubview(newView)
		newView.addSubview(label2)
		//4. Отключаем constraint перед установкой своих
		newView.translatesAutoresizingMaskIntoConstraints = false
		label2.translatesAutoresizingMaskIntoConstraints = false
		NSLayoutConstraint.activate(
			[
                newView.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor, constant: -10),
				newView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 5),
                newView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -5),
                newView.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor, constant: 10)

			]
		)

		let button = UIButton()
		button.backgroundColor = UIColor.black
		button.titleLabel?.textColor = UIColor.white

		let buttonText = "ButtonText"
		let font = UIFont.systemFont(ofSize: 20)
		let attributes = [NSAttributedString.Key.font: font]
		let attributeString = NSAttributedString(string: buttonText, attributes: attributes)
		button.setAttributedTitle(attributeString, for: .normal)
				//button.setTitle(" Button", forState: .Normal)

		button.addTarget(self, action: #selector(buttonClicked), for: .touchUpInside)
		button.translatesAutoresizingMaskIntoConstraints = false
		newView.addSubview(button)
	
		NSLayoutConstraint.activate(
		[
			button.rightAnchor.constraint(equalTo: button.superview!.rightAnchor, constant: -5),
			button.topAnchor.constraint(equalTo: newView.topAnchor, constant: 5),
			button.bottomAnchor.constraint(equalTo: newView.topAnchor, constant: 100),
			button.leftAnchor.constraint(equalTo: newView.leftAnchor, constant: 5)
		 
		])
		NSLayoutConstraint.activate(
		[
			label2.rightAnchor.constraint(equalTo: newView.rightAnchor, constant: -5),
			label2.topAnchor.constraint(equalTo: newView.subviews[1].bottomAnchor, constant: 5),
			label2.bottomAnchor.constraint(equalTo: newView.bottomAnchor, constant: -5),
			label2.leftAnchor.constraint(equalTo: newView.leftAnchor, constant: 5)
	 
		])


	}
}
