//
//  HelloViewController.swift
//  RxSwiftStudy
//
//  Created by 김수완 on 2021/01/10.
//

import UIKit
import RxSwift
import RxCocoa

class HelloViewController: UIViewController {

    var disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        bindUI()
    }
    
    @IBOutlet weak var helloLable: UILabel!
    @IBOutlet weak var nameField: UITextField!
    
    func bindUI(){
        nameField.rx.text.orEmpty
            .map{
                if($0 == "") {
                    return "이름을 입력해주세요."
                } else {
                    return "안녕하세요, \($0)님!"
                }
                
            }
            .subscribe(onNext: { greating in
                self.helloLable.text = greating
            })
            .disposed(by: disposeBag)
    }
    

}
