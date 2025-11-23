import SwiftUI
import CachedAsyncImage

struct MovieRow: View {
    var movie: Movie
    
    var body: some View {
        HStack(alignment: .top) {
            CachedAsyncImage(url: movie.posterURL(), content: { image in
                image
                    .resizable()
                    .scaledToFit()
                    .frame(width: 92)
            }, placeholder: {
                Image("placeholder")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 92)
            })
            VStack(alignment: .leading) {
                Text(movie.originalTitle ?? "")
                    .font(.system(size: 18, weight: .bold))
                    .foregroundStyle(Color(.darkText))
                    .padding(.top, 4)
                    .lineLimit(1)
                Text(movie.title ?? "")
                    .font(.system(size: 18, weight: .medium))
                    .foregroundStyle(Color(.gray))
                    .lineLimit(1)
                Text("Released: \(movie.releaseDate ?? "")")
                    .font(.system(size: 16, weight: .heavy))
                    .foregroundStyle(Color(.systemBlue))
                    .lineLimit(1)
                    .padding(.top, 1)
                Text(movie.overview ?? "")
                    .font(.system(size: 14))
                    .foregroundStyle(Color(.darkGray))
                    .lineLimit(4)
                    .padding(.top, 1)
            }
            .padding(.leading, 8)
            Spacer()
        }
    }
}

#Preview {
    MovieRow(movie: .preview)
}
