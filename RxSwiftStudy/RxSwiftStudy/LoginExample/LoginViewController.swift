//
//  LoginViewController.swift
//  RxSwiftStudy
//
//  Created by 김수완 on 2021/01/10.
//

import UIKit
import RxCocoa
import RxSwift

class LoginViewController: UIViewController {

    var disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        bindUI()
    }

    @IBOutlet weak var idField: UITextField!
    @IBOutlet weak var pwdFiled: UITextField!
    @IBOutlet weak var loginBtn: UIButton!
    @IBOutlet weak var idValidView: UIView!
    @IBOutlet weak var pwdValidView: UIView!
    
    
    func bindUI(){
        //input
        let idInputOb = idField.rx.text.orEmpty.asObservable()
        let idValidOb = idInputOb.map(checkEmailValid)
        
        let pwdInputOb = pwdFiled.rx.text.orEmpty.asObservable()
        let pwdValidOb = pwdInputOb.map(checkPasswordValid)
        
        //output
        idValidOb.subscribe(onNext: { b in
            self.idValidView.isHidden = b
        }).disposed(by: disposeBag)
        pwdValidOb.subscribe(onNext: { b in
            self.pwdValidView.isHidden = b
        }).disposed(by: disposeBag)
        
        Observable.combineLatest(idValidOb, pwdValidOb, resultSelector: {$0 && $1})
            .subscribe(onNext: { b in
                self.loginBtn.isEnabled = b
            }).disposed(by: disposeBag)
    }
    
    private func checkEmailValid(_ email: String) -> Bool {
        return email.contains("@") && email.contains(".")
    }

    private func checkPasswordValid(_ password: String) -> Bool {
        return password.count > 5
    }
}
