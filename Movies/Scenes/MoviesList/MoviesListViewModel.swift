import Foundation

final class MoviesListViewModel: NSObject, ViewModel, ObservableObject {
    weak var coordinator: CoordinatorType?
    
    var movies: [Movie] {
        return coordinator?.repositories.moviesRepository.movies ?? []
    }
    
    @Published var isLoading: Bool = false
    
    init(withCoordinator coordinator: CoordinatorType?) {
        self.coordinator = coordinator
        
        super.init()
    }
    
    func fetchNextPage() async {
        await MainActor.run {
            isLoading = true
        }
        await withCheckedContinuation { continuation in
            coordinator?.repositories.moviesRepository.fetchNextPage { [weak self] result in
                switch result {
                case .success:
                    self?.objectWillChange.send()
                case .failure(let error):
                    print("Error: \(error)")
                }
                self?.isLoading = false
                continuation.resume()
            }
        }
    }
    
    func filteredMovies(searchText: String) -> [Movie] {
        if searchText.isEmpty {
            return movies
        }
        return movies.filter { $0.title?.starts(with: searchText) ?? false || $0.originalTitle?.starts(with: searchText) ?? false }
    }    
}
