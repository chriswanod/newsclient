//
//  Configs.swift
//  newsclient
//
//  Created by rightmeow on 1/24/18.
//  Copyright © 2018 odinternational. All rights reserved.
//

import Foundation
import Amplitude

class Configs: NSObject {

    static let shared = Configs()

    // app_versions

    var displayName: String {
        return Bundle.main.infoDictionary?[kCFBundleNameKey as String] as! String
    }

    var releaseVersion: String {
        return Bundle.main.infoDictionary?["CFBundleShortVersionString"] as! String
    }

    var buildVersion: String {
        return Bundle.main.infoDictionary?[kCFBundleVersionKey as String] as! String
    }

    // document_path

    func documentDirectory() -> String {
        let path = FileManager.default.urls(for: FileManager.SearchPathDirectory.documentDirectory, in: FileManager.SearchPathDomainMask.userDomainMask).first?.path
        return path!
    }

    // bundle_id

    func bundleId() -> String {
        return Bundle.main.bundleIdentifier!
    }

    // device_token

    func hasDeviceToken() -> Bool {
        return UserDefaults.standard.bool(forKey: kDeviceToken)
    }

    func updateDeviceToken(token: String) {
        do {
            let passwordItem = KeychainPasswordItem(service: KeychainConfiguration.serviceName, account: "newsclient_device_token", accessGroup: KeychainConfiguration.accessGroup)
            try passwordItem.savePassword(token)
            UserDefaults.standard.set(true, forKey: kDeviceToken)
        } catch let err {
            fatalError("Error updating keychain - \(err)")
        }
    }

    // session_token

    func hasSessionToken() -> Bool {
        return UserDefaults.standard.bool(forKey: kSessionToken)
    }

    func updateSessionToken(token: String) {
        do {
            let passwordItem = KeychainPasswordItem(service: KeychainConfiguration.serviceName, account: "newsclient_session_token", accessGroup: KeychainConfiguration.accessGroup)
            try passwordItem.savePassword(token)
            UserDefaults.standard.set(true, forKey: kSessionToken)
        } catch let err {
            fatalError("Error updating keychain - \(err)")
        }
    }

    // api_key

    func hasApiKey() -> Bool {
        return UserDefaults.standard.bool(forKey: kApiKey)
    }

    func updateApiKey(key: String) {
        do {
            let passwordItem = KeychainPasswordItem(service: KeychainConfiguration.serviceName, account: "newsclient_api_key", accessGroup: KeychainConfiguration.accessGroup)
            try passwordItem.savePassword(key)
            UserDefaults.standard.set(true, forKey: kApiKey)
        } catch let err {
            fatalError("Error updating keychain - \(err)")
        }
    }

    // onboarding

    func isOnboardingCompleted() -> Bool {
        let isOnboardingCompleted = UserDefaults.standard.bool(forKey: kOnboardingCompletion)
        return isOnboardingCompleted
    }

    func updateOnboardingCompletion(isCompleted: Bool) {
        UserDefaults.standard.set(isCompleted, forKey: kOnboardingCompletion)
    }

    // amplitude

    func amplitudeApiKey() -> String {
        let key = Bundle.main.object(forInfoDictionaryKey: "AMPLITUDE_API_KEY") as! String
        return key
    }

}
