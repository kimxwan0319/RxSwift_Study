import UIKit
import RxSwift

var disposeBag = DisposeBag()

func justExample1(){
    //값을 한번에 내려보낼때 사용
    
    Observable.just("value")
        .subscribe(onNext: { res in
            print(res)
        })
        .disposed(by: disposeBag)
    
    /*
     ------result------
     
     value
     
     */
}

func fromExample1(){
    //배열로 들어온 값들을 한개씩 내려보낸다.
    
    Observable.from(["val1","val2"])
        .subscribe(onNext: { res in
            print(res)
        })
        .disposed(by: disposeBag)
    
    /*
     ------result------
     
     val1
     val2
     
     */
}

func mapExample1(){
    //내려오는 값을 변화시킬 수 있다.
    
    Observable.just(["val1","val2"])
        .map{$0.count}
        .subscribe(onNext: { res in
            print(res)
        })
        .disposed(by: disposeBag)
    
    /*
     ------result------
     
     2
     
     */
}

func filterExample1(){
    //filter의 식이 참일때만 onNext로 값이 전달된다.
    
    Observable.just(["val1","val2"])
        .map{$0.count}
        .filter{$0 % 2 == 0}
        .subscribe(onNext: { res in
            print("값의 갯수가 짝수입니다.")
        })
        .disposed(by: disposeBag)
    
    /*
     ------result------
     
     값의 갯수가 짝수입니다.
     
     */
}

func mergeExample1(){
    //두 Observable의 값들을 차례대로 내린다.
    
    let XOB = Observable.from(["XVal1","XVal2","XVal3","XVal4"])
    let YOB = Observable.from(["YVal1","YVal2","YVal3"])
    
    Observable.merge(XOB, YOB)
        .subscribe(onNext: { res in
            print(res)
        })
    
    /*
     ------result------
     
     XVal1
     YVal1
     XVal2
     YVal2
     XVal3
     YVal3
     XVal4
     
     */
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

func combinelatestExample1(){
    //zip과 달리 쌍이 맞지 않을때 가장 최근의 값과 쌍을맺어 내려보낸다.
    
    let XOB = Observable.from(["XVal1","XVal2","XVal3","XVal4"])
    let YOB = Observable.from(["YVal1","YVal2","YVal3"])
    
    Observable.combineLatest(XOB, YOB)
        .subscribe(onNext: { res in
            print(res)
        })
    
    /*
     ------result------
     
     ("XVal1", "YVal1")
     ("XVal2", "YVal1")
     ("XVal2", "YVal2")
     ("XVal3", "YVal2")
     ("XVal3", "YVal3")
     ("XVal4", "YVal3")
     
     */
}



// MARK: - Execution

filterExample1()

