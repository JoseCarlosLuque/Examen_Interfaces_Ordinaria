//
//  ContentView.swift
//  Examen_JCLC
//
//  Created by Jose Carlos Luque Castro on 11/3/25.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        // Cargo la vista de lista de productos.
        NavigationStack {
            VistaListaProductos()
        }
    }
}

#Preview {
    ContentView()
}
