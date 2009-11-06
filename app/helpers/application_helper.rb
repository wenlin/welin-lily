# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper

  def get_days_to_njcee
	local = DateTime.now
	utc = local.new_offset
	offset = Rational(8, 24)
	t = utc.new_offset(offset)
	njcee = DateTime.new(2010, 6, 7)
	@days_to_njcee = ( njcee - t).to_i
	if t.zone != "+0800" or t.zone != "+08:00"
	  if t.hour < 8
		@days_to_njcee = @days_to_njcee - 1
	  end
	end
	return @days_to_njcee
  end
end
