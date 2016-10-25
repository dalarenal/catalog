FactoryGirl.define do
  factory :season do
    title "Title"
    plot "Plot"

    trait :with_episodes do
      after(:create) do |season|
        3.times do |n|
          FactoryGirl.create(:episode, season: season, number: n + 1)
        end
      end
    end
  end
end
