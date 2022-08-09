//
//  ViewController.swift
//  Alamofire Testing
//
//  Created by Hamza Rafique Azad on 9/8/22.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var textView: UITextView!
    
    private let networkingClient = NetworkingClient()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func executeButton(_ sender: UIButton) {
        guard let urlToExecute = URL(string: "https://jsonplaceholder.typicode.com/posts") else { return }
        
        networkingClient.execute(urlToExecute) { (json, error) in
            if let error = error {
                self.textView.text = error.localizedDescription
            } else if let json = json {
                self.textView.text = json.description
            }
        }
    }
    
}

