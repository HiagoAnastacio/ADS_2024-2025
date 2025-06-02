// Mini "Banco de Dados" de Pets feito com Array
const todosPets = [
    new pet('Rex', 5, 'Cachorro'),
    new pet('Mia', 3, 'Gato'),
    new pet('Pássaralho', 2, 'Pássaro'),
    new pet('Luna', 4, 'Coelho')
];

// Função contrutura de Objeto e funções que usam os dados do objeto 
function pet(nome, idade, especie) {

    // Propriedades do objeto
    this.nome = nome;
    this.especie = especie;
    this.idade = idade;

    // Métodos do objeto
    this.falar = () => `Meu nome é ${this.nome}, tenho ${this.idade} anos e sou um(a) ${this.especie}.`;
    this.identificacaoPet = () => `Nome: ${this.nome}, Idade: ${this.idade}, Espécie: ${this.especie}`;
    this.idadeHumana = () => {
        if (this.especie.toLowerCase() === 'cachorro') {
            return `IDADE HUMANA DE |${this.nome}|: ${this.idade * 7}`;
        } 
        else if (this.especie.toLowerCase() === 'gato') {
            return `IDADE HUMANA DE |${this.nome}|: ${this.idade * 6}`;
        } 
        else {
            return `IDADE HUMANA DE |${this.nome}|: ${this.idade * 5}`; 
        }
    };

}

// Constante de formatação de nome e busca por nome
const procurarPorNome = (nomeBicho) => {
    const nomeFormatado = nomeBicho.charAt(0).toUpperCase() + nomeBicho.slice(1).toLowerCase();
    const petEncontrado = todosPets.find(pet => pet.nome === nomeFormatado);

    if (petEncontrado) {
        console.log(petEncontrado.falar());
        console.log(petEncontrado.idadeHumana());
        console.log(petEncontrado.identificacaoPet());        
    } else {
        console.log("Pet não encontrado");
    }
}

// Função para listar todos os pets
const listarPets = () => {
    for(let pet of todosPets) {
        console.log(pet.identificacaoPet());
    }
}

const executarAcaoNosPets = () => {}

const tirarPetdoArray = () => {}

// Testando as funções passando o nome do pet
procurarPorNome('Pássaralho');
console.log('------------------');
listarPets();
