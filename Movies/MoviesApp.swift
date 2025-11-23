import SwiftUI

@main
struct MoviesApp: App {
    let repositories: Repositories = {
        let apiClient = APIClient()
        let moviesRepository = MoviesRepository(apiClient: apiClient)
        return Repositories(moviesRepository: moviesRepository)
    }()

    let appCoordinator: AppCoordinator
    
    init () {
        appCoordinator = AppCoordinator(withRepositories: repositories)
    }
    
    var body: some Scene {
        WindowGroup {
            appCoordinator.rootView
        }
    }
}
