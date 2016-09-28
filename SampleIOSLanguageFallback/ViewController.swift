//
//  ViewController.swift
//  SampleIOSLanguageFallback
//
//  Created by Yukie Hori on 2016/09/28.
//  Copyright © 2016年 moko. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var deviceLanguage: UILabel!
    @IBOutlet weak var deviceLanguages: UILabel!
    @IBOutlet weak var appSelectedLanguage: UILabel!
    @IBOutlet weak var appSelectedLanguages: UILabel!
    @IBOutlet weak var appLanguages: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let deviceLanguagesFromLocale = NSLocale.preferredLanguages
        let appSelectedLanguagesFromBundle = Bundle.main.preferredLocalizations
        let appLanguagesFromBundle = Bundle.main.localizations
        
        deviceLanguage.text = deviceLanguagesFromLocale.first
        
        var languagesString = ""
        let _ = deviceLanguagesFromLocale.enumerated().map { offset, string in
            languagesString += string
            if offset != deviceLanguagesFromLocale.count - 1 {
                languagesString += "\n"
            }
        }
        deviceLanguages.text = languagesString
        
        appSelectedLanguage.text = appSelectedLanguagesFromBundle.first
        
        var appSelectedLanguagesString = ""
        let _ = appSelectedLanguagesFromBundle.enumerated().map { offset, string in
            appSelectedLanguagesString += string
            if offset != appSelectedLanguagesFromBundle.count - 1 {
                appSelectedLanguagesString += "\n"
            }
        }
        appSelectedLanguages.text = appSelectedLanguagesString
        
        var appLanguagesString = ""
        appLanguagesFromBundle.forEach { (string) in
            appLanguagesString += "\(string)\n"
        }
        appLanguages.text = appLanguagesString
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}

