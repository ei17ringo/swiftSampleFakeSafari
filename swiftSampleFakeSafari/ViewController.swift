//
//  ViewController.swift
//  swiftSampleFakeSafari
//
//  Created by Eriko Ichinohe on 2016/02/01.
//  Copyright © 2016年 Eriko Ichinohe. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var myWebView: UIWebView!

    @IBOutlet weak var myTextField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func viewWillAppear(animated: Bool) {
        // MARK:宿題2 ユーザーデフォルトからURLを取出して、表示する
        //ユーザデフォルトを用意する
        var myDefault = NSUserDefaults.standardUserDefaults()
        
        //データを読みだして
        var URLText = myDefault.stringForKey("URLText")
        
        //　文字列が入っていたらWebViewに表示する
        if let tmpStr = URLText{
            // URLリクエストを作って
            let myURL = NSURL(string: tmpStr)
            
            let myURLReq = NSURLRequest(URL: myURL!)
            myWebView.loadRequest(myURLReq)

        }
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func tapBtn(sender: UIButton) {
        
        // MARK:宿題3 何も入力されていない場合、アラートを出して入力を促す
        if myTextField.text == ""{
            //アラートを作る
            var alertController = UIAlertController(
                title: "URL", message: "何か文字を入力して下さい", preferredStyle: .Alert)
            
            //OKボタンを追加
            alertController.addAction(UIAlertAction(title: "OK", style: .Default, handler: {action in print("OK")}))
            
            //アラートを表示する
            presentViewController(alertController, animated: true, completion: nil)
            
            return
        }
        // MARK:宿題1 TextFieldに入力したアドレスのサイトをWebViewに表示
        // URLリクエストを作って
        let myURL = NSURL(string: myTextField.text!)
        
        let myURLReq = NSURLRequest(URL: myURL!)
        myWebView.loadRequest(myURLReq)
        
        //  MARK:宿題2　ユーザーデフォルトに保存
        //ユーザデフォルトを用意する
        var myDefault = NSUserDefaults.standardUserDefaults()
        
        //データを書きこんで
        myDefault.setObject(myTextField.text!, forKey: "URLText")
        
        //即反映させる
        myDefault.synchronize()

    }

    @IBAction func tapReturnKey(sender: UITextField) {
        
        //  MARK:宿題2（おまけ）　ユーザーデフォルトに保存
        
        //ユーザデフォルトを用意する
        var myDefault = NSUserDefaults.standardUserDefaults()
        
        //データを書きこんで
        myDefault.setObject(myTextField.text!, forKey: "URLText")
        
        //即反映させる
        myDefault.synchronize()
    }
}

