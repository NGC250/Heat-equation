program main
	
	use globals
	implicit none
	
	real(kind = dp) , dimension(t_steps) :: ref = 0.0_dp
	
	real(kind = dp) :: I_yz , s_j , y_coord , z_coord , ref_value
	
	integer :: j , y , z , iostat , unit_num = 10
	character(len=256) :: filename
	
	real(kind = dp) , dimension(-y_lim : y_lim,-z_lim : z_lim) :: screen = 0.0_dp
	
	do j = 1 , num_slits
		s_j = sqrt(D**2 + slit(j) **2)
		ref = ref + cos(k * s_j - w * t)
	end do

	ref = ref**2
	
	call integral(ref , ref_value)

	columns: do z = -z_lim , z_lim
		rows: do y = -y_lim , y_lim
			
			y_coord = real(y,dp)/real(y_lim,dp)
			z_coord = real(z,dp)/real(z_lim,dp)
			
			call project(y_coord , z_coord , I_yz)

			screen(y , z) = I_yz

		end do rows	
	end do columns
	
	screen = (255.0_dp/ref_value) * screen
	
	write(filename , "(A,I0,A)") "../data/images/screen_", num_slits, "slits.pgm"
	
	open(unit = unit_num , file = filename , status="unknown" , iostat = iostat)
	if(iostat /= 0) then
		print *, "file could not be opened"
		stop
	end if
	
	write(unit_num , "(A)") "P2"
	write(unit_num , "(I3,1X,I3)") 201,201
	write(unit_num , "(I3)") 255
	
	writing_loop: do j = -y_lim , y_lim
		write(unit_num , "(201I4)") nint(screen(j , :))
	end do writing_loop
	
	close(unit_num)
	
end program main
	
