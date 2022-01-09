//
//  ViewController.swift
//  Lotery-App
//
//  Created by Rennan Bruno on 07/01/22.
//

import UIKit

enum GameType: String{
    case megasena = "Mega-Sena"
    case quina = "Quina"
}
    // >-< significa intervalo nesta caso os intervalos serão de 6 a 60, e  5 a 80.
    infix operator >-<
    func >-< (total: Int, universe: Int) -> [Int]{
        var result: [Int] = []
        //Executando o count para adicionar mais um elemento.
        while result.count < total {
            let randomNumber = Int(arc4random_uniform(UInt32(universe))+1)
            //Verificando se o array já contem o numero randomico sorteado.
            if !result.contains(randomNumber) {
                //Caso não tenha o numero randomico selecionado ele vai adicionar o numero
                result.append(randomNumber)
            }
        }
        //Chamando o metodo para ordenar o array do menos para o maior.
        return result.sorted()
    }

class ViewController: UIViewController {
    //Intanciando os componentes a serem utilizados, Ex: botões, labels etc.
    @IBOutlet weak var lbGameType: UILabel!
    @IBOutlet weak var scGameType: UISegmentedControl!
    
    @IBOutlet var balls: [UIButton]!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        showNumbers(for: .megasena)
    }
    //Função para mostrar os numero
    func showNumbers(for type: GameType) {
        lbGameType.text = type.rawValue
        var game: [Int] = []
        //Switch para ver que tipo de jogo será retornad e a quantidade de numero que podem entrar no range de opções quina 5 de 80 numeros, mega-sena 6 de 60 numeros.
        switch type {
            case .megasena:
                game = 6>-<60
            balls.last!.isHidden = false
            //Na quina utilizaremos só cinco bolinhas, então colocaremos a opção isHidden ativa para não aparecer.
            case .quina:
                game = 5>-<80
            balls.last?.isHidden = true
        }
        //Atribuindo os valores numéricos para as balls na tela.
        for (index, game) in game.enumerated(){
            balls[index].setTitle("\(game)", for: .normal)
        }
    }
    //Iniciando o gerador de jogo de acordo com a opção selecionada
    @IBAction func generateGame() {
        switch scGameType.selectedSegmentIndex  {
        case 0:
            showNumbers(for: .megasena)
        default:
            showNumbers(for: .quina)
        }
    }
    
}

