subroutine laplacian(array , L_array)
	
	use globals
	implicit none
	
	real(kind = dp) , dimension(0:L+1 , 0:B+1) , intent(in) :: array
	real(kind = dp) , dimension(L , B) , intent(out) :: L_array
	
	integer :: i , j
	
	do i = 1,L
		do j = 1,B
			L_array(i,j) = array(i+1,j) + array(i-1,j) + array(i,j+1) + array(i,j-1) - 4.0_dp * array(i,j)
		end do
	end do
	
	L_array = L_array/step**2
	
end subroutine laplacian
