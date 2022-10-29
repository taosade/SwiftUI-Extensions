// Custom .cornerRadius view modifier applicable to specific corners

import SwiftUI

struct RoundedCorners: Shape
{
	let radius: CGFloat
	let corners: UIRectCorner

	init(
		radius: CGFloat = .infinity,
		corners: UIRectCorner = .allCorners)
	{
		self.radius = radius
		self.corners = corners
	}

	func path(in rect: CGRect) -> Path
	{
		return Path(UIBezierPath(roundedRect: rect, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius)).cgPath)
	}
}

extension View
{
	func cornerRadius(_ radius: CGFloat, corners: UIRectCorner) -> some View
	{
		clipShape(RoundedCorners(radius: radius, corners: corners))
	}
}

struct CornerRadiusView: View
{
	let rectangle: some View = Rectangle()
		.fill(.orange)
		.frame(width: 100, height: 100)

	var body: some View
	{
		VStack
		{
			rectangle.cornerRadius(20, corners: .topLeft)

			rectangle.cornerRadius(20, corners: [.topLeft, .topRight])

			rectangle.cornerRadius(20, corners: [.topLeft, .topRight, .bottomRight])

			rectangle.cornerRadius(20)
		}
	}
}

struct CornerRadiusView_Previews: PreviewProvider
{
	static var previews: some View
	{
		CornerRadiusView()
	}
}
