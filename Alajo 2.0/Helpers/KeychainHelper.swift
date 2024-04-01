//
//  KeychainHelper.swift
//  Alajo
//
//  Created by God's on 3/13/24.
//

import Foundation
import Security

class KeychainHelper {
    static func saveData(
    data: Data,
    ForService service: String
    ) -> Bool {
        let query: [String: Any] = [
            kSecClass as String: kSecClassGenericPassword,
            kSecAttrService as String: service,
            kSecValueData as String: data
        ]
        let status = SecItemAdd(query as CFDictionary, nil)
        return status == errSecSuccess
    }
    
    static func retrieveData(
        forService service: String) -> Data? {
            let query: [String: Any] = [
                kSecClass as String: kSecClassGenericPassword,
                kSecAttrService as String: service,
//                kSecAttrService as String: account,
                kSecReturnData as String: kCFBooleanTrue!,
                kSecMatchLimit as String: kSecMatchLimitOne
            ]
            var dataTypeRef: AnyObject?
            let status = SecItemCopyMatching(query as CFDictionary, &dataTypeRef)
            if status == errSecSuccess {
                return dataTypeRef as? Data
            } else {
                return nil
            }
        }
}
