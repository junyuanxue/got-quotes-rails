include ActionDispatch::TestProcess

FactoryGirl.define do
  factory :quote do
    content { Faker::Hipster.sentence }
    character { Faker::Name.name }
  end
end
