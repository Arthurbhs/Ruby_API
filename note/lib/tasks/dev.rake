namespace :dev do
  desc "Configurar dev"

  task setup: :environment do
    p "Cadastrando contatos"

    100.times do |i|
      Contact.create!(
        name:Faker::Name.name,
        email:Faker::Internet.email,
        birthdate:Faker::Date.between(from:40.years.ago, to: 18.years.ago)
      )
    end
    p "cadastro com sucesso!"
  end

end
