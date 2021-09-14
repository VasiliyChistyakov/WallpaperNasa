//
//  NasaModel.swift
//  Nasa
//
//  Created by Чистяков Василий Александрович on 07.09.2021.
//

import Foundation

struct Nasa: Codable {
    let date: String
    let explanation: String
    let hdurl: String
    let media_type: String
    let service_version: String
    let title: String
    let url: String
}
