namespace :dev do
  desc "Configurar dev"

  task setup: :environment do

    p ' Cadastrando tipos de contato... '

    kinds = %w(Amigo Comercial Conhecido)

    kinds.each do |kind|
      Kind.create!(
        description: kind
      )
    end
    p ' Cadastro com sucesso'



    p "Cadastrando contatos"

    100.times do |i|
      Contact.create!(
        name:Faker::Name.name,
        email:Faker::Internet.email,
        birthdate:Faker::Date.between(from:40.years.ago, to: 18.years.ago),
          kind: Kind.all.sample
        )
    
    end
    p "cadastro com sucesso!"
   
    p "proxima etapa..."
    p ' \ '
    p ' - '
    p ' | '
    p ' / '
    p ' - '
    

    p "Cadastrando telefones"

       Contact.all.each do |contact|
        Random.rand(5).times do |i|
       phone = Phone.create!(number:Faker::PhoneNumber.cell_phone)
       contact.phones << phone
       contact.save!
     end
   end
   p "cadastro com sucesso!"
end
end