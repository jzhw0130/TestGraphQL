//
//  ViewController.swift
//  TestGraphGL
//
//  Created by jing on 5/11/17.
//  Copyright © 2017 jing. All rights reserved.
//

import UIKit
import Apollo

let apollo = ApolloClient(url: URL(string: "http://localhost:8080/graphql")!)


class ViewController: UIViewController {

    var watcher: GraphQLQueryWatcher<AllPostsQuery>?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        NSLog("view did load")
//        apollo.cacheKeyForObject = { $0["id"] }
        
        
        //swift from demo  :  https://github.com/apollographql/frontpage-ios-app
//        watcher = apollo.watch(query: AllPostsQuery()) { (result, error) in
//            if let error = error {
//                NSLog("Error while fetching query: \(error.localizedDescription)")
//                return
//            }
//            NSLog("\(result?.data?.posts)")
//        }
        
        //Objective C by myself
        let myGraphglInstance = MyGraphGL()
        myGraphglInstance.commandGetInfo()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

