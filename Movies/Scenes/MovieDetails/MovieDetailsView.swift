import SwiftUI
import CachedAsyncImage

struct MovieDetailsView: View {
    @StateObject var viewModel: MovieDetailsViewModel
    
    var body: some View {
        ScrollView {
            VStack(spacing: 20) {
                CachedAsyncImage(url: viewModel.movie.posterURL(size: .w185), content: { image in
                    image
                        .resizable()
                        .scaledToFit()
                        .frame(width: 185)
                }, placeholder: {
                    Image("placeholder")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 185)
                })
                VStack {
                    VStack(alignment: .leading) {
                        Text(viewModel.movie.originalTitle ?? "")
                            .font(.system(size: 18, weight: .bold))
                            .foregroundStyle(Color(.darkText))
                            .padding(.top, 4)
                        Text(viewModel.movie.title ?? "")
                            .font(.system(size: 18, weight: .medium))
                            .foregroundStyle(Color(.gray))
                        Text("Released: \(viewModel.movie.releaseDate ?? "")")
                            .font(.system(size: 16, weight: .heavy))
                            .foregroundStyle(Color(.systemBlue))
                            .padding(.top, 1)
                        Text(viewModel.movie.overview ?? "")
                            .font(.system(size: 14))
                            .foregroundStyle(Color(.darkGray))
                            .padding(.top, 1)
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(8)
                    .background(Color(.yellow.withAlphaComponent(0.25)))
                    .border(Color(.lightGray), width: 1)
                }
                .frame(maxWidth: .infinity)
                .padding(.horizontal, 20)
                if (viewModel.movie.backdropPath != nil) {
                    CachedAsyncImage(url: viewModel.movie.backdropURL(size: .w500), content: { image in
                        image
                            .resizable()
                            .scaledToFit()
                            .frame(maxWidth: .infinity)
                            .padding(.horizontal, 20)
                    }, placeholder: {
                        ProgressView()
                            .frame(maxWidth: .infinity, maxHeight: .infinity)
                    })
                }
            }
        }
    }
}

#Preview {
    MovieDetailsView(viewModel: .init(withCoordinator: nil, movie: .preview))
}
