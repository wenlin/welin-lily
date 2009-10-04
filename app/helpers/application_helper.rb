# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper

  def get_days_to_njcee
	local = DateTime.now
	utc = local.new_offset
	offset = Rational(8, 24)
	t = utc.new_offset(offset)
	njcee = DateTime.new(2010, 6, 7)
	return @days_to_njcee = ( njcee - t).to_i
  end

end
