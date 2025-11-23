import XCTest
@testable import Movies

class MoviesRepositoryTests: XCTestCase {
    var mockAPIClient: MockAPIClient!
    var sut: MoviesRepository!

    override func setUp() {
        mockAPIClient = MockAPIClient()
        sut = MoviesRepository(apiClient: mockAPIClient)
    }

    override func tearDown() {
        sut = nil
    }

    func testRequestMovies() {
        let exp = expectation(description: "Movies fetched")
        sut.fetchNextPage { [weak self] result in
            guard let `self` = self else { return }
            
            switch result {
            case .success:
                self.assert(movies: self.sut.movies)
            case .failure:
                XCTFail()
            }
            exp.fulfill()
        }
        waitForExpectations(timeout: 1.0)
    }

    private func assert(movies: [Movie]) {
        XCTAssertEqual(movies.count, 2)

        XCTAssertEqual(movies[0].id, 1549787)
        XCTAssertEqual(movies[0].title, "Tokyo Override")
        XCTAssertEqual(movies[0].originalTitle, "Tokyo Override")
        XCTAssertEqual(movies[0].overview, "When a lonely hacker gets entangled with a group of underground couriers, they uncover the dark truth lurking beneath Tokyo's seemingly perfect facade.")
        XCTAssertEqual(movies[0].releaseDate, "2024-11-21")
        XCTAssertEqual(movies[0].genreIds, [878, 28, 16])
        XCTAssertEqual(movies[0].originalLanguage, "ja")
        XCTAssertEqual(movies[0].posterPath, "/h18XFv1XbRD5ajjBbC0hsr7c1PR.jpg")
        XCTAssertEqual(movies[0].backdropPath, "/d1Ivfiy7ehT6HDYWcmPCbMVFM2.jpg")
        XCTAssertEqual(movies[0].adult, false)
        XCTAssertEqual(movies[0].video, false)
        XCTAssertEqual(movies[0].popularity, 1.7439)
        XCTAssertEqual(movies[0].voteCount, 23)
        XCTAssertEqual(movies[0].voteAverage, 6.5)

        XCTAssertEqual(movies[1].id, 1470901)
        XCTAssertEqual(movies[1].title, "Retro Images")
        XCTAssertEqual(movies[1].originalTitle, "Imágenes Retro")
        XCTAssertEqual(movies[1].overview, "When hope seems to vanish, what afflicts them becomes stronger and among so many memories connects them with the same invisible thread that guides them in their redemption. Samara, Rubi and Sebastian face their own reflection...")
        XCTAssertEqual(movies[1].releaseDate, "2024-12-31")
        XCTAssertEqual(movies[1].genreIds, [53])
        XCTAssertEqual(movies[1].originalLanguage, "es")
        XCTAssertEqual(movies[1].posterPath, "/4TyOFzXxPX8XmpboYMHe3yAl9ye.jpg")
        XCTAssertEqual(movies[1].backdropPath, "/gfvEioIiXOHFARBkwPSoFjnSmNZ.jpg")
        XCTAssertEqual(movies[1].adult, false)
        XCTAssertEqual(movies[1].video, false)
        XCTAssertEqual(movies[1].popularity, 0.0168)
        XCTAssertEqual(movies[1].voteCount, 99)
        XCTAssertEqual(movies[1].voteAverage, 7.25)
    }
}
