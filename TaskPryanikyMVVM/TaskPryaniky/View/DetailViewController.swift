//
//  DetailViewController.swift
//  TaskPryaniky
//
//  Created by mac on 12.02.2021.
//

import UIKit

class DetailViewController: UIViewController {

    var descriptionLabel = UILabel()
    var iconImage = UIImageView()
    var textLabel = UILabel()
    
    var segmentControl = UISegmentedControl()

    var viewModel: DetailViewModelType?
    var top: NSLayoutConstraint! = nil
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        descriptionLabelAdding()
        iconImageAdding()
        textLabelAdding()
        segmentedControl()
    }
    
    func descriptionLabelAdding() {
        guard let viewModel = viewModel else { return }
        view.addSubview(descriptionLabel)
        descriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        descriptionLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 70).isActive = true
        descriptionLabel.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor).isActive = true
        descriptionLabel.heightAnchor.constraint(equalToConstant: 30).isActive = true
        descriptionLabel.font = UIFont.boldSystemFont(ofSize: 30)
        self.descriptionLabel.text = viewModel.description
    }
    
    func iconImageAdding() {
        guard let viewModel = viewModel else { return }
        guard let iconURL = viewModel.url else { return }
        if let url = URL(string: (iconURL)) {
            let _ = URLSession.shared.dataTask(with: url) { (data, response, error) in
                guard let data = data else { return }
                DispatchQueue.main.async {
                    self.iconImage.image = UIImage(data: data)
                }
            }.resume()
        }
        view.addSubview(iconImage)
        iconImage.translatesAutoresizingMaskIntoConstraints = false
        iconImage.topAnchor.constraint(equalTo: view.topAnchor, constant: 150).isActive = true
        iconImage.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor).isActive = true
        iconImage.widthAnchor.constraint(equalToConstant: view.bounds.width - 50).isActive = true
        iconImage.heightAnchor.constraint(equalToConstant: view.bounds.width - 50).isActive = true
    }
    
    func textLabelAdding() {
        guard let viewModel = viewModel else { return }
        view.addSubview(textLabel)
        textLabel.translatesAutoresizingMaskIntoConstraints = false
        top = textLabel.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: 10)
        top.isActive = true
        textLabel.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor).isActive = true
        descriptionLabel.heightAnchor.constraint(equalToConstant: 30).isActive = true
        self.textLabel.text = viewModel.text
    }
    
    
    
    func segmentedControl() {
        guard let viewModel = viewModel else { return }
        if viewModel.arrayOfIdVariants.count > 1 {
            for index in 0...viewModel.arrayOfIdVariants.count - 1 {
                self.view.addSubview(segmentControl)
                segmentControl.translatesAutoresizingMaskIntoConstraints = false
                segmentControl.translatesAutoresizingMaskIntoConstraints = false
                segmentControl.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: 10).isActive = true
                segmentControl.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor).isActive = true
                segmentControl.widthAnchor.constraint(equalToConstant: 150).isActive = true
                segmentControl.heightAnchor.constraint(equalToConstant: 40).isActive = true
                top.isActive = false
                top = textLabel.topAnchor.constraint(equalTo: segmentControl.bottomAnchor, constant: 20)
                top.isActive = true
                self.segmentControl.insertSegment(withTitle: String(viewModel.arrayOfIdVariants[index]!), at: index, animated: true)
                self.segmentControl.addTarget(self, action: #selector(addActionSegmentedControl), for: .valueChanged)
            }
            
            if segmentControl.numberOfSegments >= 4 {
                repeat {
                    
                } while segmentControl.numberOfSegments == 3
            }
        }
    }
    
    @objc func addActionSegmentedControl(target: UISegmentedControl) {
        if target == self.segmentControl {
            guard let viewModel = viewModel else { return }
            let segmentIndex = target.selectedSegmentIndex
            self.textLabel.text = viewModel.arrayOfTextVariants[segmentIndex]
        }
        
    }
    
    @IBAction func goBack(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
}
