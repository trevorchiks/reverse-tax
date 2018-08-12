class CountryTaxSetting < ApplicationRecord
  belongs_to :country
  belongs_to :currency
end
