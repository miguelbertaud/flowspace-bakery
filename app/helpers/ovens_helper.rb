module OvensHelper
  def cookie_fillings(fillings)
    fillings.blank? ? 'no filling' : fillings
  end
end
