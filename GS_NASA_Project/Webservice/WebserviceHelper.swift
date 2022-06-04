//
//  WebserviceHelper.swift
//  GS_NASA_Project
//
//  Created by Aishwarya Rai on 04/06/22.
//

import Foundation

class WebserviceHelper {
    var urlSession: URLSession?
    static let shared = WebserviceHelper()
    
    func getData(dateStr: String, completionHandler: @escaping (APIResponse?, Error?) -> Void) {
        let selectedDateStr = "&date=" + dateStr
        let finalURLStr = Constants.baseURL + Constants.kNASAAPIKey + selectedDateStr
        guard let nasaURL = URL(string: finalURLStr) else { return }
        var urlRequest = URLRequest(url: nasaURL)
        urlRequest.httpMethod = "GET"
        let urlSession = URLSession(configuration: .default)
        let getDataTask = urlSession.dataTask(with: urlRequest) { data, response, error in
            if response != nil {
                do {
                    let decoder = JSONDecoder.init()
                    let jsonObject = try decoder.decode(APIResponse.self, from: data ?? Data())
                    print("SUCCESS = ", jsonObject)
                    completionHandler(jsonObject, nil)
                } catch {
                    
                    print("EROR =" , error.localizedDescription)
                    completionHandler(nil, error)
                }
            }
        }
        getDataTask.resume()
    }
    
    func fetchImageData(imageUrl: String?, onCompletion: @escaping (Data?, Error?) -> ()) {
        if let url = URL(string: imageUrl ?? "") {
            let getDataTask = URLSession.shared.dataTask(with: url, completionHandler: { data, response, error in
                guard let data = data, error == nil else { return }
                onCompletion(data, error)
            })
            getDataTask.resume()
        }
    }
}
