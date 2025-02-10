# !!!!! pesquisar para saber se fazer uma constante contendo um array de hashes para popular a tabela tasks é muito errado ou se é normal 
TASKS_DATA = [
  {
    title: "Ler capítulo de História",
    description: "Leia o capítulo 3 do livro de História para discutir em sala.",
    due_date: Date.today + 3.days,
    status: 0
  },
  {
    title: "Resolver exercícios de Matemática",
    description: "Faça os exercícios da página 45 do caderno de Matemática.",
    due_date: Date.today + 5.days,
    status: 0
  },
  {
    title: "Praticar Inglês",
    description: "Revisar vocabulário e praticar exercícios do livro de Inglês.",
    due_date: Date.today + 2.days,
    status: 1
  },
  {
    title: "Estudo de Química",
    description: "Revisar a tabela periódica e anotar as reações mais importantes.",
    due_date: Date.today + 7.days,
    status: 1
  },
  {
    title: "Trabalho de Geografia",
    description: "Pesquisar sobre os biomas brasileiros para o trabalho escolar.",
    due_date: Date.today + 10.days,
    status: 2
  }
]

User.find_each do |user|
  user.tasks.create!(TASKS_DATA)
end

puts "Tarefas criadas para todos os usuários!"
