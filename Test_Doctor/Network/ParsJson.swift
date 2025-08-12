//
//  ParsJson.swift
//  Test_Doctor
//
//  Created by Ruslan Medetbayev on 06.08.2025.
//

import Foundation

func loadJSONFromBundle<T: Decodable>(_ filename: String, as type: T.Type) -> T? {
    guard let url = Bundle.main.url(forResource: filename, withExtension: "json") else {
        print("Файл \(filename).json не найден в Bundle")
        return nil
    }

    do {
        let data = try Data(contentsOf: url)
        let decoder = JSONDecoder()
        let decodedData = try decoder.decode(T.self, from: data)
        return decodedData
    } catch {
        print("Ошибка при чтении/декодировании файла: \(error)")
        return nil
    }
}
