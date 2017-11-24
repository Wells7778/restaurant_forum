namespace :dev do
  task fake: :environment do
    Restaurant.destroy_all

    500.times do
      Restaurant.create!(
        name: FFaker::Company.unique.name,
        tel: FFaker::PhoneNumber.short_phone_number,
        address: FFaker::Address.street_address,
        opening_hours: FFaker::Time.datetime,
        description: FFaker::Lorem.paragraph
      )
    end
    puts "have created fake restaurants"
    puts "now you have #{Restaurant.count} restaurants data"
  end
end