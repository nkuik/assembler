FactoryGirl.define do
  factory :project do
    name "Mærsk Logistics"
    client "Mærsk"
    deadline Date.today + 1
  end
end
