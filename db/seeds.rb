  
  Classroom.find_or_create_by(name: '1º Ano do Ensino Médio')
  Classroom.find_or_create_by(name: '2º Ano do Ensino Médio')
  Classroom.find_or_create_by(name: '3º Ano do Ensino Médio')


teacher = User.new(name:"renan", 
  email:"renan@gmail.com", 
  password:"123456", 
  password_confirmation:"123456",
  role: :professor
  )
teacher.save!

student1 = User.new(name:"davi", 
  email:"davi@gmail.com", 
  password:"123456",
  password_confirmation:"123456",
  role: :aluno,
  classroom: Classroom.first
)
student1.save

student2 = User.new(name:"maia", 
  email:"maia@gmail.com", 
  password:"123456",
  password_confirmation:"123456",
  role: :aluno, 
  classroom: Classroom.second
)
student2.save


student3 = User.new(name:"silas", 
  email:"silas@gmail.com", 
  password:"123456",
  password_confirmation:"123456",
  role: :aluno, 
  classroom: Classroom.last
)
student3.save

TASKS_PROFESSOR = [
  {
    title: "Resolver exercícios de Matemática",
    description: "Faça os exercícios da página 45 do caderno de Matemática.",
    due_date: Date.today + 5.days,
    classroom: Classroom.first,
    teacher: teacher
  },
  {
    title: "Estudo de Química",
    description: "Revisar a tabela periódica e anotar as reações mais importantes.",
    due_date: Date.today + 7.days,
    classroom: Classroom.second,
    teacher: teacher
  },
  {
    title: "Trabalho de Geografia",
    description: "Pesquisar sobre os biomas brasileiros para o trabalho escolar.",
    due_date: Date.today + 10.days,
    classroom: Classroom.last,
    teacher: teacher
  }
]


Task.create!(TASKS_PROFESSOR)
TaskStudent.create!(  {task: Task.first,status: :para_fazer,student: student1})
TaskStudent.create!(  {task: Task.second,status: :para_fazer,student: student2})
TaskStudent.create!(  {task: Task.last,status: :para_fazer,student: student3})



  puts "Tabelas Do Ambiente De Desenvolvimento Populadas !!"
