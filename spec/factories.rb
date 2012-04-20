FactoryGirl.define do  
  factory :counter do
    name "Counter"
    date  { 2.years.ago }
    title ""
  end

  factory :user_counter do
    user_id "12345678"
    title ""
    counter
  end
end