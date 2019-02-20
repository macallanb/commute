//
//  HomeController.swift
//  iOS-Commute
//
//  Created by Macallan Brown on 2/18/19.
//  Copyright © 2019 com.macallanbrown. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let jsonURLString = "https://ecocommute.herokuapp.com/transportation-types"
        guard let url = URL(string: jsonURLString) else { return }
        
        URLSession.shared.dataTask(with: url) {(data, response, error) in
            
            guard let data = data else { return }
            
            do {
                if let json = try JSONSerialization.jsonObject(with: data) as? [String: String] {
                    print(json)
                }
            } catch let parseError {
                print("parsing error: \(parseError)")
                let responseString = String(data: data, encoding: .utf8)
                print("raw response: \(responseString)")
            }
        }.resume()
    }
}

