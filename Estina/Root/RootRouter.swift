//
//  Created by Hitesh Vaghela on 31/01/2021.

import UIKit

protocol RootProtocol: AnyObject {
    func presentHomeScreen(in window: UIWindow)
}

class RootRouter: RootProtocol {
  
  func presentHomeScreen(in window: UIWindow) {
    let seasonList = SeasonListRouter.assembleModule()
    window.rootViewController = RootNavigationController(rootViewController: seasonList)
    window.makeKeyAndVisible()
  }
}
