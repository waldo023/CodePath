//
//  MovieDetailsViewController.swift
//  Flix
//
//  Created by Osvaldo Vallejo Zamora on 7/4/21.
//

import UIKit
import AlamofireImage


class MovieDetailsViewController: UIViewController {

    var movie: [String:Any]!
    
    
    
    @IBOutlet weak var backDropView: UIImageView!
    @IBOutlet weak var posterView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var synopsisLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        let title = movie["title"] as! String
        let synopsis = movie["overview"] as! String
        let date = movie["release_date"] as! String
        
        let baseUrl = "https://image.tmdb.org/t/p/"
        
        let posterPath = movie["poster_path"] as! String
        let posterWidth = "w185"
        
        let backDropPath = movie["backdrop_path"] as! String
        let backDropWidth = "w500"
        
        let posterUrl = URL(string: baseUrl + posterWidth + posterPath)
        let backDropUrl = URL(string: baseUrl + backDropWidth + backDropPath)
        
        self.posterView.af.setImage(withURL: posterUrl!)
        self.backDropView.af.setImage(withURL: backDropUrl!)
        self.titleLabel.text = title
        self.dateLabel.text = date
        self.synopsisLabel.text = synopsis
        
    }


    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        let trailerViewController = segue.destination as! TrailerViewController
        trailerViewController.movie = self.movie
    }
    

}
