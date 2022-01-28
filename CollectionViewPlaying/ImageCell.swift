/*
Date: 1/28/2022
*/

import UIKit

class ImageCell: UICollectionViewCell {
//    let label = UILabel()
    let imageView = UIImageView()
    static let reuseIdentifier = "image-cell-reuse-identifier"

    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }

}

extension ImageCell {
    func configure() {
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.layer.cornerRadius = 6
        imageView.layer.masksToBounds = true
        contentView.addSubview(imageView)
        NSLayoutConstraint.activate([
            imageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 1),
            imageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: 1),
            imageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 1),
            imageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: 1)
        ])
    }
}
