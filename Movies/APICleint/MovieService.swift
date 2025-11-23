import Foundation

private let dateFormatter = {
    var formatter = DateFormatter()
    formatter.dateFormat = "yyyy-MM-dd"
    return formatter
}()

class MovieDiscover: Resource {
    typealias Payload = APIPayload.MovieDiscover

    let page: Int
    let primaryReleaseDateLTE: Date
    
    init(page: Int, primaryReleaseDateLTE: Date) {
        self.page = page
        self.primaryReleaseDateLTE = primaryReleaseDateLTE
    }
    
    static var endpoint: String {
        return "3/discover/movie"
    }
    
    var queryItems: [URLQueryItem]? {
        return [
            URLQueryItem(name: "api_key", value: kAPIKey),
            URLQueryItem(name: "page", value: "\(page)"),
            URLQueryItem(name: "primary_release_date.lte", value: dateFormatter.string(from: primaryReleaseDateLTE)),
            URLQueryItem(name: "sort_by", value: "primary_release_date.desc"),
        ]
    }
}
