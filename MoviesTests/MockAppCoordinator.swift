import UIKit
import SwiftUI
@testable import Movies

class MockAppCoordinator: CoordinatorType {
    var children: [CoordinatorType] = []
    let repositories = Repositories(moviesRepository: MockMoviesRepository())
    let rootView = AnyView(EmptyView())
    
    var navigateCount: Int = 0
    
    func view(for state: AppState) -> AnyView {
        navigateCount += 1
        return AnyView(EmptyView())
    }
    
    
}
