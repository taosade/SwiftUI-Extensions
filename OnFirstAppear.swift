// Custom modifier which acts like .onAppear() but only once

import SwiftUI

private struct FirstAppear: ViewModifier
{
	let action: () -> ()

	@State private var hasAppeared = false

	func body(content: Content) -> some View
	{
		content.onAppear
		{
			guard !self.hasAppeared else { return }

			self.hasAppeared = true

			self.action()
		}
	}
}

extension View
{
	func onFirstAppear(_ action: @escaping () -> ()) -> some View
	{
		modifier(FirstAppear(action: action))
	}
}

struct OnFirstAppear: View
{
	@State private var greeting: String = "Hello"

	var body: some View
	{
		NavigationView
		{
			VStack
			{
				Text(greeting).onTapGesture { greeting = "Tapped!" }

				NavigationLink(destination: Text("Second view"))
				{
					Text("Go to second view")
				}
			}
		}.onFirstAppear { greeting += " world!" }
	}
}

struct OnFirstAppear_Previews: PreviewProvider
{
	static var previews: some View
	{
		OnFirstAppear()
	}
}
