//
//  Movies.swift
//  netflix
//
//  Created by Nirmal Koirala on 05/07/2022.
//

import Foundation

struct TrendingTitleResponse: Codable {
    
    let results: [Title]
    
}


struct Title: Codable {
    let id: Int
    let media_type: String?
    let original_name: String?
    let original_title: String?
    let poster_path: String?
    let overview: String?
    let vote_count: Int
    let release_date: String?
    let vote_average: Double
    
    
    
    
    
}

/*
 {
adult = 0;
"backdrop_path" = "/yQTQL9pliY6vpRt8HkjUJrKymBb.jpg";
"first_air_date" = "2022-06-30";
"genre_ids" =             (
 10759,
 18
);
id = 120911;
"media_type" = tv;
name = "The Terminal List";
"origin_country" =             (
 US
);
"original_language" = en;
"original_name" = "The Terminal List";
overview = "Navy SEAL Commander James Reece turns to vengeance as he investigates the mysterious forces behind the murder of his entire platoon. Free from the military\U2019s command structure, Reece applies the lessons he\U2019s learned from nearly two decades of warfare to hunt down the people responsible.";
popularity = "609.972";
"poster_path" = "/71f3JHlJCP6V7LhHHiKZgjtFxZw.jpg";
"vote_average" = "8.942";
"vote_count" = 78;
}
 */
