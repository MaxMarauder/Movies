import Foundation

protocol MoviesRepositoryType {
    var movies: [Movie] { get }
    func fetchNextPage(completion: @escaping (_ result: Result<Void, APIError>) -> Void)
}

final class MoviesRepository: MoviesRepositoryType {
    let apiClient: APIClientType
    
    private(set) var movies: [Movie] = []
    private var currentPage = 0
    private var totalPages: Int?

    init(apiClient: APIClientType) {
        self.apiClient = apiClient
    }

    func fetchNextPage(completion: @escaping (_ result: Result<Void, APIError>) -> Void) {
        currentPage += 1
        if let totalPages, currentPage > totalPages {
            completion(.success(()))
            return
        }
        
        apiClient.request(resource: MovieDiscover(page: currentPage, primaryReleaseDateLTE: Date.now)) { [weak self] result in
            switch result {
            case .success(let payload):
                self?.movies += payload.results
                self?.totalPages = payload.totalPages
                completion(.success(()))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
}
