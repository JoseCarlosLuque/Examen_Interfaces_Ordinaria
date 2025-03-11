//
//  Producto.swift
//  Examen_JCLC
//
//  Created by Jose Carlos Luque Castro on 11/3/25.
//

import Foundation

struct ProductoResponse : Codable {
    let results: [Producto]
}

struct Producto: Codable, Identifiable {
    let id: Int
    let title: String
    let price: Float
    let description: String
    let category: String
    let image: String?

    /*
    enum CodingKeys: String, CodingKey {
        case id, title, overview
        case posterPath = "poster_path"
        case releaseDate = "release_date"
        case voteAverage = "vote_average"
        case genreIds = "genre_ids"
    }
    */
    // URL de la imagen del póster
    var posterURL: URL? {
        if let image = image { // ← Se asegura de que no sea nil
             return URL(string: "https://image.tmdb.org/t/p/w500\(image)")
         }
         return nil
     }
}
