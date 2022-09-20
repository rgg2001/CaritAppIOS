//
//  ProfileViewController.swift
//  CaritAppLogin
//
//  Created by Alberto Estrada on 07/09/22.
//

import UIKit

class ProfileViewController: UIViewController {

    // Declaracion de objetos
    @IBOutlet weak var pieChart: JPieChart!
    @IBOutlet weak var barChart: BarChartView!
    
    // Declaracion de valores iniciales
    let valoresTabla = [2.0, 5.0, 1.0, 0.0, 6.0, 4.0]
    let etiquetasFechas = ["Ene", "Feb", "Mar", "Abr", "May", "Jun"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        // Declaracion de grafica de pastel
        pieChart.addChartData(data: [
            JPieChartDataSet(percent: 30, colors: [UIColor.purpleishBlueThree,UIColor.brightLilac]),
            JPieChartDataSet(percent: 40, colors: [UIColor.darkishPink,UIColor.lightSalmon]),
            JPieChartDataSet(percent: 10, colors: [UIColor.dustyOrange,UIColor.lightMustard]),
            JPieChartDataSet(percent: 20, colors: [UIColor.greenyBlue,UIColor.hospitalGreen])
         ])
        
         pieChart.lineWidth = 0.85
        
        // Declaraacion de grafica de barras
        barChart.maxValue = 18.0
        barChart.drawChart(valoresTabla,etiquetasFechas)
        
    }
    

}
