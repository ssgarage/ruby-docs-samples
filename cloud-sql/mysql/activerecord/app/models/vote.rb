class Vote < ApplicationRecord
  validates :candidate, inclusion: { in: ["TABS", "SPACES"] }

  def date_cast
  end

  def time_case
  end

  def self.tab_count
    select(:candidate).where(:candidate == "TABS").count
  end

  def self.space_count
    select(:candidate).where(:candidate == "SPACES").count
  end
end
