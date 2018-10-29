//
//  LanguageTools.swift
//  BaseProject
//
//  Created by David Galán on 29/10/2018.
//  Copyright © 2018 David Galán. All rights reserved.
//

import UIKit

// MARK: LANGUAGES CODES
enum LanguageCodeType: String {
    
    case cat = "ca-ES"
    case cas = "es"
    case eng = "en"
    
}

// MARK: VARIABLES
var bundleLanguage = Bundle()
var defaults = UserDefaults.standard
let appLanguages = [LanguageCodeType.eng/*, LanguageCodeType.cat, LanguageCodeType.cas*/]

// MARK: DEFAULTS REFERENCES
var languageCodeEdited: Bool {
    set {
        defaults.set(newValue, forKey: "languageCodeEdited")
    }
    get {
        return defaults.bool(forKey: "languageCodeEdited")
    }
}

var languageCodeApp: String {
    set {
        defaults.set(newValue, forKey: "languageCodeApp")
    }
    get {
        return defaults.string(forKey: "languageCodeApp") ?? LanguageCodeType.eng.rawValue
    }
}

// MARK: METHODS TO WORK
func getLocaleLanguage() -> String {
    return NSLocale.current.languageCode!
}

func setLanguage(key: String) -> String {
    return bundleLanguage.localizedString(forKey: key, value: nil, table: nil)
}

func setLanguagelUppercase(label: UILabel, keyText: String) {
    label.text = setLanguage(key: keyText).uppercased()
}

func setLanguageExtra(label: UILabel, keyText: String, extraText: String = "") {
    label.text = setLanguage(key: keyText) + extraText
}

func setBundleLanguage() {
    print("LanguageCodeApp-Initial: \(languageCodeApp)")
    
    controlInitialLanguage()
    controlCodes()
    
    print("LanguageCodeApp: \(languageCodeApp)")
    
    let path = Bundle.main.path(forResource: languageCodeApp, ofType: "lproj")
    bundleLanguage = Bundle(path: path!)!
}

func controlInitialLanguage() {
    print("LanguageCodeEdited: \(languageCodeEdited)")
    if !languageCodeEdited {
        let tempLanguageCodeApp = getLocaleLanguage()
        for language in appLanguages {
            if language.rawValue == tempLanguageCodeApp {
                languageCodeApp = language.rawValue
                break
            }
        }
    }
}

func controlCodes() {
    if languageCodeApp == "ca" {
        languageCodeApp = LanguageCodeType.cat.rawValue
    }
}

func getLanguageText(language: String) -> String {
    
    switch language {
    case LanguageCodeType.eng.rawValue:
        return setLanguage(key: "lang_english")
    case LanguageCodeType.cat.rawValue:
        return setLanguage(key: "lang_catalan")
    case LanguageCodeType.cas.rawValue:
        return setLanguage(key: "lang_spanish")
    default:
        return ""
    }
    
}
