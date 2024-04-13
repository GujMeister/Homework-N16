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
        tableView.register(InfoTableViewCell.self, forCellReuseIdentifier: "InfoTableViewCell")
        tableView.dataSource = self
        tableView.backgroundColor = view.backgroundColor
        tableView.isUserInteractionEnabled = false
        return tableView
    }()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    func setupUI() {
        view.backgroundColor = .white
        
        view.addSubview(avatarAndNameStackView)
        view.addSubview(colorView)
        view.addSubview(tableView)
        
        avatarAndNameStackView.translatesAutoresizingMaskIntoConstraints = false
        colorView.translatesAutoresizingMaskIntoConstraints = false
        tableView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            colorView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            colorView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            colorView.topAnchor.constraint(equalTo: view.topAnchor),
            colorView.bottomAnchor.constraint(equalTo: avatarAndNameStackView.topAnchor),
            
            avatarAndNameStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            avatarAndNameStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            avatarAndNameStackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            avatarAndNameStackView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.35),
            
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
            tableView.topAnchor.constraint(equalTo: avatarAndNameStackView.bottomAnchor, constant: 20),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
            
        ])
    }
}

extension PersonViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "InfoTableViewCell", for: indexPath) as? InfoTableViewCell else {
            return UITableViewCell()
        }
        
        
        switch indexPath.row {
        case 0:
            cell.configure(title: "Gender:", value: genderToString(selectedPerson?.gender ?? .male))
        case 1:
            if let age = selectedPerson?.age {
                cell.configure(title: "Age (years):", value: String(age))
            } else {
                cell.configure(title: "Age (years):", value: "Unknown")
            }
        case 2:
            cell.configure(title: "Hobby:", value: selectedPerson?.hobby ?? "No Hobby")
        default:
            break
        }
        
        return cell
    }
    
    func genderToString(_ gender: People.Gender) -> String {
        switch gender {
        case .male:
            return "Male"
        case .female:
            return "Female"
        }
    }
    
}

#Preview() {
    PersonViewController()
}
