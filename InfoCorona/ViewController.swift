//
//  ViewController.swift
//  InfoCorona
//
//  Created by Shivam Rishi on 25/03/20.
//  Copyright © 2020 Shivam Rishi. All rights reserved.
//ca-app-pub-9753152099099537~7945333541
//ca-app-pub-9753152099099537/4076927649

import UIKit
import Charts
import TinyConstraints
import PopupDialog
import SwiftRater
import GoogleMobileAds

class ViewController: UIViewController,ChartViewDelegate,GADInterstitialDelegate {
    @IBOutlet weak var sV: UIScrollView!
    var showAd:Bool = true
    @IBOutlet weak var vw: UIView!
    var interstitial: GADInterstitial!
    @IBOutlet weak var deathCasesLabel: UILabel!
    @IBOutlet weak var quoteLabel: UILabel!
    lazy var barChart : BarChartView = {
              let barview = BarChartView()
              barview.backgroundColor = .black
              
             
              
              barview.doubleTapToZoomEnabled = false
              barview.rightAxis.enabled = false
           
              
          
              
              
              
              barview.xAxis.labelPosition = . bottom
              barview.xAxis.labelTextColor = .white
              barview.xAxis.axisLineColor = .white
              barview.xAxis.labelFont = .boldSystemFont(ofSize: 12)
              barview.xAxis.drawGridLinesEnabled = false
              barview.xAxis.labelRotationAngle = -90.0
              barview.xAxis.granularity = 10
              barview.xAxis.granularityEnabled = true
              barview.xAxis.setLabelCount(30, force: false)
              barview.xAxis.axisMinimum = -0.5
              
           
              
              
              let yAxis = barview.leftAxis
              yAxis.labelTextColor = .white
              yAxis.axisLineColor = .white
              yAxis.labelFont = .boldSystemFont(ofSize: 12)
              yAxis.drawGridLinesEnabled = false
              
              barview.animate(xAxisDuration: 8)
              
              return barview
          }()
          

    @IBOutlet weak var totalCasesLabel: UILabel!
    @IBOutlet weak var activeCasesLabel: UILabel!
    @IBOutlet weak var recoveredCasesLabel: UILabel!
    
    @IBOutlet weak var latestUpdateLabel: UILabel!
    
 
    
    @IBOutlet weak var graphView: UIView!
    
    
    
    override func viewDidAppear(_ animated: Bool) {
           super.viewDidAppear(animated)
        SwiftRater.check(host: self)
         latestUpdateLabel.blink()
    
    
    }
    
  

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.

        
//        self.createAndLoadInterstitial()
//  viewAd()
      
        
        if(self.view.frame.height < self.vw.frame.size.height)
        {
           sV.contentSize = CGSize(width: self.view.frame.size.width, height: self.view.frame.size.height + 200)
                   sV.isScrollEnabled = true
            
        } else {
        
            
             sV.isScrollEnabled = false;
    
        }
        
        quoteLabel.text = "\"TOGETHER WE STAND,\n TOGETHER WE FIGHT\""
        quoteLabel.numberOfLines = 0
        ss()
          // view.addSubview(barChart)
        graphView.addSubview(barChart)
        barChart.centerInSuperview()
                barChart.width(to: view)
                barChart.heightToWidth(of: view)
                sss()
                barChart.extraTopOffset = 10.0
                barChart.extraBottomOffset = -50.0
            
                barChart.noDataText = "Please connect to your internet"
                              barChart.noDataTextColor = .white
                barChart.legend.textColor = .white
                barChart.legend.font = UIFont(name: "Verdana", size: 16.0)!
        //        setChart(dataPoints: months, values: unitsSold)
                
