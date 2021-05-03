//
//  ContentView.swift
//  P16C HotProspects
//
//  Created by Julian Moorhouse on 03/05/2021.
//

import SwiftUI

enum NetworkError: Error {
    case badURL, requestFailed, unknown
}

struct ContentView: View {
    var body: some View {
        Text("Hello, world!")
            .onAppear {
                // First example
//                let url = URL(string: "https://www.apple.com")!
//                URLSession.shared.dataTask(with: url) { data, response, error in
//                    if data != nil {
//                        print("We got data!")
//                    } else if let error = error {
//                        print(error.localizedDescription)
//                    }
//                }.resume()

                // Fifth example - usage
                self.fetchData(from: "https://www.apple.com") { result in
                    switch result {
                    case .success(let str):
                        print(str)
                    case .failure(let error):
                        switch error {
                        case .badURL:
                            print("Bad URL")
                        case .requestFailed:
                            print("Network problems")
                        case .unknown:
                            print("Unknown error")
                        }
                    }
                }
            }
    }

    // Second example
//    func fetchData(from urlString: String) -> Result<String, NetworkError> {
//        .failure(.badURL)
//    }

    // Third example
//    func fetchData(from urlString: String, completion: (Result<String, NetworkError>) -> Void) {
//        completion(.failure(.badURL))
//    }

    // Fourth example
//    func fetchData(from urlString: String, completion: @escaping (Result<String, NetworkError>) -> Void) {
//        DispatchQueue.main.async {
//            completion(.failure(.badURL))
//        }
//    }

    // Fifth example
    func fetchData(from urlString: String, completion: @escaping (Result<String, NetworkError>) -> Void) {
        guard let url = URL(string: urlString) else {
            completion(.failure(.badURL))
            return
        }

        URLSession.shared.dataTask(with: url) { data, _, error in
            DispatchQueue.main.async {
                if let data = data {
                    let stringData = String(decoding: data, as: UTF8.self)
                    completion(.success(stringData))
                } else if error != nil {
                    completion(.failure(.requestFailed))
                } else {
                    completion(.failure(.unknown))
                }
            }
        }.resume()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
