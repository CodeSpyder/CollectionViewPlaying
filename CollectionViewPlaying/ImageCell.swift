/*
See LICENSE folder for this sample’s licensing information.

Abstract:
Generic text cell
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
        fatalError("not implemnted")
    }

}

extension ImageCell {
    func configure() {
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.layer.cornerRadius = 6
        imageView.layer.masksToBounds = true
        contentView.addSubview(imageView)
//        label.font = UIFont.preferredFont(forTextStyle: .caption1)
//        let inset = CGFloat(10)
        NSLayoutConstraint.activate([
            imageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 1),
            imageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: 1),
            imageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 1),
            imageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: 1)
        ])
    }
}
