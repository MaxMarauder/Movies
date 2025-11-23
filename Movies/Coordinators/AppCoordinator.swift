import UIKit
import SwiftUI

enum AppState {
    case moviesList
    case movieDetails(movie: Movie)
}

final class AppCoordinator: CoordinatorType {
    var repositories: Repositories
    lazy var rootView: AnyView = {
        let viewModel = MoviesListViewModel(withCoordinator: self)
        return AnyView(MoviesListView(viewModel: viewModel))
    }()
    var children: [CoordinatorType] = []

    init(withRepositories repositories: Repositories) {
        self.repositories = repositories
    }

    func view(for state: AppState) -> AnyView {
        switch state {
        case .movieDetails(let movie):
            let viewModel = MovieDetailsViewModel(withCoordinator: self, movie: movie)
            return AnyView(MovieDetailsView(viewModel: viewModel))
        default:
            return AnyView(EmptyView())
        }
    }
}
