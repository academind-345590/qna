FactoryBot.define do
  factory :answer do
    body { "MyText" }
    quetion { "" }
  end
  factory :invalid_answer, class: "Answer" do
    body { nil }
  end
end
