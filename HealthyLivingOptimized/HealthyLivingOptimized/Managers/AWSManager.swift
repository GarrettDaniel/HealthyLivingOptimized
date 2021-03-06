//
//  AWSManager.swift
//  HealthyLivingOptimized
//
//  Created by Robinson Paz Jesus on 8/25/20.
//  Copyright © 2020 Unagi Lab. All rights reserved.
//

import Foundation
import AWSCognitoIdentityProvider



let AWSCognitoUserPoolsSignInProviderKey = "UserPool"


class AWSManager {
    
    static var shared = AWSManager()
    private init() {}
    
    let CognitoIdentityUserPoolRegion: AWSRegionType = .USEast1
    let CognitoIdentityUserPoolId = "us-east-1_BZBsibQMf"
    let CognitoIdentityUserPoolAppClientId = "3116mnhv3po1923ahl4iqkp3v3"
    let CognitoIdentityUserPoolAppClientSecret = "epnd02v7petdbec023ca27j4vom9orloh7mjm21eevitj2jamtr"
    
    func start() {
        
        // setup logging
        AWSDDLog.sharedInstance.logLevel = .verbose
        
        // setup service configuration
        let serviceConfiguration = AWSServiceConfiguration(region: CognitoIdentityUserPoolRegion, credentialsProvider: nil)
        
        // create pool configuration
        let poolConfiguration = AWSCognitoIdentityUserPoolConfiguration(clientId: CognitoIdentityUserPoolAppClientId,
                                                                        clientSecret: CognitoIdentityUserPoolAppClientSecret,
                                                                        poolId: CognitoIdentityUserPoolId)
        
        // initialize user pool client
        AWSCognitoIdentityUserPool.register(with: serviceConfiguration, userPoolConfiguration: poolConfiguration, forKey: AWSCognitoUserPoolsSignInProviderKey)
        
        // fetch the user pool client we initialized in above step
//        AWSCognitoIdentityUserPool(forKey: AWSCognitoUserPoolsSignInProviderKey)?.delegate = self
    }
}
