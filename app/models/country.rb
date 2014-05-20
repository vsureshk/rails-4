class Country < ActiveRecord::Base
  has_many :campaigns
  scope :country_names, -> {select("name").map(&:name)}
  
  def self.search(search)
    if search
      Country.where(['name LIKE ? or code LIKE ?', "%#{search}%","%#{search}%"])
    else
      Country.all
    end
  end
end
