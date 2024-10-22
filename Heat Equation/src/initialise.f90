subroutine initialise(bath)
	
	use globals
	implicit none

	real(kind = dp) , dimension(0:L+1,0:B+1) , intent(inout) :: bath
	
	integer :: i , j , initial_num = 10 , iostat
	character(len=256) :: filename0
	
	real(kind = dp) :: dist
	
	bath = 30.0_dp
	
!	bath(0,:) = 250.0_dp
!	bath(L+1,:) = 250.0_dp
!	bath(:,0) = 0.0_dp
!	bath(:,B+1) = 0.0_dp
	
!	bath(L/2 , B/2) = 100.0_dp
	
	do i = L/2 - r , L/2 + r
		do j = B/2 - r , B/2 + r
			
			dist = sqrt(real((i - L/2)**2 + (j - B/2)**2 , dp))
			
			if(dist < r) then
				bath(i , j) = 100.0_dp * exp(-dist**2)
			end if
			
		end do
	end do
	
	write(filename0 , "(A)") "../data/status/bath0.dat"
	
	open(unit = initial_num , file = filename0 , status="unknown" , iostat = iostat)
	if(iostat /= 0) then
		write(*,"(A)") "could not open initial file for writing!"
	end if
	
	do j = 1,L
		write(initial_num , "(99(F10.6,',') , F10.6)") bath(j,1:B-1) , bath(j,B) 
	end do

end subroutine initialise
