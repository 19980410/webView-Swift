//
//  ViewController.swift
//  webView
//
//  Created by poti on 2020/04/12.
//  Copyright © 2020 kaoru. All rights reserved.
//

import UIKit
import WebKit

//プロトコルを宣言 = WKNavigationDelegate
class ViewController: UIViewController, WKNavigationDelegate {

    //インスタンスにしただけで大きさ、何をロードするか、などが未定義
    var webView = WKWebView()
    
    var underView = WKWebView()
    
    @IBOutlet weak var indicator: UIActivityIndicatorView!
    @IBOutlet weak var toolBar: UIToolbar!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //----------webview----------------------------
        // 大きさ（どの位置に置くか）
        webView.frame = CGRect(x: 0, y: toolBar.frame.size.height, width: view.frame.size.width, height: (view.frame.size.height - toolBar.frame.size.height*2)/2)
        
        //this cord append wecview
        view.addSubview(webView)
        
        //何をロードするか
        webView.navigationDelegate = self
        let url = URL(string: "https://prokyou.com")
        
        let request = URLRequest(url: url!)
        webView.load(request)
        
        
        //-----------underniew----------------------------
        underView.frame = CGRect(x:0, y: webView.frame.size.height, width:
            view.frame.size.width, height: (view.frame.size.height - toolBar.frame.size.height*2)/2)
        
        view.addSubview(underView)
        
        underView.navigationDelegate = self
        let underUrl = URL(string: "https://youtube.com")
        let underRequest = URLRequest(url: underUrl!)
        underView.load(underRequest)
        
        
    }
    
    //start Load
    func webView(_ webView: WKWebView, didCommit navigation: WKNavigation!) {
        print("start read")
        indicator.startAnimating()
    }
    
    //finish Load
    
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        print("finish load")
        indicator.stopAnimating()
    }

    @IBAction func go(_ sender: Any) {
        webView.goForward()
    }
    @IBAction func back(_ sender: Any) {
        
        webView.goBack()
    }

}

