/*
 სავალდებულო:
 
 ააწყეთ ფიგმაზე მოცემული მთავარი გვერდი
 დარწმუნდით რომ აწყობილი გვერდი ერგება ყველა iPhone-ს (ყველაზე კი ნუ გატესტავთ აიღეთ ყველა ეკრანის ზომა რაც ხელმისაწვდომია ამჟამად მაგ: პატარა SE, iPh 13 mini, iPh 15, iPh 15 Pro Max ან iPh 15 Plus)
 ნავიგაციის სახელად გამოიყენეთ LargeTitle
 მფლობელის სახელი და გვარი + ხატულა არის თეიბლის ჰედერში
 გაითვალისწინეთ:
 
 დეველოპერების სია: nodar ghachava, elene donadze, temuri chitashvili, irina datoshvili, tornike elqanashvili, ana ioramashvili, nini bardavelidze, barbare tepnadze, mariam sreseli, valeri mekhashishvili, zuka papuashvili, nutsa beriashvili, luka kharatishvili, data robakidze, nik’a kakhniashvili, sandro gelashvili, ana namgaladze, bakar kharabadze, archil menabde, tamuna kakhidze, giorgi michitashvili, salome topuria, luka gujejiani, gega tatulishvili, raisa badalova, aleksandre saroiani, begi kopaliani, akaki titberidze, sandro kupatadze, gvantsa gvagvalia, vano kvakhadze
 ხატულები გამოიყენეთ თქვენი სურვილისამებრ, თუ გინდათ თქვენი ვარიანტით ჩაანაცვლეთ
 გაითვალისწინეთ რომ ყველა დეველოპერის სახელი იყოს ლათინურად და უნდა იძებნებოდეს მარჯვენა ალფაბეტის ასოზე დაჭერით
 ყველა სახელი და გვარი უნდა დაიწყოს დიდი ასოთი
 ვადის გასვლის შემდეგ ატვირთვის ფუნქცია გაითიშება
 ლიდ დეველოპერების ჩასმა სავალდებულო არაა, თუ სურვილი გაქვთ ჩაგვსვით
 
 არასავალდებულო:
 
 ააწყეთ ფიგმაზე მოცემული დეტალების გვერდი
 თეიბლის ნებისმიერ სელზე დაჭერისას უნდა გადახვიდეთ ამ გვერდზე და გამოაჩინოთ იმ პიროვნების მონაცემები რომელსაც აირჩევთ
 Hobby, Gender & Age ატრიბუტები გამოჰკითხეთ ყველამ ერთმანეთს და ისინი ჩაწერეთ ან თქვენით მოიფიქრეთ
 */

import UIKit

class ViewController: UIViewController {
    // MARK: - Properties
    let Me: People = peopleList.first(where: { $0.name == "Luka Gujejiani" })!
    var sectionTitle = [String]()
    var sectionDictionary = [String : [String]]()
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.textColor = .label
        label.textAlignment = .left
        label.font = UIFont.preferredFont(forTextStyle: .largeTitle)
        label.text = "iOS Squad"
        return label
    }()
    
    private lazy var personStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.spacing = 13
        stackView.isUserInteractionEnabled = true
        
        let profileImage = UIImageView()
        profileImage.image = UIImage(named: Me.avatarImageName)
        profileImage.contentMode = .scaleAspectFit
        profileImage.layer.cornerRadius = 0
        profileImage.layer.cornerRadius = profileImage.frame.height/2
        profileImage.layer.masksToBounds = true
        
        let nameLabel = UILabel()
        nameLabel.text = Me.name
        
        let chevron = UIImageView()
        chevron.image = UIImage(systemName: "chevron.right")
        chevron.tintColor = .gray
        chevron.contentMode = .scaleAspectFit
        
        profileImage.heightAnchor.constraint(equalToConstant: 5).isActive = true
        profileImage.widthAnchor.constraint(equalTo: profileImage.heightAnchor).isActive = true
        
        stackView.addArrangedSubview(profileImage)
        stackView.addArrangedSubview(nameLabel)
        stackView.addArrangedSubview(chevron)
        
        return stackView
    }()
    
    
    private lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.register(ContactTableViewCell.self, forCellReuseIdentifier: "ContactTableViewCell")
        tableView.dataSource = self
        tableView.delegate = self
        tableView.separatorInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 20)
        tableView.sectionHeaderTopPadding = 0.0
        return tableView
    }()
    
    
    func dataForTableView() {
        let sectionTitleSubstrings = Set(peopleList.map { $0.name.prefix(1) })
        sectionTitle = sectionTitleSubstrings.map { String($0) }
        sectionTitle.sort()
        sectionTitle.forEach { sectionDictionary[$0] = [String]() }
        
        peopleList.forEach { person in
            if let firstLetter = person.name.first {
                let firstLetterString = String(firstLetter)
                sectionDictionary[firstLetterString]?.append(person.name)
            }
        }
    }
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        dataForTableView()
    }
    
    // MARK: - UI
    func setupUI() {
        view.backgroundColor = .white
        
        view.addSubview(titleLabel)
        view.addSubview(personStackView)
        view.addSubview(tableView)
        
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        personStackView.translatesAutoresizingMaskIntoConstraints = false
        tableView.translatesAutoresizingMaskIntoConstraints = false
        
        
        NSLayoutConstraint.activate([
            titleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            titleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 5),
            
            personStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            personStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            personStackView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 20),
            personStackView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.07),
            
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0),
            tableView.topAnchor.constraint(equalTo: personStackView.bottomAnchor, constant: 20),
            tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(personStackViewTapped))
        personStackView.addGestureRecognizer(tapGesture)
    }
    
    //ეს ბუთონ რახან არაა მაპატიეთ objc-ს ასე ვულგარული გამოყენება
    @objc func personStackViewTapped() {
        let personViewController = PersonViewController()
        personViewController.selectedPerson = Me
        navigationController?.pushViewController(personViewController, animated: true)
    }
}

//MARK: - TableView
extension ViewController: UITableViewDataSource, UITableViewDelegate {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return sectionTitle.count
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return sectionTitle[section]
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let sectionKey = sectionTitle[section]
        return sectionDictionary[sectionKey]?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "ContactTableViewCell", for: indexPath) as? ContactTableViewCell else {
            return UITableViewCell()
        }
        
        let sectionKey = sectionTitle[indexPath.section]
        if let namesInSection = sectionDictionary[sectionKey] {
            let name = namesInSection[indexPath.row]
            cell.nameLabel.text = name
        }
        return cell
    }
    
    func sectionIndexTitles(for tableView: UITableView) -> [String]? {
        sectionTitle
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let sectionKey = sectionTitle[indexPath.section]
        if let namesInSection = sectionDictionary[sectionKey] {
            let selectedName = namesInSection[indexPath.row]
            if let selectedPerson = peopleList.first(where: { $0.name == selectedName }) {
                let personViewController = PersonViewController()
                personViewController.selectedPerson = selectedPerson  // Set selected person
                navigationController?.pushViewController(personViewController, animated: true)
            }
        }
    } 
}

#Preview() {
    ViewController()
}
