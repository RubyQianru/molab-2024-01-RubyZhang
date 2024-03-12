//
//  GetDate.swift
//  Week05
//
//  Created by qianru zhang on 2024/3/11.
//

import Foundation

func getFileDate(for file: URL) -> Date {
    if let attributes = try? FileManager.default.attributesOfItem(atPath: file.path) as [FileAttributeKey: Any],
        let creationDate = attributes[FileAttributeKey.creationDate] as? Date {
        return creationDate
    } else {
        return Date()
    }
}
