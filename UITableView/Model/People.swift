import Foundation

struct People {
    enum Gender {
        case male
        case female
        case other
    }
    
    let name: String
    let gender: Gender
    let age: Int
    let hobby: String
    let avatarImageName: String
}

let peopleList: [People] = [
    People(name: "Nodar Ghachava", gender: .male, age: 30, hobby: "Playing guitar and composing music.", avatarImageName: "Male1"),
    People(name: "Elene Donadze", gender: .female, age: 25, hobby: "Reading classic literature and painting.", avatarImageName: "Female1"),
    People(name: "Temuri Chitashvili", gender: .male, age: 35, hobby: "Playing chess and hiking in the mountains.", avatarImageName: "Male2"),
    People(name: "Irina Datoshvili", gender: .female, age: 28, hobby: "Cooking new recipes and gardening.", avatarImageName: "Female2"),
    People(name: "Tornike Elqanashvili", gender: .male, age: 22, hobby: "Playing basketball and programming.", avatarImageName: "Male3"),
    People(name: "Ana Ioramashvili", gender: .female, age: 20, hobby: "Photography and traveling.", avatarImageName: "Female3"),
    People(name: "Nini Bardavelidze", gender: .female, age: 33, hobby: "Yoga and meditation.", avatarImageName: "Female4"),
    People(name: "Barbare Tepnadze", gender: .female, age: 27, hobby: "Sculpting and horse riding.", avatarImageName: "Female4"),
    People(name: "Mariam Sreseli", gender: .female, age: 29, hobby: "Singing and volunteering at animal shelters.", avatarImageName: "Female1"),
    People(name: "Valeri Mekhashishvili", gender: .male, age: 40, hobby: "Fishing and woodworking.", avatarImageName: "Male4"),
    People(name: "Zuka Papuashvili", gender: .male, age: 24, hobby: "Playing football and reading science fiction.", avatarImageName: "Male1"),
    People(name: "Nutsa Beriashvili", gender: .female, age: 31, hobby: "Dancing and painting.", avatarImageName: "Female3"),
    People(name: "Luka Kharatishvili", gender: .male, age: 26, hobby: "Playing piano and hiking.", avatarImageName: "Male2"),
    People(name: "Data Robakidze", gender: .male, age: 32, hobby: "Playing video games and coding.", avatarImageName: "Male3"),
    People(name: "Nik’a Kakhniashvili", gender: .male, age: 28, hobby: "Watching movies and traveling.", avatarImageName: "Male4"),
    People(name: "Sandro Gelashvili", gender: .male, age: 23, hobby: "Playing guitar and skateboarding.", avatarImageName: "Male2"),
    People(name: "Ana Namgaladze", gender: .female, age: 21, hobby: "Writing poetry and practicing calligraphy.", avatarImageName: "Female4"),
    People(name: "Bakar Kharabadze", gender: .male, age: 34, hobby: "Playing tennis and gardening.", avatarImageName: "Male3"),
    People(name: "Archil Menabde", gender: .male, age: 37, hobby: "Cooking gourmet meals and playing piano.", avatarImageName: "Male4"),
    People(name: "Tamuna Kakhidze", gender: .female, age: 36, hobby: "Hiking and birdwatching.", avatarImageName: "Female1"),
    People(name: "Giorgi Michitashvili", gender: .male, age: 31, hobby: "Playing drums and painting.", avatarImageName: "Male1"),
    People(name: "Salome Topuria", gender: .female, age: 29, hobby: "Playing volleyball and reading mystery novels.", avatarImageName: "Female2"),
    People(name: "Luka Gujejiani", gender: .male, age: 25, hobby: "Playing soccer and photography.", avatarImageName: "Male2"),
    People(name: "Gega Tatulishvili", gender: .male, age: 27, hobby: "Singing and acting.", avatarImageName: "Male3"),
    People(name: "Raisa Badalova", gender: .female, age: 30, hobby: "Gardening and knitting.", avatarImageName: "Female3"),
    People(name: "Aleksandre Saroiani", gender: .male, age: 33, hobby: "Playing guitar and woodworking.", avatarImageName: "Male4"),
    People(name: "Begi Kopaliani", gender: .male, age: 28, hobby: "Playing basketball and reading philosophy.", avatarImageName: "Male1"),
    People(name: "Akaki Titberidze", gender: .male, age: 29, hobby: "Playing piano and hiking.", avatarImageName: "Male2"),
    People(name: "Sandro Kupatadze", gender: .male, age: 31, hobby: "Playing tennis and painting.", avatarImageName: "Male3"),
    People(name: "Gvantsa Gvagvalia", gender: .female, age: 35, hobby: "Sculpting and gardening.", avatarImageName: "Female4"),
    People(name: "Vano Kvakhadze", gender: .male, age: 38, hobby: "Fishing and playing chess.", avatarImageName: "Male1")
]
