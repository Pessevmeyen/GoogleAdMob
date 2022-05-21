//
//  ViewController.swift
//  GoogleAdMobTest
//
//  Created by Furkan Eruçar on 29.04.2022.
//

import UIKit
import GoogleMobileAds
import AppTrackingTransparency

class ViewController: UIViewController, GADFullScreenContentDelegate {
    
    private var interstitial: GADInterstitialAd?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        let request = GADRequest()
        
        ATTrackingManager.requestTrackingAuthorization { status in
            
            GADInterstitialAd.load(withAdUnitID:"ca-app-pub-3940256099942544/4411468910",
                                   request: request,
                                   completionHandler: { [self] ad, error in
                if let error = error {
                    print("Failed to load interstitial ad with error: \(error.localizedDescription)")
                    return
                }
                interstitial = ad
                interstitial?.fullScreenContentDelegate = self
            }
            )
            
            if status == .authorized {
                
            } else if status == .denied {
                
            }
            
        }
        
        
        
        // real ca-app-pub-5878642943899835/7964681932
        
        // test ca-app-pub-3940256099942544/4411468910
        
        
    }
    
    
    @IBAction func nextClicked(_ sender: Any) {
        
        if interstitial != nil {
            interstitial!.present(fromRootViewController: self)
          } else {
            print("Ad wasn't ready")
          }
        
    }
    
    /// Tells the delegate that the ad failed to present full screen content.
      func ad(_ ad: GADFullScreenPresentingAd, didFailToPresentFullScreenContentWithError error: Error) { // Yüklenmezse, fail ederse.
        print("Ad did fail to present full screen content.")
      }

      /// Tells the delegate that the ad will present full screen content.
      func adWillPresentFullScreenContent(_ ad: GADFullScreenPresentingAd) { // Yüklenirse.
        print("Ad will present full screen content.")
      }

      /// Tells the delegate that the ad dismissed full screen content.
      func adDidDismissFullScreenContent(_ ad: GADFullScreenPresentingAd) { // Yüklendi gösterildi bitti ne olsun.
        print("Ad did dismiss full screen content.")
      }
    
    
}

