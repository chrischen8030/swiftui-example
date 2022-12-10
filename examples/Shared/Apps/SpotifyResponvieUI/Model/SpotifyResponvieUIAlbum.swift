//
//  Album.swift
//  SpotifyResponvieUI (iOS)
//
//  Created by Balaji on 15/03/22.
//

import SwiftUI

// MARK: Album Model and Sample Data
struct SpotifyResponvieUIAlbum: Identifiable{
    var id = UUID().uuidString
    var albumName: String
    var albumImage: String
    var isLiked: Bool = false
}

var spotifyResponvieUIalbums: [SpotifyResponvieUIAlbum] = [

    SpotifyResponvieUIAlbum(albumName: "Positions", albumImage: "SpotifyResponvieUIAlbum1"),
    SpotifyResponvieUIAlbum(albumName: "The Best", albumImage: "SpotifyResponvieUIAlbum2",isLiked: true),
    SpotifyResponvieUIAlbum(albumName: "My Everything", albumImage: "SpotifyResponvieUIAlbum3"),
    SpotifyResponvieUIAlbum(albumName: "Yours Truly", albumImage: "SpotifyResponvieUIAlbum4"),
    SpotifyResponvieUIAlbum(albumName: "Sweetener", albumImage: "SpotifyResponvieUIAlbum5",isLiked: true),
    SpotifyResponvieUIAlbum(albumName: "Rain On Me", albumImage: "SpotifyResponvieUIAlbum6"),
    SpotifyResponvieUIAlbum(albumName: "Stuck With U", albumImage: "SpotifyResponvieUIAlbum7"),
    SpotifyResponvieUIAlbum(albumName: "7 rings", albumImage: "SpotifyResponvieUIAlbum8",isLiked: true),
    SpotifyResponvieUIAlbum(albumName: "Bang Bang", albumImage: "SpotifyResponvieUIAlbum9"),
]
