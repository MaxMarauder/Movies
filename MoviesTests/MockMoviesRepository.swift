import Foundation
@testable import Movies

class MockMoviesRepository: MoviesRepositoryType {
    var movies: [Movie] = []
    
    var fetchNextPageCount: Int = 0
    
    init() {
    }
    
    func fetchNextPage(completion: @escaping (_ result: Result<Void, APIError>) -> Void) {
        fetchNextPageCount += 1
        completion(.success(()))
    }
}
