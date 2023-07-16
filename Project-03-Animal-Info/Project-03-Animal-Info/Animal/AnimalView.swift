//
//  AnimalView.swift
//  Project-03-Animal-Info
//
//  Created by Ilgın Akgöz on 14.07.2023.
//

import UIKit

protocol AnimalViewDelegate: AnyObject {
    func didTapLinkButton(_ view: AnimalView)
    func didTapVideoButton(_ view: AnimalView, videoURL: URL)
}

class AnimalView: UIView {
    @IBOutlet weak var animalImage: UIImageView!
    @IBOutlet weak var videoButton: UIButton!
    @IBOutlet weak var linkButton: UIButton!
    @IBOutlet weak var animalLabel: UILabel!
    
    weak var delegate: AnimalViewDelegate?
    var videoURL: URL?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUpView()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setUpView()
        setUpButtons()
    }
    
    private func setUpView() {
        if let viewForXib = Bundle.main.loadNibNamed("AnimalView", owner: self)?[0] as? UIView {
            viewForXib.frame = self.bounds
            addSubview(viewForXib)
        }
    }
    
    private func setUpButtons() {
        videoButton.layer.cornerRadius = 20
        linkButton.layer.cornerRadius = 20
    }
    
    @IBAction func watchVideoButtonTapped(_ sender: Any) {
        guard let videoURL else { return }
        delegate?.didTapVideoButton(self, videoURL: videoURL)
    }
    
    @IBAction func linkButtonTapped(_ sender: Any) {
        delegate?.didTapLinkButton(self)
    }
}
