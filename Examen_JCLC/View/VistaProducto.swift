//
//  VistaProducto.swift
//  Examen_JCLC
//
//  Created by Jose Carlos Luque Castro on 11/3/25.
//

import SwiftUI

struct VistaProducto: View {
    // Se le pasa un producto:
    let producto: Producto
    var body: some View {
        VStack {
            AsyncImage(url:producto.posterURL) { image in
                            image.resizable()
                                .aspectRatio(contentMode: .fill)
                        } placeholder: {
                            ProgressView()
                        }
                        .frame(height: 200)
                        .cornerRadius(12)
                        .shadow(radius: 5)

            Text(producto.title)
                            .font(.headline)
                            .foregroundColor(.primary)
                            .multilineTextAlignment(.center)
                            .padding(.horizontal, 4)
                            .lineLimit(2)
                        
                        // ✅ Géneros en lugar de la Fecha
            Text(producto.description)
                            .font(.caption)
                            .foregroundColor(.gray)
                            .padding(.horizontal, 8)
                            .padding(.vertical, 4)
                            .background(Color(.systemGray5))
                            .cornerRadius(10)
                            .padding(.bottom, 8)
                    }
                    .background(Color(.systemBackground))
                    .cornerRadius(12)
                    .shadow(radius: 3)
    }
}


