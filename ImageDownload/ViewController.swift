//
//  ViewController.swift
//  ImageDownload
//
//  Created by Giwoung Nam on 2023/02/25.
//

import UIKit

class ViewController: UIViewController {
    // MARK: IBOutlets
    @IBOutlet var imageView_1: UIImageView!
    @IBOutlet var imageView_2: UIImageView!
    @IBOutlet var imageView_3: UIImageView!
    @IBOutlet var imageView_4: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
    }
    @IBAction func loadOne(_ sender: UIButton)
    {
        imageView_1.download(from: "https://imgnn.seoul.co.kr/img/upload/2020/10/08/SSI_20201008104519.jpg")
    }
    @IBAction func loadTwo(_ sender: UIButton) {
        imageView_2.download(from: "https://i.ytimg.com/vi/sL1yJZFBXdY/maxresdefault.jpg")
    }
    @IBAction func loadThree(_ sender: UIButton) {
        imageView_3.download(from: "https://img.insight.co.kr/static/2019/05/05/700/ga6p1u7585cbf0d61xdp.jpg")
    }
    @IBAction func loadFour(_ sender: UIButton) {
        imageView_4.download(from: "https://dimg.donga.com/wps/NEWS/IMAGE/2013/09/11/57595179.1.jpg")
    }
    @IBAction func loadAll(_ sender:UIButton)
    {
        imageView_1.download(from: "https://imgnn.seoul.co.kr/img/upload/2020/10/08/SSI_20201008104519.jpg")
        imageView_2.download(from: "https://i.ytimg.com/vi/sL1yJZFBXdY/maxresdefault.jpg")
        imageView_3.download(from: "https://img.insight.co.kr/static/2019/05/05/700/ga6p1u7585cbf0d61xdp.jpg")
        imageView_4.download(from: "https://dimg.donga.com/wps/NEWS/IMAGE/2013/09/11/57595179.1.jpg")
    }
}
extension UIImageView{
    func download(from url: URL, contentMode mode: ContentMode = .scaleAspectFit){
        contentMode = mode
        let imagePhoto = UIImage(systemName: "photo")
        self.image = imagePhoto
        OperationQueue().addOperation {
            let imageData: Data = try! Data.init(contentsOf: url)
            let image: UIImage = UIImage(data: imageData)!
            OperationQueue.main.addOperation
            {
                self.image = image
            }
        }
        
    }
    func download(from link: String, contentMode mode: ContentMode = .scaleAspectFit) {
        guard let url = URL(string: link) else { return }
        download(from: url, contentMode: mode)
    }
}
