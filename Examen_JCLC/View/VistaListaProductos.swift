//
//  VistaListaProductos.swift
//  Examen_JCLC
//
//  Created by Jose Carlos Luque Castro on 11/3/25.
//

import SwiftUI

struct VistaListaProductos: View {
    
    @StateObject private var viewModel = ProductoViewModel()
    
    let columns = [
            GridItem(.flexible(), spacing: 16),
            GridItem(.flexible(), spacing: 16)
        ]
    
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
                                    VistaProducto(producto: Producto)
                                    .buttonStyle(PlainButtonStyle()) // Evita resaltado feo en clics
                                }
                            }
                            .padding()
    }
}

#Preview {
    VistaListaProductos()
}
