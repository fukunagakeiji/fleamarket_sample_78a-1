FactoryBot.define do
  factory :image do
    image        {File.open("#{Rails.root}/public/images/test.jpg")}
  end
end