import UIKit
import RxSwift

var disposeBag = DisposeBag()

func justExample1(){
    Observable.just("value")
        .subscribe(onNext: { str in
            print(str)
        })
        .disposed(by: disposeBag)
}


// MARK: - Execution

justExample1()