                barChart.delegate = self
    }
 
    
    
    
    func ss()
    {
        let headers = [
             "x-rapidapi-host": "coronavirus-monitor.p.rapidapi.com",
             "x-rapidapi-key": "7158f49c49msh5c09f6a1fd009a8p126e92jsn4296e4e2893d"
         ]
        let request = NSMutableURLRequest(url: NSURL(string: "https://coronavirus-monitor.p.rapidapi.com/coronavirus/latest_stat_by_country.php?country=india")! as URL,
                                                cachePolicy: .useProtocolCachePolicy,
                                            timeoutInterval: 10.0)
        request.httpMethod = "GET"
        request.allHTTPHeaderFields = headers

        let session = URLSession.shared
        let dataTask = session.dataTask(with: request as URLRequest, completionHandler: { (data, response, error) -> Void in
            if (error != nil) {
                print(error)
            } else {
                if let safeData = data {
                    DispatchQueue.main.async {
                        
                    
                    self.parseJSON(infoData: safeData)
                    
                    

                    }
                }
            }
        })

        dataTask.resume()
    }

    func parseJSON(infoData: Data)
    {
        let decoder = JSONDecoder()
        
        do
        {
            let decodedData = try decoder.decode(dataModel.self, from: infoData)
            let mainObject = decodedData.latest_stat_by_country[0]

            totalCasesLabel.text  = mainObject.total_cases
            activeCasesLabel.text = mainObject.active_cases
            recoveredCasesLabel.text = mainObject.total_recovered
            deathCasesLabel.text = mainObject.total_deaths
        }
        
        catch
        {
print(error)
        }
    }
    
    
    
    
    //gRAPH
    
    

       
    func sss()
    {
        let headers = [
                   "x-rapidapi-host": "coronavirus-monitor.p.rapidapi.com",
                   "x-rapidapi-key": "7158f49c49msh5c09f6a1fd009a8p126e92jsn4296e4e2893d"
               ]
        let request = NSMutableURLRequest(url: NSURL(string: "https://coronavirus-monitor.p.rapidapi.com/coronavirus/cases_by_particular_country.php?country=india")! as URL,
                                                cachePolicy: .useProtocolCachePolicy,
                                            timeoutInterval: 10.0)
        request.httpMethod = "GET"
        request.allHTTPHeaderFields = headers

        let session = URLSession.shared
        let dataTask = session.dataTask(with: request as URLRequest, completionHandler: { (data, response, error) -> Void in
            if (error != nil) {
                print(error)
            } else {
                  if let safeData = data {
                                   DispatchQueue.main.async {
                                       
                                   
                                   self.parseJSONN(infoData: safeData)

                                   }
                               }
            }
        })

        dataTask.resume()
        
        }
      
            func parseJSONN(infoData: Data)
            {
                let decoder = JSONDecoder()
                
                do
                {
                    let decodedData = try decoder.decode(dm.self, from: infoData)
               
                  
                 
                    var dataEntries: [BarChartDataEntry] = []
                    
                    var dates: [String] = []
                    var count: [Int] = []
            
                    for i in 0..<decodedData.stat_by_country.count {
                        
                        
                        
                             var mainObject = decodedData.stat_by_country[i]
                       
                         let formatter = DateFormatter()
                                                   formatter.dateFormat = "yyyy-MM-dd HH:mm:ss.SSS'+0530'"

                                               let newformat = DateFormatter()
                                               newformat.dateFormat = "dd MMM yyyy"
                       
                       
                                    if let dat = formatter.date(from: mainObject.record_date)
                                    {
                                       
                                     dates.append(newformat.string(from: dat))
                                        count.append(i)
                                      
                                    } else {
                                        
                        }
                        
                     
                      
    
                        
                        let dataEntry = BarChartDataEntry(x: Double(i), y:Double(mainObject.total_cases.replacingOccurrences(of: ",", with: "")) as! Double)
                        dataEntries.append(dataEntry)
                       
                        
                  
                       }
                
                    
                    let formatter = DateFormatter()
                                                                      formatter.dateFormat = "yyyy-MM-dd HH:mm:ss.SSS'+0530'"
                    
                    formatter.timeZone = TimeZone(abbreviation: "UTC")
                                                                  let newformat = DateFormatter()
                    
                    newformat.dateFormat = "MMM d, h:mm a"
                      newformat.timeZone = TimeZone.current
                    let stat = count.count-1
                    if let dat = formatter.date(from: decodedData.stat_by_country[stat].record_date)
                                                     {
                   
                                                         latestUpdateLabel.text = "Last updated on: \(newformat.string(from: dat))"
                    } else {
                        
                    }
                    barChart.xAxis.axisMaximum = Double(decodedData.stat_by_country.count)-0.5
                     barChart.xAxis.valueFormatter = IndexAxisValueFormatter(values: dates)
                       
                    
                    let chartDataSet = BarChartDataSet(entries: dataEntries, label: "Total Cases in India")
                        chartDataSet.setColor(.systemOrange)
                   
                       let chartData = BarChartData(dataSet: chartDataSet)
                    chartData.barWidth = 3
                    
                    

                    let marker = XYMarkerView(color: UIColor(white: 180/250, alpha: 1),
                                              font: .systemFont(ofSize: 12),
                                              textColor: .white,
                                              insets: UIEdgeInsets(top: 8, left: 8, bottom: 20, right: 8),
                                              xAxisValueFormatter: barChart.xAxis.valueFormatter!)
                    marker.chartView = barChart
                    marker.minimumSize = CGSize(width: 80, height: 40)
                    barChart.marker = marker
                    
     
                    barChart.data = chartData
                       
//                   viewAd()
               
                }
                    
                
                
                catch
                {
        print(error)
                }
                
            }
      
