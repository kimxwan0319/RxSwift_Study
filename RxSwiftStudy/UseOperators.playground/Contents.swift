import UIKit
import RxSwift

var disposeBag = DisposeBag()

func justExample1(){
    Observable.just("value")
        .subscribe(onNext: { res in
            print(res)
        }, onCompleted: {
            print("com")
        })
        .disposed(by: disposeBag)
}

func fromExample1(){
    Observable.from(["val1","val2"])
        .subscribe(onNext: { res in
            print(res)
        }, onCompleted: {
            print("com")
        })
        .disposed(by: disposeBag)
}




// MARK: - Execution

fromExample1()

