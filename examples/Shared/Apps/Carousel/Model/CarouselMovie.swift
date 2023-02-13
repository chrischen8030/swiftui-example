//
//  Movie.swift
//  Carousel (iOS)
//
//  Created by Balaji on 10/07/21.
//

import SwiftUI

// Data Model And Sample Data....
struct CarouselMovie: Identifiable{
    var id = UUID().uuidString
    var movieName: String
    var artwork: String
}

var carouselmovies = [

    CarouselMovie(movieName: "Black Widow", artwork: "Carouselpost1"),
    CarouselMovie(movieName: "Loki", artwork: "Carouselpost2"),
    CarouselMovie(movieName: "Wanda Vision", artwork: "Carouselpost3"),
    CarouselMovie(movieName: "The Falcon and the Winter Soldier", artwork: "Carouselpost4"),
    CarouselMovie(movieName: "Mulan", artwork: "Carouselpost5"),
    CarouselMovie(movieName: "Endgame", artwork: "Carouselpost6"),
    CarouselMovie(movieName: "Age of Ultron", artwork: "Carouselpost7"),
]
