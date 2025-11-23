import XCTest
@testable import Movies

class MoviesListViewModelTests: XCTestCase {
    var mockAppCoordinator: MockAppCoordinator!
    lazy var mockMoviesRepository: MockMoviesRepository = {
        return mockAppCoordinator.repositories.moviesRepository as! MockMoviesRepository
    }()
    var sut: MoviesListViewModel!
    
    override func setUp() {
        mockAppCoordinator = MockAppCoordinator()
        sut = MoviesListViewModel(withCoordinator: mockAppCoordinator)
    }
    
    override func tearDown() {
        sut = nil
    }
    
    func testFetchNextPage() async {
        await sut.fetchNextPage()
        
        XCTAssertEqual(self.mockMoviesRepository.fetchNextPageCount, 1)
    }
    
    func testFilteredMovies() {
        self.mockMoviesRepository.movies = [
            Movie(
                id: 1,
                title: "Title 1",
                originalTitle: "Original Title 1",
                overview: "",
                releaseDate: "",
                genreIds: [],
                originalLanguage: "",
                posterPath: "",
                backdropPath: "",
                adult: false,
                video: false,
                popularity: 0.0,
                voteCount: 0,
                voteAverage: 0.0
            ),
            Movie(
                id: 1,
                title: "Title 2",
                originalTitle: "Original Title 2",
                overview: "",
                releaseDate: "",
                genreIds: [],
                originalLanguage: "",
                posterPath: "",
                backdropPath: "",
                adult: false,
                video: false,
                popularity: 0.0,
                voteCount: 0,
                voteAverage: 0.0
            )
        ]
        
        var result = sut.filteredMovies(searchText: "Title")
        XCTAssertEqual(result.count, 2)
        
        result = sut.filteredMovies(searchText: "Original Title 1")
        XCTAssertEqual(result.count, 1)
    }
}
