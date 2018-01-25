//
//  Configs.swift
//  newsclient
//
//  Created by rightmeow on 1/24/18.
//  Copyright © 2018 odinternational. All rights reserved.
//

import Foundation

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
        return false
    }

    func updateDeviceToken(token: String) {

    }

    // session_token

    func hasSessionToken() -> Bool {
        return false
    }

    func hasSessionTokenExpired() -> Bool {
        return false
    }

    func updateSessionToken(token: String) {

    }

    // onboarding

    func isOnboardingCompleted() -> Bool {
        let isOnboardingCompleted = UserDefaults.standard.bool(forKey: kOnboardingCompletion)
        return isOnboardingCompleted
    }

    func updateOnboardingCompletion(isCompleted: Bool) {
        UserDefaults.standard.set(isCompleted, forKey: kOnboardingCompletion)
    }

}
