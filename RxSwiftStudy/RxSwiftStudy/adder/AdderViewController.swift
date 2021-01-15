//
//  AdderViewController.swift
//  RxSwiftStudy
//
//  Created by 김수완 on 2021/01/15.
//

import UIKit
import RxSwift
import RxCocoa

class AdderViewController: UIViewController {

    var disposeBag = DisposeBag()
    
    @IBOutlet weak var value1Field: UITextField!
    @IBOutlet weak var value2Field: UITextField!
    @IBOutlet weak var value3Field: UITextField!
    @IBOutlet weak var resultLable: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        bindUI()
    }
    
    func bindUI(){
        let value1InputOb = value1Field.rx.text.orEmpty.map{Int($0) ?? 0}.asObservable()
        let value2InputOb = value2Field.rx.text.orEmpty.map{Int($0) ?? 0}.asObservable()
        let value3InputOb = value3Field.rx.text.orEmpty.map{Int($0) ?? 0}.asObservable()
        
        Observable.combineLatest(value1InputOb, value2InputOb, value3InputOb){$0 + $1 + $2}
            .map{String($0)}
            .subscribe(onNext: { res in
                self.resultLable.text = res
            })
            .disposed(by: disposeBag)
    }

}
