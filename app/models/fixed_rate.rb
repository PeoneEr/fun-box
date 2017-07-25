class FixedRate < ApplicationRecord
  validates :value, presence: true,
                    numericality: { greater_than: 0, less_than: 1000, allow_blank: true },
                    format: {
                      with: /\A\d+(?:\.\d{0,4})?\z/,
                      message: 'could have only 4 decimals',
                      allow_blank: true
                    }

  validates :unfix_at, presence: true

  def active?
    unfix_at > Time.zone.now
  end
end
