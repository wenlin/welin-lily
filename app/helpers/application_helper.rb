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
  
  def get_p_current
	local = DateTime.now
	utc = local.new_offset
	offset = Rational(8, 24)
	t = utc.new_offset(offset)

	@days_to_njcee = get_days_to_njcee()

	if t.hour < 6
	  @p_current = ( 300 - @days_to_njcee) * 3
	elsif t.hour >= 6 and t.hour < 13
	  @p_current = ( 300 - @days_to_njcee) * 3 + 1
	elsif t.hour >= 13 and t.hour < 18
	  @p_current = ( 300 - @days_to_njcee) * 3 + 2 
	elsif t.hour >= 18
	  @p_current = ( 300 - @days_to_njcee) * 3 + 3
	end

	return @p_current
  end
end
