program main
	
	use globals
	implicit none
	
	real(kind = dp) , dimension(0:L+1,0:B+1) :: bath , update_bath
	real(kind = dp) , dimension(L,B) :: L_bath
	
	real(kind = dp) :: dist
	
	integer :: i , j , t , unit_num = 20 , iostat
	character(len=256) :: filename
	
	call initialise(bath)
	
	do t=1,iterations
		
		call laplacian(bath , L_bath)
		
		update_bath(1:L,1:B) = bath(1:L,1:B) + tick * thermal_diffusivity * L_bath	
		
		bath = update_bath
		
!		bath(0,:) = 250.0_dp * (1.0_dp + sin(2.0*pi * real(t,dp)/real(T,dp)))
!		bath(L+1,:) = 250.0_dp * (1.0_dp + sin(2.0*pi * real(t,dp)/real(T,dp)))
!		bath(:,0) = 0.0_dp
!		bath(:,B+1) = 0.0_dp
		
!		bath(L/2 , B/2) = 100.0_dp
		
		do i = L/2 - r , L/2 + r
			do j = B/2 - r , B/2 + r
			
				dist = sqrt(real((i - L/2)**2 + (j - B/2)**2 , dp))
				
				if(dist < r) then
					bath(i , j) = 100.0_dp * exp(-dist**2) * sin(pi * real(t,dp)/real(iterations,dp))
				end if
				
			end do
		end do
		
		
		write(filename , "(A,I0,A)") "../data/status/bath" , t , ".dat"
	
		open(unit = unit_num , file = filename , status="unknown" , iostat = iostat)
		if(iostat /= 0) then
			write(*,"(A,I0,A)") "could not open file" , t , " for writing!"
		end if
		
		do j = 1,L
			write(unit_num , "(99(F10.6,',') , F10.6)") bath(j,1:B-1) , bath(j,B) 
		end do
		
	end do

end program main
