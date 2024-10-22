module globals
	implicit none

	integer , parameter :: dp = selected_real_kind(p = 12)
	
	real(kind = dp) :: pi = 4.0_dp * atan(1.0_dp)
	
	real(kind = dp) , parameter :: step = 0.001_dp
	real(kind = dp) , parameter :: tick = 0.1_dp
	
	real(kind = dp) , parameter :: thermal_diffusivity = real(23e-6 , dp) !Thermal diffusivity of iron
	
	integer , parameter :: L = 100
	integer , parameter :: B = 100
	
	integer , parameter :: iterations = 200
	
	integer , parameter :: r = 5

end module globals
