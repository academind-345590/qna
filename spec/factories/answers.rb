FactoryBot.define do
  factory :answer do
    body { "My answer Text" }
    quetion { "" }
  end
  factory :invalid_answer, class: "Answer" do
    body { nil }
  end
  
end
