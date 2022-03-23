//
//  QuickLookViewController.swift
//  ArQuickLookDemo
//
//  Created by Vaibhu Thakkar on 23/03/22.
//

import UIKit
import QuickLook

class QuickLookViewController: UIViewController {
    
    //MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    //MARK: - IBActions
    @IBAction func actionOpenQuickLook(_ sender: Any) {
        let previewController = QLPreviewController()
        previewController.dataSource = self
        present(previewController, animated: true, completion: nil)
    
    }
    
}

//MARK: - Extension QLPreview DataSource
extension QuickLookViewController: QLPreviewControllerDataSource {
    func numberOfPreviewItems(in controller: QLPreviewController) -> Int {
        return 1
    }
    
    func previewController(_ controller: QLPreviewController, previewItemAt index: Int) -> QLPreviewItem {
        guard let path = Bundle.main.path(forResource: "toy_drummer", ofType: "usdz") else { fatalError("Couldn't find the supported input file.") }
        let url = URL(fileURLWithPath: path)
        
        return url as QLPreviewItem
    }
}
