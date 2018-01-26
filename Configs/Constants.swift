//
//  Constants.swift
//  newsclient
//
//  Created by rightmeow on 1/24/18.
//  Copyright © 2018 odinternational. All rights reserved.
//

import Foundation

let kOnboardingCompletion = "kOnboardingCompletion"
let kSessionToken = "kSessionToken"
let kDeviceToken = "kDeviceToken" // whether or not a deviceToken exists in Keychain
let kApiKey = "kApiKey" // whether or not a apiKey exists in Keychain

struct KeychainConfiguration {
    static let serviceName = "newsclient"
    static let accessGroup: String? = Bundle.main.bundleIdentifier!
}

struct WebServiceConfiguration {

    private let baseUrl = "http://v.juhe.cn/toutiao/index"

    struct type {
        static let top = "top"
        static let shehui = "shehui"
        static let guonei = "guonei"
        static let guoji = "guoji"
        static let yule = "yule"
        static let tiyu = "tiyu"
        static let junshi = "junshi"
        static let keji = "keji"
        static let caijing = "caijing"
        static let shishang = "shishang"
    }

}
