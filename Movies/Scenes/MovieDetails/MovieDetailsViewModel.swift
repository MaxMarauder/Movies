import Foundation

final class MovieDetailsViewModel: ViewModel, ObservableObject {
    weak var coordinator: CoordinatorType?
    
    var movie: Movie

    init(withCoordinator coordinator: CoordinatorType?, movie: Movie) {
        self.coordinator = coordinator
        self.movie = movie
    }
}
