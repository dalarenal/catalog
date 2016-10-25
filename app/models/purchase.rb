class Purchase < ApplicationRecord
  belongs_to :user
  belongs_to :purchase_option
  has_one :content, through: :purchase_option

  validates :user_id, presence: true
  validates :purchase_option_id, presence: true
  validate :uniq?, on: :create

  scope :active, -> { where('expires_at > ?', Time.current) }

  private

  def uniq?
    if Purchase.joins(:content).active.where(user_id: user_id, contents: { id: content.id }).exists?
      errors.add(:content_id, 'has already been purchased')
    end
  end
end
