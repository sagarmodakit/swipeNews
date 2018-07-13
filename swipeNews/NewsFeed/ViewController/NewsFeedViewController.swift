//
//  NewsFeedViewController.swift
//  swipeNews
//
//  Created by webwerks on 09/07/18.
//  Copyright © 2018 webwerks. All rights reserved.
//

import UIKit
import Koloda
import SDWebImage

class NewsFeedViewController: UIViewController {

    @IBOutlet weak var newsSwipeView: KolodaView!
    @IBOutlet weak var titleLabel: UILabel!
    
    var imageArray : [String] = []
    
    var titleArray : [String] = []
    
    var modelObject : NewsFeedViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("hello")
        // Do any additional setup after loading the view.
        
        imageArray = ["pdf","excel","pdf","excel","pdf"]
        
        titleArray = ["hello","hi","hmmm","ha ha", "hey"]
        modelObject = NewsFeedViewModel()
        
        apiFetchNewsWithParameters(searchString: nil)
    }
    
    func configureNewsSwipView(){
        newsSwipeView.delegate = self
        newsSwipeView.dataSource = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    
    func apiFetchNewsWithParameters(searchString:String?){
        
        APP_UTILS.showHUD()
        modelObject.fetchNewsWithParameters(searchString: searchString, completion: {(status) in
            
            if status == kStatusOK {
                self.configureNewsSwipView()
                self.newsSwipeView.reloadData()
            }
            
            else {
                print("no data")
            }
        })
        
    }

}

extension NewsFeedViewController : KolodaViewDelegate{
    
    func kolodaDidRunOutOfCards(_ koloda: KolodaView) {
        print("end of cards")
    }
    
    func koloda(_ koloda: KolodaView, didSelectCardAt index: Int) {
        print("selected index :\(index)")
    }
    
}

extension NewsFeedViewController : KolodaViewDataSource {
    
    func kolodaNumberOfCards(_ koloda: KolodaView) -> Int {
        return modelObject.numberOfCards()
    }
    
    func kolodaSpeedThatCardShouldDrag(_ koloda: KolodaView) -> DragSpeed {
        return .default
    }
    
    func koloda(_ koloda: KolodaView, viewForCardAt index: Int) -> UIView {
        
        var newsView : NewsCardView!
        newsView = Bundle.main.loadNibNamed("NewsCardView", owner: self, options: nil)?[0] as? NewsCardView
        
        let newsData = modelObject.newsForCard(ind: index)
        
        
        if let imageUrlString = newsData.imageUrl {
            newsView.newsImageView.sd_setImage(with: URL(string: imageUrlString), placeholderImage: UIImage(named: "newsPlaceholder"), options: SDWebImageOptions.refreshCached, completed: nil)
        }else{
            newsView.newsImageView.image = UIImage(named: "newsPlaceholder")
        }
        if let titleString = newsData.title {
            newsView.newsTitleLabel.text = titleString
        }
        
        if let descriptionTitle = newsData.description {
            newsView.newsDescription.text = descriptionTitle
        }
        
        if let sourceString = newsData.source?.sourceName {
            newsView.sourceLabel.text = "Source: \(sourceString)"
        }
        
        return newsView
        
    }
    
    func koloda(_ koloda: KolodaView, viewForCardOverlayAt index: Int) -> OverlayView? {
        return Bundle.main.loadNibNamed("OverlayView", owner: self, options: nil)?[0] as? OverlayView
    }
    
}


