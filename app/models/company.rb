class Company < ApplicationRecord
  has_rich_text :description

  before_save :update_city_state, :if => :will_save_change_to_zip_code?

  def update_city_state
    result = zip_code.present? ? ZipCodes.identify(zip_code) : {}

    self.state = result[:state_code]
    self.city = result[:city]
  end
end
