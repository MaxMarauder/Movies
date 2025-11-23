import Foundation

struct APIPayload {
    
    struct MovieDiscover: Decodable {
        let page: Int
        let totalPages: Int
        let totalResults: Int
        let results: [Movie]
        
        enum CodingKeys: String, CodingKey {
            case page
            case totalPages = "total_pages"
            case totalResults = "total_results"
            case results
        }
    }
}
