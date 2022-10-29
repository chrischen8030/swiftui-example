//
//  Album.swift
//  3DCardAnimation (iOS)
//
//  Created by Balaji on 21/03/22.
//

import SwiftUI

// MARK: Album Model and Sample Albums
struct DCardAlbum: Identifiable{
    var id = UUID().uuidString
    var albumName: String
    var albumImage: String
    var isLiked: Bool = false
}

// ZStack Albums
var stackAlbums: [DCardAlbum] = [
    DCardAlbum(albumName: "The Best", albumImage: "Album2"),
    DCardAlbum(albumName: "My Everything", albumImage: "Album3"),
    DCardAlbum(albumName: "Yours Truly", albumImage: "Album4"),
    DCardAlbum(albumName: "7 rings", albumImage: "Album8"),
]

var albums: [DCardAlbum] = [

    DCardAlbum(albumName: "The Best", albumImage: "Album2",isLiked: true),
    DCardAlbum(albumName: "My Everything", albumImage: "Album3"),
    DCardAlbum(albumName: "Yours Truly", albumImage: "Album4"),
    DCardAlbum(albumName: "Sweetener", albumImage: "Album5",isLiked: true),
    DCardAlbum(albumName: "Rain On Me", albumImage: "Album6"),
    DCardAlbum(albumName: "Stuck With U", albumImage: "Album7"),
    DCardAlbum(albumName: "7 rings", albumImage: "Album8",isLiked: true),
    DCardAlbum(albumName: "Bang Bang", albumImage: "Album9"),
]

