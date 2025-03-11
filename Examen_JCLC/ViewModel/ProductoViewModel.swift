//
//  ProductoViewModel.swift
//  Examen_JCLC
//
//  Created by Jose Carlos Luque Castro on 11/3/25.
//
import Foundation
import Combine

class ProcuctoViewModel: ObservableObject {
    @Published var productos: [Producto] = []
    @Published var searchText: String = ""

    private let apiService = APIService()
    private var cancellables = Set<AnyCancellable>()

    init() {
        //fetchAllProducts()
        
        // Filtrado de películas en tiempo real
        $searchText
            .debounce(for: .milliseconds(500), scheduler: RunLoop.main)
            .sink { [weak self] searchText in
                self?.filterMovies(with: searchText)
            }
            .store(in: &cancellables)
    }
    
    func fetcProductos() {
        apiService.fetchAllProducts() { [weak self] result in
            switch result {
            case .success(let products):
                self?.movies = movies
            case .failure(let error):
                print("Error fetching movies: \(error)")
            }
        }
    }

  
}
