//
//  ViewController.swift
//  Project-03-Animal-Info
//
//  Created by Ilgın Akgöz on 14.07.2023.
//

import UIKit
import AVKit

class AnimalViewController: UIViewController {

    @IBOutlet weak var cheetahView: AnimalView!
    @IBOutlet weak var elephantView: AnimalView!
    @IBOutlet weak var giraffeView: AnimalView!
    @IBOutlet weak var gorillaView: AnimalView!
    @IBOutlet weak var hippopotamusView: AnimalView!
    @IBOutlet weak var lionView: AnimalView!
    @IBOutlet weak var zebraView: AnimalView!
    @IBOutlet weak var commonOstrichView: AnimalView!
        
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Animals"
        
        setUpCell(cheetahView, animalName: "Cheetah", imageName: "cheetah")
        setUpCell(elephantView, animalName: "Elephant", imageName: "elephant")
        setUpCell(giraffeView, animalName: "Giraffe", imageName: "giraffe")
        setUpCell(gorillaView, animalName: "Gorilla", imageName: "gorilla")
        setUpCell(hippopotamusView, animalName: "Hippo", imageName: "hippo")
        setUpCell(lionView, animalName: "Lion", imageName: "lion")
        setUpCell(zebraView, animalName: "Zebra", imageName: "zebra")
        setUpCell(commonOstrichView, animalName: "Ostrich", imageName: "ostrich")
        
        setUpDelegates()
    }
    
    private func setUpCell(_ view: UIView, animalName: String, imageName: String) {
        if let cell = view as? AnimalView {
            cell.animalImage.image = UIImage(named: imageName)
            cell.animalImage.layer.cornerRadius = 20
            cell.animalImage.contentMode = .scaleAspectFill
            cell.animalImage.clipsToBounds = true
            cell.animalLabel.text = animalName
            cell.videoURL = Bundle.main.url(forResource: imageName, withExtension: "mp4")
        }
    }
}

extension AnimalViewController: AnimalViewDelegate {
    private func setUpDelegates() {
        cheetahView.delegate = self
        elephantView.delegate = self
        giraffeView.delegate = self
        gorillaView.delegate = self
        hippopotamusView.delegate = self
        lionView.delegate = self
        zebraView.delegate = self
        commonOstrichView.delegate = self
    }

    func didTapLinkButton(_ view: AnimalView) {
        var urlString: String?
    
        switch view {
        case cheetahView:
            urlString = URLs.cheetah
        case elephantView:
            urlString = URLs.elephant
        case giraffeView:
            urlString = URLs.giraffe
        case gorillaView:
            urlString = URLs.gorilla
        case hippopotamusView:
            urlString = URLs.hippopotamus
        case lionView:
            urlString = URLs.lion
        case zebraView:
            urlString = URLs.zebra
        case commonOstrichView:
            urlString = URLs.commonOstrich
        default:
            break
        }

        if let urlString, let url = URL(string: urlString) {
            let webViewController = WebViewController()
            webViewController.url = url
            navigationController?.pushViewController(webViewController, animated: true)
        }
    }
    
    func didTapVideoButton(_ view: AnimalView, videoURL: URL) {
        let videoPlayerViewController = AVPlayerViewController()
        let player = AVPlayer(url: videoURL)
        videoPlayerViewController.player = player
        present(videoPlayerViewController, animated: true) {
            player.play()
        }
    }
}

