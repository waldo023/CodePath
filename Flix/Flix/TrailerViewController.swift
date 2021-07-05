//
//  TrailerViewController.swift
//  Flix
//
//  Created by Osvaldo Vallejo Zamora on 7/5/21.
//

import UIKit
import WebKit

class TrailerViewController: UIViewController,WKUIDelegate {

    var movie: [String:Any]!
    
    @IBOutlet weak var webView: WKWebView!
    

    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.

        let baseUrl = "https://api.themoviedb.org/3/movie/"
        let movieID = movie["id"] as! Int
        
        let url = URL(string: baseUrl + String(movieID)+"/videos?api_key=a07e22bc18f5cb106bfe4cc1f83ad8ed&language=en-US")!
        let request = URLRequest(url: url, cachePolicy: .reloadIgnoringLocalCacheData, timeoutInterval: 10)
        let session = URLSession(configuration: .default, delegate: nil, delegateQueue: OperationQueue.main)
        let task = session.dataTask(with: request) { (data, response, error) in
             // This will run when the network request returns
             if let error = error {
                    print(error.localizedDescription)
             } else if let data = data {
                let dataDictionary = try! JSONSerialization.jsonObject(with: data, options: []) as! [String: Any]

               
                let trailers = dataDictionary["results"] as! [[String:Any]]
                let key = trailers[0]["key"] as! String
                
                let trailerUrl = URL(string:"https://www.youtube.com/watch?v=" + key)
                let trailerRequest = URLRequest(url: trailerUrl!)
                
                self.webView.load(trailerRequest)
                
             }
        }
        task.resume()
        
    }
    

    
    @IBAction func closeView(_ sender: UITapGestureRecognizer) {
        dismiss(animated: true, completion: nil)
    }
    
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
