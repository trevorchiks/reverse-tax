class TaxYear < ApplicationRecord
  belongs_to :country
  has_many :tax_year_details

  def before_save
    # get to order by setting no. Or something
    self.start_date = new Date(self.year, self.country.country_tax_settings.order.first.start_month, 1)
    #TODO : ruby add year minus one day
    #self.end_date = self.start_date.
  end

  def reverseTax(tax_year)
    #TODO : raise error if tax_year is not, you know, TaxYear
    return tax_year.tax_year_details.reduce(0) { |tax_return tax_detail| }
  end
end
