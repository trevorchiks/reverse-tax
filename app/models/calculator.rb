module Calculator

  def self.reverse_tax year, tax_amt
    #TODO : raise error if tax_year is not, you know, TaxYear
    last_marg = 0.0
    last_tax = 0.0
    back_tax = 0.0
    gross = tax_amt

    tax_year = TaxYear.find_by_year(year)
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