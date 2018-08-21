class TaxYear < ApplicationRecord
  belongs_to :country
  has_many :tax_year_details

  def before_save
    # get to order by setting no. Or something
    self.start_date = Date.new(self.year, self.country.country_tax_settings.order.first.start_month, 1)
    #TODO : ruby add year minus one day
    #self.end_date = self.start_date.
  end

  def reverse_tax tax_year, tax_amt
    #TODO : raise error if tax_year is not, you know, TaxYear
    last_marg = 0.0
    last_tax = 0.0
    back_tax = 0.0  
    gross = tax_amt
    tax_year.tax_year_details.each {| tax_det |
      back_tax += last_marg * (tax_det.bracket_start - last_tax)
      gross = tax_det.marginal_rate == 0 || (tax_det.bracket_start - back_tax) > tax_amt ? gross : (tax_amt - (tax_det.bracket_start * tax_det.marginal_rate - back_tax)) / (1 - tax_det.marginal_rate)
      last_marg = tax_det.marginal_rate
      last_tax = tax_det.bracket_start
      # print "back_tax #{back_tax}\n"
      # print "last_marg #{last_marg}\n"
      # print "last_tax #{last_tax}\n\n\n"
    }
    gross
  end
end