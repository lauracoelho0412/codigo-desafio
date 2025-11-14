////
////  main.swift
////  codigo desafio final
////
////  Created by LAURA COELHO DE OLIVEIRA on 14/11/25.
////
//
import Foundation

//Estrutura heroi, vilao e pocao
struct Personagem {
    let nome: String
    let nivel: Int
    let forca: Int
    let vida: Int
    let defesa: Int
}

let herois: [Int: Personagem] = [
    1: Personagem(nome: "Guerreiro", nivel: 5, forca: 18, vida: 120, defesa: 10),
    2: Personagem(nome: "Arqueira", nivel: 4, forca: 14, vida: 100, defesa: 6),
    3: Personagem(nome: "Mago", nivel: 4, forca: 16, vida: 90, defesa: 4),
    4: Personagem(nome: "Paladina", nivel: 6, forca: 15, vida: 130, defesa: 12),
    5: Personagem(nome: "Assassino", nivel: 5, forca: 13, vida: 80, defesa: 5)
]

let viloes: [Int: Personagem] = [
    1: Personagem(nome: "Goblin", nivel: 3, forca: 10, vida: 80, defesa: 4),
    2: Personagem(nome: "Lobo Alfa", nivel: 4, forca: 13, vida: 100, defesa: 6),
    3: Personagem(nome: "Bruto Orc", nivel: 5, forca: 18, vida: 160, defesa: 11),
    4: Personagem(nome: "Feiticeiro Sombrio", nivel: 6, forca: 16, vida: 110, defesa: 5),
    5: Personagem(nome: "Dragão Jovem", nivel: 8, forca: 22, vida: 220, defesa: 14)
]

struct Pocao {
    let rotulo: String
    let valor: Int
    let vida: Int
}

let pocoes: [Int: Pocao] = [
    1: Pocao(rotulo: "Elixir", valor: 20, vida: 25),
    2: Pocao(rotulo: "Regeneracao", valor: 30, vida: 35),
    3: Pocao(rotulo: "Pocao de cura", valor: 40, vida: 45)
]

//enum
enum Estados{
    case vitoria, empate, derrota, batalha
}
enum BatalhaErro: Error{
    case heroiFraco, jogadorInvalido, moedasInsuficientes
}

//Funcoes
func imprimirPersonagens(vetor: [Int: Personagem]){
    for id in vetor.keys.sorted() {
        let v = vetor[id]!
        print("[\(id)] \(v.nome) — Nível: \(v.nivel), Força: \(v.forca), Vida: \(v.vida), Defesa: \(v.defesa)")
    }
}
func calcularDano(nivelH: Int, forcaH: Int, nivelV: Int, forcaV: Int) -> (danoH: Int, danoV: Int){
    (danoH: nivelH * 2 + forcaH, danoV: nivelV * 2 + forcaV)
}
func calcularVidaRestante(danoH: Int, danoV: Int, vidaH: Int, vidaV: Int) -> (vidaRH: Int, vidaRV: Int){
    (vidaRH: vidaH - danoV , vidaRV: vidaV - danoH)
}
func calcularMoedas(_ nivelV: Int) -> Int{
     let moedas = nivelV * 3
     return moedas
}
func atacarNovamente(){
    
}
func verificarEstado(_ vidaH: Int, _ vidaV: Int) -> Estados {
    var estado = Estados.batalha
    if(vidaH == vidaV){
        estado = .empate
    }
    else if(vidaH <= 0){
        estado = .derrota
    }else if(vidaV <= 0 && vidaH > 0){
        estado = .vitoria
    }
    return estado
}
func pocaoEscolhida(_ n: Int, _ vidaH: Int, vetor: [Int: Pocao]) -> Int{
    let vida = vidaH + vetor[n]!.vida
    return vida
}
func moedasSuficientes(_ moedas: Int, _ n: Int, vetor: [Int: Pocao]) throws -> Int {
    if(moedas < vetor[n]!.valor){
        throw BatalhaErro.moedasInsuficientes
    }
    else{
        return moedas - vetor[n]!.valor
    }
}
func validarJogador(n: Int) throws {
    if(n > 5 || n < 1){
        throw BatalhaErro.jogadorInvalido
    }
    return
}
func validarBatalha(nivelH: Int, nivelM: Int) throws{
    if(nivelH < nivelM/2){
        throw BatalhaErro.heroiFraco
    }
    return
}

// Começo da interação com usuário
var estado = Estados.batalha
print("Bem vindo(a), Aventureiro!")
print("Qual seu nome?")
let name = readLine() ?? "Sem nome"

print("Para começar a batalha \(name), escolha seu herói:")
print("")
print("=== Heróis Disponíveis ===")
imprimirPersonagens(vetor: herois)

print("Digite o número do herói:")
let heroi = Int(readLine()!)!
let h = herois[heroi]!

print("Agora \(name), escolha seu vilao:")
print("\n=== Vilões Disponíveis ===")
imprimirPersonagens(vetor: viloes)

print("Digite o número do vilao:")
let vilao = Int(readLine()!)!
let v = viloes[vilao]!
print("")
print("=== Batalha \(h.nome) X \(v.nome) ===")

//Calculo Dano
let (danoH, danoV) = calcularDano(nivelH: h.nivel, forcaH: h.forca, nivelV: v.nivel, forcaV: v.forca)
var vidaH = h.vida
var vidaV = v.vida

var moedas = 0
var rodando = true
var i = 1
//Loop principal
while(rodando){
    switch estado {
    case .batalha:
        print("=== Batalha \(i) ===")
        //Calculo vida e moedas
        (vidaH, vidaV) = calcularVidaRestante(danoH: danoH, danoV: danoV, vidaH: vidaH, vidaV: vidaV)
        moedas += calcularMoedas(v.nivel)
        print("=== Vidas ===")
        print("Vida Restante: \(vidaH)")
        print("Vida Inimigo: \(vidaV)")
        print("")
        print("=== Recompensas ===")
        print("Moedas Totais: \(moedas)")
        print("")
        
        if(vidaH < vidaV){
            print("Para continuar a batalha, voce pode comprar uma pocao de cura!")
            for id in pocoes.keys.sorted() {
                let p = pocoes[id]!
                print("[\(id)] \(p.rotulo) - Valor: \(p.valor), Vida Ganha: +\(p.vida)")
            }
            print("Deseja comprar? (sim ou nao)")
            let resposta = readLine() ?? "sim"
            if resposta == "sim"{
                print("Digite o número da pocao:")
                let n = Int(readLine()!)!
                do {
                    try moedas = moedasSuficientes(moedas, n, vetor: pocoes)
                    vidaH = pocaoEscolhida(n, vidaH, vetor: pocoes)
                }
                catch BatalhaErro.moedasInsuficientes{
                    print("Moedas Insuficientes!")
                }
            }
        }
        i += 1
        estado = verificarEstado(vidaH, vidaV)
    case .vitoria:
        print("Vitória. Parabéns!")
        rodando = false
    case .derrota:
        print("Voce foi derrotado!")
        rodando = false
    case .empate:
        print("Empate, da próxima voce consegue!")
        rodando = false
        
    }
}
print("Obrigado por jogar a batalha!")
