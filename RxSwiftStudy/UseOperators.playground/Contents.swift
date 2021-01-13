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

func zipExample1(){
    //두 Observable의 값들을 한쌍씩 묶어서 내려보낸다.
    //쌍이 맞지 않을땐 값이 내려가지 않는다.
    
    let XOB = Observable.from(["XVal1","XVal2","XVal3","XVal4"])
    let YOB = Observable.from(["YVal1","YVal2","YVal3"])
    
    Observable.zip(XOB, YOB)
        .subscribe(onNext: { res in
            print(res)
        })
    
    /*
     ------result------
     
     ("XVal1", "YVal1")
     ("XVal2", "YVal2")
     ("XVal3", "YVal3")
     */
}



// MARK: - Execution

zipExample1()

