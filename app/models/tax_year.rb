class TaxYear < ApplicationRecord
  belongs_to :country
  has_many :tax_year_details

  def before_save
    # get to order by setting no. Or something
    self.start_date = Date.new(self.year, self.country.country_tax_settings.order.first.start_month, 1)
    #TODO : ruby add year minus one day
    #self.end_date = self.start_date.
  end
end