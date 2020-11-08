class SetCityStateToCompanies < ActiveRecord::Migration[6.0]
  def change
    Company.find_each do |company|
      company.update_city_state
      company.save!
    end
  end
end
