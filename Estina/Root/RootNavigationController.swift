//
//  Created by Hitesh Vaghela on 31/01/2021.
//

import UIKit

class RootNavigationController: UINavigationController {
  
  override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
    super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
  }
  
  override init(rootViewController: UIViewController) {
    super.init(rootViewController: rootViewController)
    navigationBar.tintColor = .black
    navigationBar.isTranslucent = true
  }
  
  required init?(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)
  }
  
}
