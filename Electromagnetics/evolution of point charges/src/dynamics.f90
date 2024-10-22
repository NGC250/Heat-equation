module dynamics

	use constants
	use VectorAlgebra
	implicit none
	
	contains
	
		subroutine Fields(charge_mass_array , positions , velocities , E_field , B_field)
			
			double precision , dimension(num_charges,2) , intent(in) :: charge_mass_array
			double precision , dimension(num_charges,3) , intent(in) :: positions
			double precision , dimension(num_charges,3) , intent(in) :: velocities
			double precision , dimension(num_charges,3) , intent(out) :: E_field
			double precision , dimension(num_charges,3) , intent(out) :: B_field
			
			integer :: i , j
			double precision :: r_ij , inv_r_cb , q_i , q_j
			double precision , dimension(3) :: r_i , r_j , v_i , v_j , vectL_j
			
			particle_i: do i = 1,(num_charges-1)
				particle_j: do j = (i+1),num_charges
				
					r_i = positions(i,:)
					r_j = positions(j,:)
					r_ij = sqrt(dot_product(r_i - r_j , r_i - r_j))
					inv_r_cb = (1.0/r_ij)**3
					
					q_i = charge_mass_array(i,1)
					q_j = charge_mass_array(j,1)
					
					v_i = velocities(i,:)
					v_j = velocities(j,:)
					
					E_field(i,:) = E_field(i,:) + (Ke * q_j) * inv_r_cb * (r_i - r_j)
					
					call cross(v_j , r_i - r_j , vectL_j)
					B_field(i,:) = B_field(i,:) + (Km * q_j) * inv_r_cb * vectL_j
					
				end do particle_j
			end do particle_i
			
		end subroutine Fields
		
		subroutine Forces(charge_mass_array , positions , velocities , E_field , B_field)
		
			double precision , dimension(num_charges,2) , intent(in) :: charge_mass_array
			double precision , dimension(num_charges,3) , intent(inout) :: positions
			double precision , dimension(num_charges,3) , intent(inout) :: velocities
			double precision , dimension(num_charges,3) , intent(inout) :: E_field
			double precision , dimension(num_charges,3) , intent(inout) :: B_field
			
			double precision , dimension(3) :: EM_force , r_i , v_i , E_i , B_i , v_B_i
			double precision , dimension(num_charges,3) :: update_v_i , update_r_i
			
			integer :: i
			
			call Fields(charge_mass_array , positions , velocities , E_field , B_field)
			
			do i = 1,num_charges
				
				r_i = positions(i,:)
				v_i = velocities(i,:)
				E_i = E_field(i,:)
				B_i = B_field(i,:)
				
				call cross(v_i , B_i , v_B_i)
				
				EM_force = E_i + v_B_i
				
				update_v_i(i,:) = v_i + dt * (charge_mass_array(i,1)/charge_mass_array(i,2)) * EM_force
				update_r_i(i,:) = r_i + dt * update_v_i(i,:)
			
			end do
			
			velocities = update_v_i
			positions = update_r_i
			
		end subroutine Forces

end module dynamics