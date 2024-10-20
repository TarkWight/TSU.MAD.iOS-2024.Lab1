//
//  MovieElementModel.swift
//  ClientAPI
//
//  Created by Tark Wight on 14.10.2024.
//
import Foundation



public struct MovieElementModel: Codable {

    public var id: UUID?
    public var name: String?
    public var poster: String?
    public var year: Int?
    public var country: String?
    public var genres: [GenreModel]?
    public var reviews: [ReviewShortModel]?

    public init(
        id: UUID? = nil,
        name: String? = nil,
        poster: String? = nil,
        year: Int? = nil,
        country: String? = nil,
        genres: [GenreModel]? = nil,
        reviews: [ReviewShortModel]? = nil
    ) {
        self.id = id
        self.name = name
        self.poster = poster
        self.year = year
        self.country = country
        self.genres = genres
        self.reviews = reviews
    }


}
