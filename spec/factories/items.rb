FactoryBot.define do
  factory :user do
    name              {"aiueoaiueo"}
    email             {"aiueo@gmail.com"}
    password          {"aiueo111"}
    family_name       {"tanaka"}
    first_name        {"taro"}
    family_name_kana  {"tanaka"}
    first_name_kana   {"taro"}
    birthday          {"2020-10-03"}
  end
  
  factory :category do
    name {"aaa"}
  end

  factory :item do
    name          {Faker::Name}
    explain       {"aaa"}
    status_id     {"aaaa"}
    delivery_fee  {"aaaaa"}
    region        {Faker::Address}
    days          {"aaaaaa"}
    price         {111}
    user_id       {1}
    category_id   {1}
    brand_id      {1}

    after(:build) do |item|
      item.images << FactoryBot.build(:image, item: item)
    end
  end

  factory :image do
    image        {File.open("#{Rails.root}/public/images/test.jpg")}
  end
end