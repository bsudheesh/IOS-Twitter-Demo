//
//  TweetsViewController.swift
//  Twitter Demo
//
//  Created by Sudheesh Bhattarai on 2/25/17.
//  Copyright © 2017 Sudheesh Bhattarai. All rights reserved.
//

import UIKit

class TweetsViewController: UIViewController,  UITableViewDataSource, UITableViewDelegate {

    
    @IBOutlet weak var tableView: UITableView!
    var tweets: [Tweet]!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        tableView.dataSource = self
        tableView.delegate = self
        
        
        TwitterClient.sharedInstance?.homeTimeLine(success: { (tweets: [Tweet]) -> () in
            self.tweets = tweets
            for tweet in tweets{
                print(tweet.text)
            }
        }, failure: { (error: NSError) -> () in
            print(error.localizedDescription)
        })

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func onLogoutButton(_ sender: Any) {
        TwitterClient.sharedInstance?.logOut()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        return 20
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{
        
        
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "TweetCell", for: indexPath as IndexPath) as! TweetsViewCell
        cell.tweetsLabel.text = "HI! This is not working"
        if(tweets != nil){
            let tweetsTemp = tweets[indexPath.row]
            cell.tweetsLabel.text = tweetsTemp.text as String!
            cell.tweetsLabel.sizeToFit()
        }
        else{
            print("Tweets are nill")
        }
        
        
        
        
        
        return cell
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
