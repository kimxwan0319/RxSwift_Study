import UIKit
import RxSwift

func justExample1(){
    Observable.just("value")
        .subscribe(onNext: { str in
            print(str)
        })
}


// MARK: - Execution

justExample1()

