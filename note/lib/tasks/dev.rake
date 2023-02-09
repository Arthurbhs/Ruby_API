namespace :dev do
  desc "Configurar dev"

  task setup: :environment do
    puts "Resetando DB"
    p '...'
    %x(rails db:drop db:create db:migrate)
   p 'DB resetado'
   p '_____________________________'
    

    p ' Cadastrando tipos de contato... '
    p '...'
    kinds = %w(Amigo Comercial Conhecido)

    kinds.each do |kind|
      Kind.create!(
        description: kind
      )
    end
    p ' Cadastro com sucesso'

   p '_____________________________'

    p "Cadastrando contatos"
    p '...'
    100.times do |i|
      Contact.create!(
        name:Faker::Name.name,
        email:Faker::Internet.email,
        birthdate:Faker::Date.between(from:40.years.ago, to: 18.years.ago),
          kind: Kind.all.sample
        )
    
    end
    p "cadastro com sucesso!"
   
    p '_____________________________'

    p "Cadastrando Telefones"
    p '...'
    Contact.all.each do |contact|
      Random.rand(5).times do |i|
        phone = Phone.create!(number:Faker::PhoneNumber.cell_phone)
        contact.phones << phone
        contact.save!
      end
    end

    puts "Telefones cadastrados com sucesso!"
    p '_____________________________'

    puts "Cadastrando os endereços..."

    p '...'

    Contact.all.each do |contact|
      address = Address.create(
        street: Faker::Address.street_address,
        city: Faker::Address.city,
        contact: contact
      )
    end

    puts "Endereços cadastrados com sucesso!"
   
end
end