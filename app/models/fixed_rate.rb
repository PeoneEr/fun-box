class FixedRate < ApplicationRecord
  def active?
    unfix_at > Time.zone.now
  end
end
