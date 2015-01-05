# Include a weather condition using a module.
# The weather must be random and only have two states "sunny" or "stormy".
# Try and take off a plane, but if the weather is stormy,
# the plane can not take off and must remain in the airport.
#
# This will require stubbing to stop the random return of the weather.
# If the airport has a weather condition of stormy,
# the plane can not land, and must not be in the airport
module Weather

  CHANCE_OF_GOOD_WEATHER = 70

  def forecast
  	rand(1..100)
  end

  def stormy?
		forecast > CHANCE_OF_GOOD_WEATHER
  end
	#
	#
  # def weather
  #   # [:sunny,:stormy].sample
  #   forecast = rand(1..101)
  #   if forecast < 30
  #     :sunny
  #   else
  #     :stormy
  #   end
  # end
	#
  # def stormy?
  #   weather == :sunny ? true : false
  # end

  # def stormy?
  # 	true
  # end

end
