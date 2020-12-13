//
//  ViewController.swift
//  try.Expanding.TableView
//
//  Created by CHAN Hong Wing on 3/12/2020.
//

import UIKit

// https://www.youtube.com/watch?v=ClrSpJ3txAs
struct CellData {
    var opened = Bool()
    var title = String()
    var sectionData = [String]()
}

class ViewController: UITableViewController {

    var tableViewData = [CellData]()

    override func viewDidLoad() {
        super.viewDidLoad()

        tableViewData = [CellData(opened: false, title: "Title1", sectionData: ["Cell1","Cell2","Cell3"]),
                         CellData(opened: false, title: "Title2", sectionData: ["Cell1","Cell2","Cell3"]),
                         CellData(opened: false, title: "Title3", sectionData: ["Cell1","Cell2","Cell3"]),
                         CellData(opened: false, title: "Title4", sectionData: ["Cell1","Cell2","Cell3"]),
                         CellData(opened: false, title: "Title4", sectionData: ["Cell1","Cell2","Cell3"]),
                         CellData(opened: false, title: "Title4", sectionData: ["Cell1","Cell2","Cell3"]),
                         CellData(opened: false, title: "Title4", sectionData: ["Cell1","Cell2","Cell3"]),
                         CellData(opened: false, title: "Title4", sectionData: ["Cell1","Cell2","Cell3"]),
                         CellData(opened: false, title: "Title4", sectionData: ["Cell1","Cell2","Cell3"]),
                         CellData(opened: false, title: "Title4", sectionData: ["Cell1","Cell2","Cell3"]),
                         CellData(opened: false, title: "Title4", sectionData: ["Cell1","Cell2","Cell3"]),
                         CellData(opened: false, title: "Title4", sectionData: ["Cell1","Cell2","Cell3"]),
                         CellData(opened: false, title: "Title4", sectionData: ["Cell1","Cell2","Cell3"]),
                         CellData(opened: false, title: "Title4", sectionData: ["Cell1","Cell2","Cell3"]),
                         CellData(opened: false, title: "Title4", sectionData: ["Cell1","Cell2","Cell3"]),
                         CellData(opened: false, title: "Title4", sectionData: ["Cell1","Cell2","Cell3"]),
                         CellData(opened: false, title: "Title4", sectionData: ["Cell1","Cell2","Cell3"]),
                         CellData(opened: false, title: "Title4", sectionData: ["Cell1","Cell2","Cell3"])
        ]
    }


    override func numberOfSections(in tableView: UITableView) -> Int {
        return tableViewData.count
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if tableViewData[section].opened == true {
            return tableViewData[section].sectionData.count + 1
        }else{
            return 1
        }
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let dataIndex = indexPath.row - 1
        if indexPath.row == 0 {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell") else {
                return UITableViewCell()
            }
            cell.textLabel?.text = tableViewData[indexPath.section].title
            return cell
        }else {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell") else {
                return UITableViewCell()
            }
            cell.textLabel?.text = tableViewData[indexPath.section].sectionData[dataIndex]
            return cell
        }
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.row == 0 {
            if tableViewData[indexPath.section].opened == true {
                tableViewData[indexPath.section].opened = false
                let sections = IndexSet.init(integer: indexPath.section)
                tableView.reloadSections(sections, with: .fade)


            }else{
                tableViewData[indexPath.section].opened = true
                let sections = IndexSet.init(integer: indexPath.section)
                tableView.reloadSections(sections, with: .fade)
               
            }
        }
    }

    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let view = UIView()
        view.backgroundColor = .red
        return view
    }

    override func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        let view = UIView()
        view.backgroundColor = .blue
        return view
    }

//    override func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
//        return 10
//    }
}

