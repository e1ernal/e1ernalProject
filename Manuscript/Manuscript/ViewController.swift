//
//  ViewController.swift
//  Manuscript
//
//  Created by DMITRY on 28/02/2020.
//  Copyright © 2020 Dmitry Smirnykh. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func viewWillAppear(_ animated: Bool) {
        outputLifeCycle(fromState: "disappearing/ed", toState: "appearing")
    }
    
    override func viewDidAppear(_ animated: Bool) {
        outputLifeCycle(fromState: "appearing", toState: "appeared")
    }
    
    override func viewWillLayoutSubviews() {
        outputLifeCycle(fromState: "appearing", toState: "appeared")
    }
    
    override func viewDidLayoutSubviews() {
        outputLifeCycle(fromState: "appearing", toState: "appeared")
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        outputLifeCycle(fromState: "appearing", toState: "disappearing")
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        outputLifeCycle(fromState: "disappearing", toState: "disappeared")
    }
}
