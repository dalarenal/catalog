FactoryGirl.define do
  factory :purchase do
    expires_at Time.current + 1.day
    user
    purchase_option

    trait :with_movie do
      purchase_option do
        FactoryGirl.create(
          :purchase_option,
          content: FactoryGirl.create(:movie)
        )
      end
    end

    trait :with_season do
      purchase_option do
        FactoryGirl.create(
          :purchase_option,
          content: FactoryGirl.create(:season, :with_episodes)
        )
      end
    end
  end
end
