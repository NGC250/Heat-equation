subroutine integral(integrand , output)
	
	use globals
	implicit none
	
	real(kind = dp) , dimension(t_steps) , intent(in) :: integrand
	real(kind = dp) , intent(out) :: output
	
	output = dt * (sum(integrand) -  0.5_dp * (integrand(1) + integrand(t_steps)))
	
end subroutine integral
