import UIKit

private let kImageBaseURL = "https://image.tmdb.org/t/p"

struct Movie: Decodable, Equatable, Identifiable {
    enum ImageSize: String {
        case w92, w185, w500, w780
    }

    let id: Int
    let title: String?
    let originalTitle: String?
    let overview: String?
    let releaseDate: String?
    let genreIds: [Int]
    let originalLanguage: String?
    let posterPath: String?
    let backdropPath: String?
    let adult: Bool
    let video: Bool
    let popularity: Double
    let voteCount: Int
    let voteAverage: Double
    
    enum CodingKeys: String, CodingKey {
        case id
        case title
        case originalTitle = "original_title"
        case overview
        case releaseDate = "release_date"
        case genreIds = "genre_ids"
        case originalLanguage = "original_language"
        case posterPath = "poster_path"
        case backdropPath = "backdrop_path"
        case adult
        case video
        case popularity
        case voteCount = "vote_count"
        case voteAverage = "vote_average"
    }
    
    func posterURL(size: ImageSize = .w92) -> URL? {
        guard let posterPath else { return nil }
        
        return URL(string: kImageBaseURL)?.appendingPathComponent(size.rawValue).appendingPathComponent(posterPath)
    }
    
    func backdropURL(size: ImageSize = .w92) -> URL? {
        guard let backdropPath else { return nil }
        
        return URL(string: kImageBaseURL)?.appendingPathComponent(size.rawValue).appendingPathComponent(backdropPath)
    }
}
