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
        .disposed(by: disposeBag)
}

func filterExample1(){
    Observable.just(["val1","val2"])
        .map{$0.count}
        .filter{$0 % 2 == 0}
        .subscribe(onNext: { res in
            print("값의 갯수가 짝수입니다.")
        })
        .disposed(by: disposeBag)
}

func mergeExample1(){
    let XOB = Observable.from(["XVal1","XVal2","XVal3","XVal4"])
    let YOB = Observable.from(["YVal1","YVal2","YVal3"])
    
    Observable.merge(XOB, YOB)
        .subscribe(onNext: { res in
            print(res)
        })
}




// MARK: - Execution

mergeExample1()

