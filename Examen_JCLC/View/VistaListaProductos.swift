//
//  VistaListaProductos.swift
//  Examen_JCLC
//
//  Created by Jose Carlos Luque Castro on 11/3/25.
//

import SwiftUI

struct VistaListaProductos: View {
    
    @StateObject private var viewModel = Producto
    var body: some View {
        // ✅ Search Bar Mejorada
                        TextField(" Buscar película...", text: $viewModel.searchText)
                            .padding(12)
                            .background(Color(.systemGray6))
                            .cornerRadius(12)
                            .padding(.horizontal)
                            .shadow(radius: 2)

                        // ✅ Grid de Películas
                        ScrollView {
                            LazyVGrid(columns: columns, spacing: 16) {
                                ForEach(viewModel.movies) { movie in
                                    NavigationLink(destination: MovieDetailView(movie: movie)) {
                                        MovieCardView(movie: movie)
                                    }
                                    .buttonStyle(PlainButtonStyle()) // Evita resaltado feo en clics
                                }
                            }
                            .padding()
    }
}

#Preview {
    VistaListaProductos()
}
