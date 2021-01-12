import UIKit
import RxSwift

var disposeBag = DisposeBag()

func justExample1(){
    Observable.just("value")
        .subscribe(onNext: { res in
            print(res)
        })
        .disposed(by: disposeBag)
}

func fromExample1(){
    Observable.from(["val1","val2"])
        .subscribe(onNext: { res in
            print(res)
        })
        .disposed(by: disposeBag)
}

func mapExample1(){
    Observable.just(["val1","val2"])
        .map{$0.count}
        .subscribe(onNext: { res in
            print(res)
        })
}

func filterExample1(){
    Observable.just(["val1","val2"])
        .map{$0.count}
        .filter{$0 % 2 == 0}
        .subscribe(onNext: { res in
            print("값의 갯수가 짝수입니다.")
        })
}




// MARK: - Execution

filterExample1()

