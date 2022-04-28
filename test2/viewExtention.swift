import UIKit


extension UIView
{
	public var viewWidth: CGFloat
	{
		return self.frame.size.width
	}

	public var viewHeight: CGFloat
	{
		return self.frame.size.height
	}
    func addSubviewAtBottomOfAllSubviews(view:UIView)
    {
        var maxY = CGFloat(0)
        for subview in self.subviews
        {

            if maxY < subview.frame.maxY
            {
                maxY = subview.frame.maxY
            }
        }

        view.frame.origin.y = maxY - 10
        self.addSubview(view)
    }
}
