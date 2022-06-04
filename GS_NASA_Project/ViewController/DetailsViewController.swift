//
//  DetailsViewController.swift
//  GS_NASA_Project
//
//  Created by Aishwarya Rai on 04/06/22.
//

import UIKit

class DetailsViewController: UIViewController {

    @IBOutlet weak var lblCopyright: UILabel!
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var lblExplanation: UILabel!
    var currentDateModel: APIResponse?

    override func viewDidLoad() {
        super.viewDidLoad()
        lblCopyright.text = currentDateModel?.copyright
        lblTitle.text = currentDateModel?.title
        lblExplanation.text = currentDateModel?.explanation
    }
    

    @IBAction func dismissView() {
        dismiss(animated: true, completion: nil)
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
