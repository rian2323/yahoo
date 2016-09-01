//
//  ViewController.swift
//  lostmemo
//
//  Created by 波多野　瑛子 on 2016/09/01.
//  Copyright © 2016年 波多野　瑛子. All rights reserved.
//  branch変える練習
//  branch変える練習3
//

import UIKit
import MapKit
class ViewController: UIViewController {

    @IBOutlet weak var myMap: MKMapView!
    @IBOutlet weak var toolBar: UISegmentedControl!
    
    var defaultColor:UIColor!
    
    @IBAction func gotoSpot(sender: AnyObject) {
        let lat = 35.454954
        let lng = 139.6313859
        let center = CLLocationCoordinate2D(latitude: lat, longitude: lng)
        let span = MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01)  // 1 degree means 111km
        let theRegion = MKCoordinateRegion(center:center, span:span)
        myMap.setRegion(theRegion,animated: true)
    }
    @IBAction func changeMapType(sender: AnyObject) {
        switch sender.selectedSegmentIndex {
        case 0:
            myMap.mapType = .Standard
            myMap.camera.pitch = 0.0
            toolBar.tintColor = defaultColor
            toolBar.alpha = 1.0
        case 1:
            myMap.mapType = .Satellite
            toolBar.tintColor = UIColor.whiteColor()
            toolBar.alpha = 0.8
        case 2:
            myMap.mapType = .Hybrid
            toolBar.tintColor = UIColor.whiteColor()
            toolBar.alpha = 0.8
        case 3:
            myMap.mapType = .Standard
            toolBar.tintColor = defaultColor
            toolBar.alpha = 1.0
            myMap.camera.pitch = 70
            myMap.camera.altitude = 1000
        default:
            break
        }

    }
    override func viewDidLoad() {
        super.viewDidLoad()
        defaultColor = toolBar.tintColor
        myMap.showsScale = true
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

