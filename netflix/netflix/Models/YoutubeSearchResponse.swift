//
//  YoutubeSearchResponse.swift
//  netflix
//
//  Created by Nirmal Koirala on 14/07/2022.
//

import Foundation




struct YoutubeSearchResponse: Codable {
    let item: [VideoElement]?
}


struct VideoElement: Codable {
    let id: IdVideoElement
}


struct IdVideoElement: Codable {
    let kind: String
    let videoId: String

}
