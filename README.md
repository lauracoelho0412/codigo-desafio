# 🎮 Jogo de Batalha - Swift

Um jogo de batalha por turnos desenvolvido em Swift, onde o jogador escolhe um herói para enfrentar vilões em combates épicos.

## 📋 Descrição

Este é um jogo de RPG simples baseado em texto, onde o jogador:
- Escolhe um herói dentre 5 opções disponíveis
- Seleciona um vilão para enfrentar
- Participa de batalhas por turnos até a vitória, derrota ou empate
- Pode comprar poções de cura usando moedas ganhas durante a batalha

## 🎯 Funcionalidades

- **Sistema de Combate**: Batalhas automáticas por turnos com cálculo de dano baseado em nível e força
- **Sistema de Moedas**: Ganhe moedas a cada rodada de batalha
- **Loja de Poções**: Compre poções de cura quando sua vida estiver baixa
- **Múltiplos Personagens**: 5 heróis e 5 vilões com atributos únicos

## 🎲 Como Jogar

1. Execute o programa
2. Digite seu nome quando solicitado
3. Escolha um herói (digite o número de 1 a 5)
4. Escolha um vilão para enfrentar (digite o número de 1 a 5)
5. A batalha começa automaticamente
6. Durante a batalha:
   - O dano é calculado automaticamente para ambos os lados
   - Você ganha moedas a cada rodada
   - Se sua vida estiver menor que a do vilão, você pode comprar poções
7. A batalha termina quando:
   - Você vence (vida do vilão chega a 0 ou menos)
   - Você perde (sua vida chega a 0 ou menos)
   - Empate (ambas as vidas chegam a 0 simultaneamente)

## 📊 Mecânicas do Jogo

### Cálculo de Dano
```
Dano = (Nível × 2) + Força
```

### Ganho de Moedas
```
Moedas por rodada = Nível do Vilão × 3
```

### Sistema de Vida
A vida diminui a cada rodada baseada no dano recebido. O jogador pode recuperar vida comprando poções.

## 🛠️ Estrutura do Código

- **Struct Personagem**: Define atributos de heróis e vilões
- **Struct Pocao**: Define propriedades das poções de cura
- **Enum Estados**: Controla os estados da batalha (vitória, derrota, empate, batalha)
- **Enum BatalhaErro**: Define erros personalizados
- **Funções auxiliares**: Cálculos de dano, vida, moedas e validações
- **Loop principal**: Através de um loop while, o jogo da continuidade as batalhas

## 🎯 Possíveis Melhorias Futuras

- Adicionar sistema de defesa nos cálculos de dano
- Implementar habilidades especiais para cada personagem
- Sistema de níveis para o jogador
- Inventário de itens
- Múltiplas batalhas em sequência
- Sistema de salvamento de progresso

**Divirta-se jogando! 🎮⚔️**
