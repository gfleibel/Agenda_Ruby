@agenda = [
  {nome: "Gabriel", telefone: "11999999999"},
  {nome: "Virginia", telefone: "21988888888"}
]

def todos_contatos
  @agenda.each do |contato| 
    puts "#{contato[:nome]} - #{contato[:telefone]}"
  end
  puts "..............................."
end

def adicionar_contato
  print "Nome: "
  nome = gets.chomp
  print "Telefone: "
  telefone = gets.chomp
  @agenda << { nome: nome, telefone: telefone}
  puts "Contato adicionado!"
  puts "..............................."
end

def ver_contato
  print "Digite o nome do contato: "
  nome = gets.chomp
  
  @agenda.each do |contato|
    if contato[:nome].downcase.include?(nome.downcase)
      puts "#{contato[:nome]} - #{contato[:telefone]}"
      puts "..............................."
    end
  end  
end  

def editar_contato
  print "Qual nome deseja editar? "
  nome = gets.chomp
  
  @agenda.each do |contato|
    if contato[:nome].downcase == (nome.downcase)
      print "Nome: #{contato[:nome]} | Aperte ENTER para manter o mesmo nome ou escreva o nome novo: "
      nome_salvo = contato[:nome]
      contato[:nome] = gets.chomp
      contato[:nome] = contato[:nome].empty? ? nome_salvo : contato[:nome]
      
      print "Telefone: #{contato[:telefone]} | Aperte ENTER para manter o mesmo telefone ou escreva o número novo: "
      telefone_salvo = contato[:telefone]
      contato[:telefone] = gets.chomp
      contato[:telefone] = contato[:telefone].empty? ? telefone_salvo : contato[:telefone]
    end
  end
end

def remover_contato
  print "Qual nome deseja remover? "
  nome = gets.chomp
  
  @agenda.each do |contato|
    if contato[:nome].downcase == (nome.downcase)
      indice = @agenda.index(contato)
      puts "Nome: #{contato[:nome]} - #{contato[:telefone]}"
      print "Aperte ENTER para confirmar ou digite \"voltar\"."
      confirmacao = gets.chomp
      if confirmacao = ""
        @agenda.delete_at(indice)
        break
      end
    end
  end
end

loop do
puts "1. Lista de Contatos\n2. Adicionar  Contato\n3. Ver Contato\n4. Editar Contato\n5. Remover Contato\n0. Sair"
codigo = gets.chomp.to_i

  case
    when codigo==0
    puts "Até mais!"
    break
    when codigo==1
      todos_contatos
    when codigo==2
      adicionar_contato
    when codigo==3
      ver_contato
    when codigo==4
      editar_contato
    when codigo ==5
      remover_contato
    else
      puts "Digite uma opção válida."
      puts "..............................."
      
  end
end
