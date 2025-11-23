import Foundation

/// Structure containing all the repositories
struct Repositories {
    var moviesRepository: MoviesRepositoryType

    init(moviesRepository: MoviesRepositoryType) {
        self.moviesRepository = moviesRepository
    }
}
