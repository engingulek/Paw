
import UIKit
import SnapKit
final class MessageUserListTableViewCell : UITableViewCell {
    static let identifier = "MessageUserListTableViewCell"
    
    private lazy var userImageView:UIImageView = {
        let imageView = UIImageView()
      
        imageView.layer.masksToBounds = false
        imageView.layer.cornerRadius = 50 / 2
        imageView.backgroundColor = .red
        imageView.clipsToBounds = true
        return imageView
    }()
    
    private lazy var userNameLabel : UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = .systemFont(ofSize: 20,weight: .semibold)
        label.text = "Kan Dada"
        return label
    }()
    
    private lazy var lastMessageDate : UILabel = {
        let label = UILabel()
        label.textColor = .lightGray
        label.font = .systemFont(ofSize: 15,weight: .semibold)
        label.text = "02.12.2024"
        return label
    }()
    
    private lazy var lastMessage : UILabel = {
        let label = UILabel()
        label.textColor = .lightGray
        label.font = .systemFont(ofSize: 15,weight: .semibold)
        label.text = "How are you. I have a questions"
        return label
    }()
    override init(
        style: UITableViewCell.CellStyle,
        reuseIdentifier: String?) {
            super.init(
                style: style,
                reuseIdentifier: reuseIdentifier)
            
            contentView.addSubview(userImageView)
            userImageView.snp.makeConstraints { make in
                make.centerY.equalToSuperview()
                make.leading.equalToSuperview().offset(10)
                make.height.equalTo(50)
                make.width.equalTo(50)
            }
            
            
            
            
            contentView.addSubview(lastMessageDate)
            lastMessageDate.snp.makeConstraints { make in
                make.trailing.equalToSuperview().offset(-10)
                make.top.equalTo(userImageView.snp.top)
            }
            
            contentView.addSubview(userNameLabel)
            userNameLabel.snp.makeConstraints { make in
                make.top.equalTo(userImageView.snp.top)
                make.leading.equalTo(userImageView.snp.trailing).offset(10)
               
            }
            
            contentView.addSubview(lastMessage)
            lastMessage.snp.makeConstraints { make in
                make.top.equalTo(userNameLabel.snp.bottom).offset(10)
                make.leading.equalTo(userImageView.snp.trailing).offset(10)
                make.trailing.equalToSuperview()
            }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
