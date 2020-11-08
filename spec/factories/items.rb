FactoryBot.define do
  factory :item do
    name          {Faker::Name}
    explain       {"aaa"}
    status_id     {"aaaa"}
    deliveryfee_id  {"aaaaa"}
    prefecture_id  {Faker::Address}
    shippingdays_id   {"aaaaaa"}
    price         {111}
    seller_id       {1}
    #category_id   {1}
    brand_id      {1}

    after(:build) do |item|
      item.images << FactoryBot.build(:image, item: item)
    end

    association :category
  end
end