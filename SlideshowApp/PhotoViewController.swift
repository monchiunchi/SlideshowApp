//
//  PhotoViewController.swift
//  SlideshowApp
//
//  Created by tetsuro miyagawa on 2018/08/16.
//  Copyright © 2018年 tetsuro miyagawa. All rights reserved.
//

import UIKit

class PhotoViewController: UIViewController {

    @IBOutlet weak var photodetail: UIImageView!
    var c: Int = 0
    let image0 = UIImage(named:"IMG_1600.jpg" )!//ファイル名を入れる
    let image1 = UIImage(named:"IMG_1601.jpg")!
    let image2 = UIImage(named:"IMG_1602.jpg")!
    var data: Array<UIImage> = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        data.append(image0)
        data.append(image1)
        data.append(image2)
        photodetail.image = data[c]
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let viewController: ViewController = segue.destination as! ViewController
        viewController.c = c
        
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
