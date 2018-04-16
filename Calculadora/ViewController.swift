//
//  ViewController.swift
//  Calculadora
//
//  Created by Stephanie Zuniga on 4/14/18.
//  Copyright © 2018 Stephanie Zuniga. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var operaciones: UILabel!
    @IBOutlet weak var ultimo: UILabel!
    @IBOutlet weak var SumaBtn: UIButton!
    @IBOutlet weak var RestaBtn: UIButton!
    @IBOutlet weak var DivisionBtn: UIButton!
    @IBOutlet weak var MultiplicacionBtn: UIButton!
    
    var ultimoNumero:String = "0"
    var operacion:String = " "
    var opr:String = ""
    var op2:String = ""
    var op1:String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func uno(_ sender: Any) {
        addNumber(number:"1")
    }
    
    @IBAction func dos(_ sender: Any) {
        addNumber(number:"2")
    }
    
    @IBAction func tres(_ sender: Any) {
        addNumber(number:"3")
    }
    
    @IBAction func cuatro(_ sender: Any) {
        addNumber(number:"4")
    }
    
    @IBAction func cinco(_ sender: Any) {
        addNumber(number:"5")
    }
    
    @IBAction func seis(_ sender: Any) {
        addNumber(number:"6")
    }
    
    @IBAction func siete(_ sender: Any) {
        addNumber(number:"7")
    }
    
    @IBAction func ocho(_ sender: Any) {
        addNumber(number:"8")
    }
    
    @IBAction func nueve(_ sender: Any) {
        addNumber(number:"9")
    }
    
    @IBAction func cero(_ sender: Any) {
        addNumber(number:"0")
    }
    
    @IBAction func suma(_ sender: Any) {
        addOperator(op: "+")
        SumaBtn.backgroundColor = UIColor.white
    }
    
    @IBAction func resta(_ sender: Any) {
        addOperator(op: "-")
        RestaBtn.backgroundColor = UIColor.white
    }
    
    @IBAction func division(_ sender: Any) {
        addOperator(op: "/")
        DivisionBtn.backgroundColor = UIColor.white
    }
    
    @IBAction func multiplicacion(_ sender: Any) {
        addOperator(op: "*")
        MultiplicacionBtn.backgroundColor = UIColor.white
    }
    
    @IBAction func borrar(_ sender: Any) {
        delete()
    }
    
    @IBAction func igual(_ sender: Any) {
        addOperator(op: "=")
    }
    
    func isOperator(opr:Character)->Bool
    {
        switch(opr)
        {
        case "+","-","/","*","=":
            return true
        default:
            return false
        }
    }
    
    func realizarOperacion(ope:String)->String
    {
        var result: Int = 0
        let n1: Int? = Int(op1)
        let n2: Int? = Int(op2)
        switch(ope)
        {
        case "+":
            result = n1! + n2!
        case "-":
            result = n1! - n2!
        case "/":
            result = n1! / n2!
        case "*":
            result = n1! * n2!
        default:
            result = n1!
        }
        return String(result)
    }
    
    func addNumber(number:String)
    {
        if(ultimoNumero == "0" || (isOperator(opr:operacion.last!))||opr == "=")
        {
            ultimoNumero = number
            operacion += number
            if(opr == "=")
            {
                opr = ""
            }
            SumaBtn.backgroundColor = UIColor.lightGray
            RestaBtn.backgroundColor = UIColor.lightGray
            DivisionBtn.backgroundColor = UIColor.lightGray
            MultiplicacionBtn.backgroundColor = UIColor.lightGray
        }else{
            ultimoNumero += number
            operacion += number
        }
        updateLabelUltimo()
    }
    
    func addOperator(op:String)
    {
        if(operacion == " "){
            operacion = ultimoNumero + op
        }else{
            operacion += op
        }
        updateLabelOperaciones()
        
        if(op1 == "")
        {
            op1 = ultimoNumero
            opr = op
            ultimoNumero = "0"
        }else if(op1 != "")
        {
            op2 = ultimoNumero
            ultimoNumero = realizarOperacion(ope: opr)
            if(op == "=")
            {
                operacion += ultimoNumero
                updateLabelOperaciones()
            }
            updateLabelUltimo()
            op1 = ultimoNumero
            op2 = ""
            opr = op
        }
    }
    
    func delete()
    {
        operacion = " "
        ultimoNumero = "0"
        op1 = ""
        op2 = ""
        opr = ""
        updateLabelOperaciones()
        updateLabelUltimo()
    }
    
    func updateLabelUltimo()
    {
        ultimo.text = ultimoNumero
    }
    
    func updateLabelOperaciones()
    {
        operaciones.text = operacion
    }
    
}

