import UIKit
import Foundation

class FeedCell: UICollectionViewCell {
    
    var post: Post? {
        didSet {
            
            if let name = post?.name {
                
                let attributedText = NSMutableAttributedString(string: name, attributes: [NSFontAttributeName: UIFont.boldSystemFontOfSize(14)])
                
                attributedText.appendAttributedString(NSAttributedString(string: "\nDecember 18  •  San Francisco  •  ", attributes: [NSFontAttributeName: UIFont.systemFontOfSize(12), NSForegroundColorAttributeName:
                    UIColor.rgb(155, green: 161, blue: 161)]))
                
                let paragraphStyle = NSMutableParagraphStyle()
                paragraphStyle.lineSpacing = 4
                
                attributedText.addAttribute(NSParagraphStyleAttributeName, value: paragraphStyle, range: NSMakeRange(0, attributedText.string.characters.count))
                
                let attachment = NSTextAttachment()
                attachment.image = UIImage(named: "globe_small")
                attachment.bounds = CGRectMake(0, -2, 12, 12)
                attributedText.appendAttributedString(NSAttributedString(attachment: attachment))
                
                nameLabel.attributedText = attributedText
                
            }
            
            if let statusText = post?.statusText {
                statusTextView.text = statusText
            }
            
            if let profileImagename = post?.profileImageName {
                profileImageView.image = UIImage(named: profileImagename)
            }
            
            if let statusImageName = post?.statusImageName {
                statusImageView.image = UIImage(named: statusImageName)
            }
            
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    let nameLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 2
        
        
        
        return label
    }()
    
    let profileImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "zuckprofile")
        imageView.contentMode = .ScaleAspectFit
        return imageView
    }()
    
    let statusTextView: UITextView = {
        let textView = UITextView()
        textView.text = "Meanwhile, Beast turned to the dark side."
        textView.font = UIFont.systemFontOfSize(14)
        textView.scrollEnabled = false
        return textView
    }()
    
    let statusImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "zuckdog")
        imageView.contentMode = .ScaleAspectFill
        imageView.layer.masksToBounds = true
        return imageView
    }()
    
    let likesCommentsLabel: UILabel = {
        let label = UILabel()
        label.text = "488 Likes   10.7K Comments"
        label.font = UIFont.systemFontOfSize(12)
        label.textColor = UIColor.rgb(155, green: 161, blue: 171)
        return label
    }()
    
    let dividerLineView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.rgb(226, green: 228, blue: 232)
        return view
    }()
    
    
    func setupViews() {
        backgroundColor = UIColor.whiteColor()
        
        addSubview(statusImageView)
        addSubview(nameLabel)
        addSubview(profileImageView)
        addSubview(statusTextView)
        addSubview(likesCommentsLabel)
        addSubview(dividerLineView)
        
        // Horizontal constraints
        addConstraintsWithFormat("H:|-8-[v0(44)]-8-[v1]|", views: profileImageView, nameLabel)
        
        addConstraintsWithFormat("H:|-4-[v0]-4-|", views: statusTextView)
        
        addConstraintsWithFormat("H:|[v0]|", views: statusImageView)
        
        addConstraintsWithFormat("H:|-12-[v0]|", views: likesCommentsLabel)
        
        addConstraintsWithFormat("H:|-12-[v0]-12-|", views: dividerLineView)
        
        
        // Vertical constrains
        addConstraintsWithFormat("V:|[v0(200)]-8-[v1(44)]-4-[v2]-8-[v3(24)]-8-[v4(0.4)]|", views: statusImageView, profileImageView, statusTextView, likesCommentsLabel, dividerLineView)
        
        addConstraintsWithFormat("V:|[v0]-8-[v1(44)]", views: statusImageView, nameLabel)
        
    }
    
}