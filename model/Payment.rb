# represents the credit card details provided to pay for an order

class Payment

  ValidNumber = Proc.new do |number|
    number.is_a?(Numeric) && number >= 0
  end

  ValidExpiryMonth = Proc.new do |month|
    month.is_a?(Numeric) && month.between?(1, 12)
  end

  ValidExpiryYear = Proc.new do |year|
    year.is_a?(Numeric) && year >= 1900
  end

  ValidCVV = Proc.new do |cvv|
    cvv.is_a?(Numeric) && cvv.to_s.size.between?(3, 4)
  end

  def self.valid(number, expiry_month, expiry_year, cvv)
    ValidNumber.call(number) &&
    ValidExpiryMonth.call(expiry_month) &&
    ValidExpiryYear.call(expiry_year) &&
    ValidCVV.call(cvv)
  end
  
  def initialize(number, expiry_month, expiry_year, cvv)
    @number = number
    @expiry_month = expiry_month
    @expiry_year = expiry_year
    @cvv = cvv
  end

  def to_s
    "paid via #{@number}, #{@expiry_month}/#{@expiry_year}, #{@cvv}"
  end

end
