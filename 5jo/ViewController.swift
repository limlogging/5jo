//
//  ViewController.swift
//  5jo
//
//  Created by imhs on 2/28/24.
//

import UIKit

//table view 사용 시 uitableviewdatasource 사용해야함
class ViewController: UIViewController, UITableViewDataSource {
    //버튼
    @IBOutlet weak var homeButton: UIButton!
    @IBOutlet weak var joButton: UIButton!
    @IBOutlet weak var kimButton: UIButton!
    @IBOutlet weak var parkButton: UIButton!
    @IBOutlet weak var seoButton: UIButton!
    @IBOutlet weak var limButton: UIButton!
 
    //레이블
    @IBOutlet weak var nameLable: UILabel!      //이름
    @IBOutlet weak var jobLable: UILabel!       //직업
    @IBOutlet weak var introduceLable: UILabel! //인사
    @IBOutlet weak var locationLable: UILabel!  //사는곳
    @IBOutlet weak var foodLable: UILabel!      //좋아하는음식
    @IBOutlet weak var hobbyLable: UILabel!     //취미
    
    //뷰
    @IBOutlet weak var mainView: UIView!
    @IBOutlet weak var detailView: UIView!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var faceImage: UIImageView!
    
    var profilesArray: [Profile] = [
        Profile(profileImage: UIImage(named: "kim"), profileColor: #colorLiteral(red: 0.9545140862, green: 0.8511986136, blue: 0.5914947391, alpha: 1), profileName: "김건응", profileRole: "팀장", profileMbti: "INFP", profileLocation: "노원구", profileFood: "팥빙수, 알리오올리오", profileHobby: "게임, 산책"),
        Profile(profileImage: UIImage(named: "park"), profileColor: #colorLiteral(red: 0.5936440229, green: 0.6488019824, blue: 0.9519456029, alpha: 1), profileName: "박중권", profileRole: "팀원", profileMbti: "INFP", profileLocation: "인천", profileFood: "햄버거", profileHobby: "축구, 작곡"),
        Profile(profileImage: UIImage(named: "seo"), profileColor: #colorLiteral(red: 0.5943186283, green: 0.886159122, blue: 0.9545708299, alpha: 1), profileName: "서수영", profileRole: "팀원", profileMbti: "INTP", profileLocation: "의정부", profileFood: "햄버거, 떡볶이", profileHobby: "등산, 게임"),
        Profile(profileImage: UIImage(named: "lim"), profileColor: #colorLiteral(red: 0.6185904741, green: 0.9538126588, blue: 0.5911285877, alpha: 1), profileName: "임형섭", profileRole: "팀원", profileMbti: "INTJ", profileLocation: "부산", profileFood: "두부 많은 청국장", profileHobby: "넷플릭스보기")
    ]
    override func viewDidLoad() {
        super.viewDidLoad()
        self.homeButton.layer.cornerRadius = 35
        self.joButton.layer.cornerRadius = 35
        self.kimButton.layer.cornerRadius = 35
        self.parkButton.layer.cornerRadius = 35
        self.seoButton.layer.cornerRadius = 35
        self.limButton.layer.cornerRadius = 35
        self.detailView.layer.cornerRadius = 10
        
        mainView.backgroundColor = #colorLiteral(red: 0.9526234269, green: 0.5911086798, blue: 0.5913497806, alpha: 1)
        nameLable.text = "5조"
        jobLable.text = ""
        introduceLable.text = "안녕하세요!!!! 5조입니다."
                
        //table view 관련 데이터소스 선언 후 셀프 (뷰컨트롤러) 사용
        tableView.dataSource = self
    }
    
    //sender가 Any가 아니라 UIButton으로해야 title 불러와짐..
    @IBAction func nameButton(_ sender: UIButton) {
        if sender.currentTitle == "5조" || sender.currentTitle == "Home" {
            mainView.backgroundColor =  #colorLiteral(red: 0.9526234269, green: 0.5911086798, blue: 0.5913497806, alpha: 1)
            faceImage.image = UIImage.jo
            nameLable.text = "5조"
            jobLable.text = ""
            introduceLable.text = "안녕하세요!!!! 5조입니다."
            locationLable.text = ""
            foodLable.text = ""
            hobbyLable.text = ""
        } else {
            for i in 0...profilesArray.count - 1 {
                if profilesArray[i].profileName == sender.currentTitle {
                    //배경화면
                    mainView.backgroundColor = profilesArray[i].profileColor
                    //사진
                    faceImage.image = profilesArray[i].profileImage
                    //이름
                    nameLable.text = profilesArray[i].profileName
                    jobLable.text = "iOS Developer"
                    //소개
                    introduceLable.text = "안녕하세요!!!! \(profilesArray[i].profileName)입니다."
                    //사는곳
                    locationLable.text = "사는 곳: " + profilesArray[i].profileLocation
                    //음식
                    foodLable.text = "좋아하는 음식: " + profilesArray[i].profileFood
                    //취미
                    hobbyLable.text = "취미: " + profilesArray[i].profileHobby
                }
            }
        }
        /*
        if sender.currentTitle == "김건응" {
            mainView.backgroundColor = #colorLiteral(red: 0.9545140862, green: 0.8511986136, blue: 0.5914947391, alpha: 1)
            nameLable.text = "김건응"
            introduceLable.text = "안녕하세요!!!! 5조 김건응입니다."
            faceImage.image = UIImage.kim
        } else if sender.currentTitle == "박중권" {
            mainView.backgroundColor = #colorLiteral(red: 0.5936440229, green: 0.6488019824, blue: 0.9519456029, alpha: 1)
            nameLable.text = "박중권"
            introduceLable.text = "안녕하세요!!!! 5조 박중권입니다."
            faceImage.image = UIImage.park
        } else if sender.currentTitle == "서수영" {
            mainView.backgroundColor = #colorLiteral(red: 0.5943186283, green: 0.886159122, blue: 0.9545708299, alpha: 1)
            nameLable.text = "서수영"
            introduceLable.text = "안녕하세요!!!! 5조 서수영입니다."
            faceImage.image = UIImage.seo
        } else if sender.currentTitle == "임형섭" {
            mainView.backgroundColor = #colorLiteral(red: 0.6185904741, green: 0.9538126588, blue: 0.5911285877, alpha: 1)
            faceImage.image = UIImage.lim
            nameLable.text = "임형섭"
            introduceLable.text = "안녕하세요!!!! 5조 임형섭입니다."
            
        } else {
            mainView.backgroundColor = #colorLiteral(red: 0.9526234269, green: 0.5911086798, blue: 0.5913497806, alpha: 1)
            nameLable.text = "5조"
            introduceLable.text = "안녕하세요!!!! 5조입니다."
            faceImage.image = UIImage.jo
        }
        */
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //cell 개수 리턴
        return profilesArray.count
    }
    
    //cell 데이터 보기
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        //as! 저게 뭔지.. 복붙 코드라 정확한 의미 확인 필요함
        let cell = tableView.dequeueReusableCell(withIdentifier: "TableViewCell", for: indexPath) as! TableViewCell
               
        cell.nameImageView.image = profilesArray[indexPath.row].profileImage //프사
        cell.nameLabel.text = profilesArray[indexPath.row].profileName  //이름
        cell.roleLable.text = profilesArray[indexPath.row].profileRole  //역할
        cell.mbtiLabel.text = profilesArray[indexPath.row].profileMbti  //MBTI
        
        return cell
    }
    
    /*
    @IBAction func homeButton(_ sender: Any) {
        mainView.backgroundColor = #colorLiteral(red: 0.9526234269, green: 0.5911086798, blue: 0.5913497806, alpha: 1)
        nameLable.text = "5조"
        introduceLable.text = "안녕하세요. 5조입니다."
    }
    @IBAction func joButton(_ sender: Any) {
        mainView.backgroundColor = #colorLiteral(red: 0.9526234269, green: 0.5911086798, blue: 0.5913497806, alpha: 1)
        nameLable.text = "5조"
        introduceLable.text = "안녕하세요. 5조입니다."
    }
    @IBAction func kimButton(_ sender: Any) {
        mainView.backgroundColor = #colorLiteral(red: 0.9545140862, green: 0.8511986136, blue: 0.5914947391, alpha: 1)
        nameLable.text = "김건응"
        introduceLable.text = "안녕하세요. 5조 김건응입니다."
    }
    @IBAction func parkButton(_ sender: Any) {
        mainView.backgroundColor = #colorLiteral(red: 0.5936440229, green: 0.6488019824, blue: 0.9519456029, alpha: 1)
        nameLable.text = "박중권"
        introduceLable.text = "안녕하세요. 5조 박중권입니다."
    }
    @IBAction func seoButton(_ sender: Any) {
        mainView.backgroundColor = #colorLiteral(red: 0.5943186283, green: 0.886159122, blue: 0.9545708299, alpha: 1)
        nameLable.text = "서수영"
        introduceLable.text = "안녕하세요. 5조 서수영입니다."
    }
    @IBAction func limButton(_ sender: Any) {
        mainView.backgroundColor = #colorLiteral(red: 0.6185904741, green: 0.9538126588, blue: 0.5911285877, alpha: 1)
        nameLable.text = "임형섭"
        introduceLable.text = "안녕하세요. 5조 임형섭입니다."
        faceImage.image = UIImage.lim
    }
    */
}

