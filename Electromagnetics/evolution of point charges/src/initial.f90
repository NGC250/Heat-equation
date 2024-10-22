subroutine InitialConditions(charge_mass_array , positions , velocities)
	
	use constants
	implicit none
	
	double precision , dimension(num_charges,3) , intent(out) :: positions
	double precision , dimension(num_charges,3) , intent(out) :: velocities
	double precision , dimension(num_charges,2) , intent(out) :: charge_mass_array
	
	charge_mass_array(:,1) = (/ 10.0 , -20.0 , -15.0 , 20.0 , 5.0 , -15.0 , 10.0 , -20.0 /) !charges
	charge_mass_array(:,2) = (/ 1.0 , 1.0 , 1.0 , 1.0 , 1.0 , 1.0 , 1.0 , 1.0 /) !masses
	
	call random_number(positions)
	
	positions(:,1) = positions(:,1) * L + dx
	positions(:,2) = positions(:,2) * B + dy
	positions(:,3) = positions(:,3) * H + dz
	
	velocities = 0.0
	
end subroutine InitialConditions