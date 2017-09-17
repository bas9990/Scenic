import XCTest
@testable import Scenic

class SceneTests: XCTestCase {

    func testStackSceneEmbedsChildren() {
        // given
        let navigationController = UINavigationController()
        let stackScene = StackScene(navigationController: navigationController)
        let scene0 = SingleScene(viewController: UIViewController())
        let scene1 = SingleScene(viewController: UIViewController())

        // when
        stackScene.embed([scene0, scene1])

        // then
        XCTAssertEqual(navigationController.viewControllers, [scene0.viewController, scene1.viewController])
    }

    func testTabBarSceneEmbedsChildren() {
        // given
        let tabBarController = UITabBarController()
        let tabBarScene = TabBarScene(tabBarController: tabBarController)
        let scene0 = SingleScene(viewController: UIViewController())
        let scene1 = SingleScene(viewController: UIViewController())

        // when
        tabBarScene.embed([scene0, scene1])

        // then
        guard let childViewControllers = tabBarController.viewControllers else {
            XCTFail("Unexpectedly found nil")
            return
        }
        XCTAssertEqual(childViewControllers, [scene0.viewController, scene1.viewController])
    }
}
