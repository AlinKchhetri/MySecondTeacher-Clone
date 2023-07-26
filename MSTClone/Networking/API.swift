//
//  API.swift
//  MST
//
//  Created by Alin Khatri on 24/06/2023.
//

import Foundation

class API {
    // Function to make the user login API call
    func loginUser(request: LoginUserRequest, completion: @escaping (Result<ServerResponse, Error>) -> Void) {
        // Create the URL request for the login endpoint
        guard let url = URL(string: "https://parkpin-server.cyclic.app/api/v1/login") else {
            completion(.failure(NetworkError.invalidURL))
            return
        }
        
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = "POST"
        
        do {
            // Encode the login request body as JSON data
            let jsonData = try JSONEncoder().encode(request)
            urlRequest.httpBody = jsonData
            urlRequest.setValue("application/json", forHTTPHeaderField: "Content-Type")
            
            // Perform the API call
            URLSession.shared.dataTask(with: urlRequest) { data, response, error in
                if let error = error {
                    // Handle network errors
                    completion(.failure(error))
                    return
                }
                
                if let data = data {
                    do {
                        // Parse the server response
                        let serverResponse = try JSONDecoder().decode(ServerResponse.self, from: data)
                        completion(.success(serverResponse))
                    } catch {
                        // Handle parsing errors
                        completion(.failure(error))
                    }
                } else {
                    completion(.failure(NetworkError.noData))
                }
            }.resume()
        } catch {
            // Handle encoding errors
            completion(.failure(error))
        }
    }
    
    func logoutUser(completion: @escaping (Result<Void, Error>) -> Void) {
        // Create the URL for the logout endpoint
        guard let url = URL(string: "https://parkpin-server.cyclic.app/api/v1/logout") else {
            let error = NSError(domain: "", code: 0, userInfo: [NSLocalizedDescriptionKey: "Invalid URL"])
            completion(.failure(error))
            return
        }
        
        // Create the URLSessionDataTask for the logout request
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        
        let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
            if let error = error {
                completion(.failure(error))
                return
            }
            
            // Check the HTTP response status code
            guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
                let error = NSError(domain: "", code: 0, userInfo: [NSLocalizedDescriptionKey: "Invalid HTTP response"])
                completion(.failure(error))
                return
            }
            
            // Successful logout, no response data is expected
            
            completion(.success(()))
        }
        
        // Start the URLSessionDataTask
        task.resume()
    }
}

// Possible network errors
enum NetworkError: Error {
    case invalidURL
    case noData
}
