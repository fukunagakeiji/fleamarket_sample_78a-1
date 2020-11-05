FactoryBot.define do
  factory :creditcard do
    association :user
    customer_id {"cus_****************************"}
    card_id     {"car_****************************"}
  end
end