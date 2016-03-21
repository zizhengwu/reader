import UIKit
import SnapKit
import Foundation

class SettingSwitchTableViewCell : UITableViewCell {
    var titleLabel : UILabel?
    var customSwitch : UISwitch?
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupViews() {
        self.selectionStyle = .None
        
        self.titleLabel = UILabel()
        self.titleLabel!.textAlignment = .Center
        self.titleLabel!.font = UIFont.systemFontOfSize(14)
        self.contentView.addSubview(titleLabel!)
        
        self.customSwitch = UISwitch(frame: CGRectZero)
        self.accessoryView = customSwitch
        
        self.titleLabel!.snp_makeConstraints{ (make) -> Void in
            make.centerY.equalTo(self.contentView)
            make.left.equalTo(self.contentView).offset(12)
        }
        
    }
}