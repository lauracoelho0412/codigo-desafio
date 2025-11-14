//Estrutura heroi e vilao
struct Personagem {
    let nome: String
    let nivel: Int
    let forca: Int
    let vida: Int
    let defesa: Int
}

let herois: [Int: Personagem] = [
    1: Personagem(nome: "Guerreiro", nivel: 5, forca: 18, vida: 140, defesa: 10),
    2: Personagem(nome: "Arqueira", nivel: 4, forca: 14, vida: 110, defesa: 6),
    3: Personagem(nome: "Mago", nivel: 4, forca: 16, vida: 90, defesa: 4),
    4: Personagem(nome: "Paladina", nivel: 6, forca: 15, vida: 150, defesa: 12),
    5: Personagem(nome: "Assassino", nivel: 5, forca: 13, vida: 100, defesa: 5)
]

let viloes: [Int: Personagem] = [
    1: Personagem(nome: "Goblin", nivel: 3, forca: 10, vida: 80, defesa: 4),
    2: Personagem(nome: "Lobo Alfa", nivel: 4, forca: 13, vida: 100, defesa: 6),
    3: Personagem(nome: "Bruto Orc", nivel: 5, forca: 18, vida: 160, defesa: 11),
    4: Personagem(nome: "Feiticeiro Sombrio", nivel: 6, forca: 16, vida: 110, defesa: 5),
    5: Personagem(nome: "Dragão Jovem", nivel: 8, forca: 22, vida: 220, defesa: 14)
]

//enum 
enum Estados{
    case vitoria, empate, derrota
}
enum BatalhaErro: Error{
    case heroiFraco, jogadorInvalido, moedasInsuficientes
}

//Funcoes 
func calcularDano(nivelH: Int, forcaH: Int, nivelV: Int, forcaV: Int) -> (danoH: Int, danoV: Int){
    (danoH: nivelH * 2 + forcaH * nivelH, danoV: nivelV * 2 + forcaV * nivelV)
}
func calcularVidaRestante(danoH: Int, danoV: Int, vidaH: Int, vidaV: Int) -> (vidaRH: Int, vidaRV: Int){
    (vidaRH: vidaH - danoV , vidaRV: vidaV - danoH)
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
print("Bem vindo(a), Aventureiro!")
print("Qual seu nome?")
let nome = readLine() ?? "Sem nome"

print("Para começar a batalha \(nome), escolha seu herói:")
print("=== Heróis Disponíveis ===")
for id in herois.keys.sorted() {
    let h = herois[id]!
    print("[\(id)] \(h.nome) — Nível: \(h.nivel), Força: \(h.forca), Vida: \(h.vida), Defesa: \(h.defesa)")
}
print("Digite o número do herói:")
let heroi = Int(readLine()!)!
let h = herois[heroi]!

print("Agora \(nome), escolha seu vilao:")
print("\n=== Vilões Disponíveis ===")
for id in viloes.keys.sorted() {
    let v = viloes[id]!
    print("[\(id)] \(v.nome) — Nível: \(v.nivel),  Força: \(v.forca), Vida: \(v.vida), Defesa: \(v.defesa)")
}
print("Digite o número do vilao:")
let vilao = Int(readLine()!)!
let v = viloes[vilao]!

print("=== Batalha \(h.nome) X \(v.nome) ===")
//Calculo do dano e vida
let (danoH, danoV) = calcularDano(nivelH: h.nivel, forcaH: h.forca, nivelV: v.nivel, forcaV: v.forca)
let (vidaH, vidaV) = calcularVidaRestante(danoH: danoH, danoV: danoV, vidaH: h.vida, vidaV: v.vida)
print("Vida Restante: \(vidaH)")
print("Vida Inimigo: \(vidaV)")