//
//      func createAndLoadInterstitial()  {
//
//         interstitial = GADInterstitial(adUnitID: "")
//           interstitial.delegate = self
//
//            interstitial.load(GADRequest())
//
//
//      }
//
//    func viewAd()
//    {
//        print("Waiting for timer to show Ad")
//            if showAd
//                            {
//                            if interstitial.isReady {
//                                DispatchQueue.main.asyncAfter(deadline: .now() + 30) {
//                                                let root = UIApplication.shared.windows.first?.rootViewController
//                                   self.interstitial.present(fromRootViewController: root!)
//                                  self.showAd = false
//                               }
//                                            } else {
//                                              print("Ad wasn't ready")
//                                            }
//                           } else {
//                  print("only 1 ad allowed")
//                        }
//    }
    
    
        
        func chartValueSelected(_ chartView: ChartViewBase, entry: ChartDataEntry, highlight: Highlight) {
            print(entry)
          
        }
        
    @IBAction func helplineTapped(_ sender: Any) {
   
        showStandardDialog()
    
    }
    

       func showStandardDialog(animated: Bool = true) {

           // Prepare the popup
           let title = "Central Helpline"
           let message = "The health ministry (Department of Health & Family Welfare) has set up helpline numbers for all types of queries and support related to the COVID-19 or Coronavirus infection."

        
           // Create the dialog
           let popup = PopupDialog(title: title,
                                   message: message,
                                   buttonAlignment: .horizontal,
                                   transitionStyle: .zoomIn,
                                   tapGestureDismissal: true,
                                   panGestureDismissal: true,
                                   hideStatusBar: true) {
             
           }
        
        
    
      
   

           
           let okBtn = DefaultButton(title: "OK") {
            
           }
        
        
          let seeHelpline = DefaultButton(title: "Check Helpline")
          {
            DispatchQueue.main.asyncAfter(deadline: .now()) {
              

            UIApplication.tryURL(urls: ["https://www.mohfw.gov.in/coronvavirushelplinenumber.pdf"])

            }
        }

           // Add buttons to dialog
           popup.addButtons([okBtn,seeHelpline])

           // Present dialog
           self.present(popup, animated: animated, completion: nil)
       }
    
   

}


extension UIApplication {
    class func tryURL(urls: [String]) {
        let application = UIApplication.shared
        for url in urls {
            if application.canOpenURL(URL(string: url)!) {
                if #available(iOS 10.0, *) {
                    application.open(URL(string: url)!, options: [:], completionHandler: nil)
                }
                else {
                    application.openURL(URL(string: url)!)
                }
                return
            }
        }
    }
}


extension UILabel {
    func blink() {
        self.alpha = 0.0;
        UIView.animate(withDuration: 0.8, //Time duration you want,
            delay: 0.0,
            options: [.curveEaseInOut, .autoreverse, .repeat],
            animations: { [weak self] in self?.alpha = 1.0 },
            completion: { [weak self] _ in self?.alpha = 0.0 })
    }
}
