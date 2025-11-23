import SwiftUI

struct MovieSuggestionRow: View {
    var movie: Movie
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(movie.originalTitle ?? "")
                .font(.system(size: 18, weight: .bold))
                .foregroundStyle(Color(.darkText))
                .lineLimit(1)
                .searchCompletion(movie.originalTitle ?? "")
            Text(movie.title ?? "")
                .font(.system(size: 18, weight: .heavy))
                .foregroundStyle(Color(.gray))
                .lineLimit(1)
                .searchCompletion(movie.title ?? "")
        }
    }
}

#Preview {
    MovieRow(movie: .preview)
}

