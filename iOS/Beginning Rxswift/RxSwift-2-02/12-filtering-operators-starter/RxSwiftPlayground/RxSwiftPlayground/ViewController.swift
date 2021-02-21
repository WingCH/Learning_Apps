//
//  ViewController.swift
//  RxSwiftPlayground
//
//  Created by Scott Gardner on 10/15/17.
//  Copyright © 2017 Scott Gardner. All rights reserved.
//

import UIKit
import RxSwift

class ViewController: UIViewController {
  
  override func viewDidLoad() {
    super.viewDidLoad()
    let disposeBag = DisposeBag()
    let cannedProjects = PublishSubject<String>()
    
    example(of: "ignoreElements") {
      cannedProjects
        .ignoreElements()
        .subscribe{
          print($0)
        }
        .disposed(by: disposeBag)
      
      cannedProjects.onNext("aaaaa")
      cannedProjects.onNext("bbbbb")
      cannedProjects.onNext("ccccc")
      
      cannedProjects.onCompleted()
    }
    
    example(of: "elementAt") {
      let disposeBag = DisposeBag()
      let quotes = PublishSubject<String>()
      
      quotes
        .elementAt(1)
        .subscribe(onNext: {
          print($0)
        })
        .disposed(by: disposeBag)
      
      quotes.onNext(mayTheOdds)
      quotes.onNext(liveLongAndProsper)
      quotes.onNext(mayTheForce)
    }
    
    example(of: "filter") {
      let disposeBag = DisposeBag()
      Observable.from(tomatometerRatings)
        .filter { movie -> Bool in
          movie.rating > 90
        }
        .subscribe(onNext:{
          print($0)
        })
        .disposed(by: disposeBag)
    }
    
    example(of: "takeWhile") {
      let disposeBag = DisposeBag()
      Observable.from(tomatometerRatings)
        .takeWhile{ movie in
          movie.rating != 85
        }
        .subscribe(onNext:{
          print($0)
        })
        .disposed(by: disposeBag)
    }
    
    example(of: "takeUntil") {
      let disposeBag = DisposeBag()
      let subject = PublishSubject<String>()
      let trigger = PublishSubject<Void>()
      
      subject
        .takeUntil(trigger)
        .subscribe(onNext: {
          print($0)
        })
        .disposed(by: disposeBag)
      
      subject.onNext(episodeI.title)
      subject.onNext(episodeII.title)
      subject.onNext(episodeIII.title)
      
      trigger.onNext(())
      
      subject.onNext(episodeIV.title)
    }
    
    example(of: "skipWhile") {
      let disposeBag = DisposeBag()
      Observable.from(tomatometerRatings)
        .skipWhile{ movie in
          movie.rating < 90
        }
        .subscribe(onNext:{
          print($0)
        })
        .disposed(by: disposeBag)
    }
    
    example(of: "skipUntil") {
      let disposeBag = DisposeBag()
      let subject = PublishSubject<String>()
      let trigger = PublishSubject<Void>()
      
      subject
        .skipUntil(trigger)
        .subscribe(onNext: {
          print($0)
        })
        .disposed(by: disposeBag)
      
      subject.onNext(episodeI.title)
      subject.onNext(episodeII.title)
      subject.onNext(episodeIII.title)
      
      trigger.onNext(())
      
      subject.onNext(episodeIV.title)
    }
    
    example(of: "distinctUntilChanged") {
      let disposeBag = DisposeBag()
      Observable<Droid>.of(.R2D2, .C3PO, .C3PO, .R2D2)
        .distinctUntilChanged()
        .subscribe(onNext:{
          print($0)
        })
        .disposed(by: disposeBag)
      
    }
    
  }
  
  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }
  
  
}

public func example(of description: String, action: () -> Void) {
  print("\n--- Example of:", description, "---")
  action()
}

public let landOfDroids = "Land of Droids"
public let wookieWorld = "Wookie World"
public let detours = "Detours"

public let mayTheOdds = "And may the odds be ever in your favor"
public let liveLongAndProsper = "Live long and prosper"
public let mayTheForce = "May the Force be with you"

public let episodeI = (title: "The Phantom Menace", rating: 55)
public let episodeII = (title: "Attack of the Clones", rating: 66)
public let episodeIII = (title: "Revenge of the Sith", rating: 79)
public let rogueOne = (title: "Rogue One", rating: 85)
public let episodeIV = (title: "A New Hope", rating: 93)
public let episodeV = (title: "The Empire Strikes Back", rating: 94)
public let episodeVI = (title: "Return Of The Jedi", rating: 80)
public let episodeVII = (title: "The Force Awakens", rating: 93)
public let episodeVIII = (title: "The Last Jedi", rating: 91)
public let tomatometerRatings = [episodeI, episodeII, episodeIII, rogueOne, episodeIV, episodeV, episodeVI, episodeVII, episodeVIII]

public enum Droid {
  case C3PO, R2D2
}
