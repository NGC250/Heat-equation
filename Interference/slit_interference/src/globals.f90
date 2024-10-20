module globals
	implicit none
	
	integer , parameter :: dp = selected_real_kind(p=20)

	integer , parameter :: num_slits = 1
	
	real(kind = dp) , parameter :: pi = 4.0_dp * atan(1.0_dp)
	
	real(kind = dp) , parameter :: D = 20.0_dp !Distance from slit screen to intereference screen
	
	real(kind = dp) , dimension(num_slits) , parameter :: slit = (/ 0.0_dp /)
!	real(kind = dp) , dimension(num_slits) , parameter :: slit = (/ 0.05_dp , -0.05_dp /)
!	real(kind = dp) , dimension(num_slits) , parameter :: slit = (/ 0.05_dp , 0.0_dp , -0.05_dp /)
!	real(kind = dp) , dimension(num_slits) , parameter :: slit = (/ 0.15_dp , 0.05_dp , -0.05_dp , -0.15_dp /)
	
!	real(kind = dp) , parameter :: lambda = 0.0005_dp !wavelength of light used
	real(kind = dp) , parameter :: lambda = real(450e-9 , dp) !wavelength of light used
	
!	real(kind = dp) , parameter :: c = 100.0_dp !speed of light in natural units
	real(kind = dp) , parameter :: c = 299792458.0_dp !speed of light in natural units
	
	real(kind = dp) , parameter :: f = c/lambda
	
	real(kind = dp) , parameter :: k = 2.0_dp*pi/lambda
	
	real(kind = dp) , parameter :: w = c * k
	
	integer , parameter :: t_steps = 101 !time resolution('0' + 100 = 101)

	real(kind = dp) , parameter :: dt = 1/(f*real(t_steps-1,dp)) !tick rate
	
	integer :: p
	real(kind = dp) , dimension(t_steps) , parameter :: t = (/ (real(p,dp) * dt , p = 0 , t_steps-1) /)
	
	integer , parameter :: y_lim = 100 !screen limit
	integer , parameter :: z_lim = 100 !screen limit
	
end module globals
