import UIKit

class PersonViewController: UIViewController {
    
    var selectedPerson: People?
    
    var colorView: UIView = {
        let view = UIView()
        view.backgroundColor = .gray
        return view
    }()
    
    private lazy var avatarAndNameStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 15
        stackView.backgroundColor = .gray
        
        let AvatarImageView = UIImageView()
        AvatarImageView.image = UIImage(named: selectedPerson?.avatarImageName ?? "Male1")
        AvatarImageView.contentMode = .scaleAspectFit
        
        let nameLabel = UILabel()
        nameLabel.textAlignment = .center
        nameLabel.font = .systemFont(ofSize: 24, weight: .regular)
        nameLabel.text = selectedPerson?.name ?? "Xmalo"
        nameLabel.textColor = .white
        nameLabel.setContentHuggingPriority(.required, for: .vertical)
        nameLabel.setContentCompressionResistancePriority(.required, for: .vertical)
        
        let colorView = UIView()
        colorView.backgroundColor = stackView.backgroundColor
        colorView.translatesAutoresizingMaskIntoConstraints = false
        colorView.heightAnchor.constraint(equalToConstant: 10).isActive = true
        
        stackView.addArrangedSubview(AvatarImageView)
        stackView.addArrangedSubview(nameLabel)
        stackView.addArrangedSubview(colorView)
        
        return stackView
    }()
    
    private lazy var tableView: UITableView = {
        let tableView = UITableView()
        
        return tableView
    }()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    func setupUI() {
        view.addSubview(avatarAndNameStackView)
        view.addSubview(colorView)
        
        avatarAndNameStackView.translatesAutoresizingMaskIntoConstraints = false
        colorView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            colorView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            colorView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            colorView.topAnchor.constraint(equalTo: view.topAnchor),
            colorView.bottomAnchor.constraint(equalTo: avatarAndNameStackView.topAnchor),
            
            avatarAndNameStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            avatarAndNameStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            avatarAndNameStackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            avatarAndNameStackView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.35)
        ])
        
    }
    
    
}

extension PersonViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        <#code#>
    }
    
    
}

#Preview() {
    PersonViewController()
}
