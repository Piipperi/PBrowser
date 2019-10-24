//
//  ViewController.swift
//  PBrowser
//
//  Created by Piipperi on 9.6.2018.
//  Copyright © 2018 Piipperi. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UISearchBarDelegate, UIWebViewDelegate {

    @IBOutlet weak var SearchBar: UISearchBar!
    @IBOutlet weak var WebView: UIWebView!
    
    @IBAction func Back(_ sender: Any) {
        if WebView.canGoBack{
            WebView.goBack()
        }
    }
    @IBAction func Next(_ sender: Any) {
        if WebView.canGoForward{
            WebView.goForward()
        }
    }
    @IBAction func Refresh(_ sender: Any) {
        WebView.reload()
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        SearchBar.resignFirstResponder()
        
        if let url = URL(string: SearchBar.text!) {
            WebView.loadRequest(URLRequest(url: url))
        }
        else {
            print ("ERROR")
        }
    }
    
    func webViewDidStartLoad(_ webView: UIWebView) {
        UIApplication.shared.isNetworkActivityIndicatorVisible = true
    }
    
    func webViewDidFinishLoad(_ webView: UIWebView) {
        UIApplication.shared.isNetworkActivityIndicatorVisible = false
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    
        WebView.loadRequest(URLRequest(url: URL(string: "https://www.google.com")!))
    
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

