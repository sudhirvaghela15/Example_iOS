//
//  SceneDelegate.swift
//  SOLID_principles_Example_iOS
//
//  Created by sudhir on 24/01/25.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

	var window: UIWindow?

	func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
		guard let windowScene = (scene as? UIWindowScene) else { return }
		
		self.window = UIWindow(windowScene: windowScene)
		
		let feedViewModel = FeedViewModel()
		window?.rootViewController = FeedVC.get(viewModel: feedViewModel, onRefresh: { })
		window?.makeKeyAndVisible()
		
	}

}

