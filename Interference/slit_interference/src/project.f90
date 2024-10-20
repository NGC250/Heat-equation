subroutine project(y_coord , z_coord , net_I)

	use globals
	implicit none
	
	real(kind = dp) , intent(in) :: y_coord , z_coord
	real(kind = dp) , intent(out) :: net_I
	
	integer :: i
	
	real(kind = dp) :: r_i
	real(kind = dp) , dimension(t_steps) :: point
	
	point = 0.0_dp

	do i = 1 , num_slits
		r_i = sqrt(D**2 + (slit(i) - y_coord)**2 + z_coord**2)
		point = point + cos(k * r_i - w * t)
	end do
	
	point = point**2

	call integral(point , net_I)
	
end subroutine project
