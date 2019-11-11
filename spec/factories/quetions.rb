FactoryBot.define do
  factory :quetion do
    title { "MyString" }
    body { "MyText" }
  end
  factory :invalid_quetion, class: "Quetion" do
    title { nil }
    body { nil }
  end
end
