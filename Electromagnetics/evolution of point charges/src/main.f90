program TimeEvolution

	use constants
	use dynamics
	use VectorAlgebra
	implicit none

	double precision , dimension(num_charges,3) :: positions , velocities , E_field , B_field
	double precision , dimension(num_charges,2) :: charge_mass_array
	integer :: i , t , file_num = 10 , iostat
	character(len=256) :: filename
	
	call InitialConditions(charge_mass_array , positions , velocities)
	
	write(filename , "(A,I3.3,A)") "../data/systeminfo" , 0 , ".dat"
	open(unit = file_num , file = filename , status = "unknown" , iostat=iostat)
	if(iostat /= 0) then
		write(*, "(A,I3.3)") "unable to open file" , t
		stop
	end if
	
	write(file_num , "(A)") "x , y , z , vx , vy , vz"
	do i = 1,num_charges
		write(file_num , "(F12.6,',',F12.6,',',F12.6,',',F12.6,',',F12.6,',',F12.6)") &
		& positions(i,1) , positions(i,2) , positions(i,3) , velocities(i,1) , velocities(i,2) , velocities(i,3)
	end do
	close(file_num)
	
	do t=1,iterations
		
		write(filename , "(A,I3.3,A)") "../data/systeminfo" , t , ".dat"
		open(unit = file_num , file = filename , status = "unknown" , iostat=iostat)
		if(iostat /= 0) then
			write(*, "(A,I3.3)") "unable to open file" , t
			stop
		end if
		
		write(file_num , "(A)") "x , y , z , vx , vy , vz"
		
		call Forces(charge_mass_array , positions , velocities , E_field , B_field)
		
		writing_loop: do i = 1,num_charges
		
			write(file_num , "(F12.6,',',F12.6,',',F12.6,',',F12.6,',',F12.6,',',F12.6)") &
			& positions(i,1) , positions(i,2) , positions(i,3) , velocities(i,1) , velocities(i,2) , velocities(i,3)
		
		end do writing_loop
		
		close(file_num)
		
	end do

end program TimeEvolution