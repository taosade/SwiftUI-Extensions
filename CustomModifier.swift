// Example of a custom view modifier with 2 ways of application

import SwiftUI

struct MyViewModifier: ViewModifier
{
	func body(content: Content) -> some View
	{
		content.background { Circle().fill(.orange) }
	}
}

extension View
{
	func myViewModifier() -> some View
	{
		self.modifier(MyViewModifier())
	}
}

struct CustomModifierView: View
{
	var body: some View
	{
		VStack
		{
      // Apply modifier directly
      
			Text("HELLO").modifier(MyViewModifier())
      
      // Apply modifier using the extension

			Text("WORLD").myViewModifier()
		}
	}
}

struct CustomModifierView_Previews: PreviewProvider
{
	static var previews: some View
	{
		CustomModifierView()
	}
}
