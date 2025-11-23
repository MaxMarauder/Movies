import SwiftUI

struct MoviesListView: View {
    @StateObject var viewModel: MoviesListViewModel
    
    @State var searchText: String = ""

    var body: some View {
        NavigationSplitView {
            List {
                ForEach(viewModel.filteredMovies(searchText: searchText), id: \.id) { movie in
                    NavigationLink {
                        viewModel.coordinator?.view(for: .movieDetails(movie: movie))
                    } label: {
                        MovieRow(movie: movie)
                    }
                }
                if searchText.isEmpty {
                    if viewModel.isLoading {
                        ProgressView()
                            .frame(maxWidth: .infinity)
                    } else {
                        ProgressView()
                            .frame(maxWidth: .infinity)
                            .onAppear {
                                Task { await viewModel.fetchNextPage() }
                            }
                    }
                }
            }
            .listStyle(.plain)
            .animation(.default, value: viewModel.filteredMovies(searchText: searchText))
            .navigationTitle("Latest Movies")
            .navigationBarTitleDisplayMode(.inline)
        } detail: {
            Text("Select a movie")
        }
        .searchable(text: $searchText)
        .searchSuggestions {
            if !searchText.isEmpty {
                ForEach(viewModel.filteredMovies(searchText: searchText), id: \.id) { movie in
                    NavigationLink {
                        viewModel.coordinator?.view(for: .movieDetails(movie: movie))
                    } label: {
                        MovieRow(movie: movie)
                    }
                }
            }
        }
    }
}

#Preview {
}
