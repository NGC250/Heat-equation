module VectorAlgebra
	
	use constants
	implicit none
	
	contains
		
		subroutine cross(vectorA , vectorB , AxB)
		
			double precision , dimension(3) , intent(in):: vectorA
			double precision , dimension(3) , intent(in):: vectorB
			double precision , dimension(3) , intent(out):: AxB
			
			AxB(1) = vectorA(2) * vectorB(3) - vectorA(3) * vectorB(2)
			AxB(2) = vectorA(3) * vectorB(1) - vectorA(1) * vectorB(3)
			AxB(3) = vectorA(1) * vectorB(2) - vectorA(2) * vectorB(1)
		
		end subroutine cross
	
		! subroutine div(vector , div_vector)
		
			! double precision , dimension(3) , intent(in) :: vector
			! double precision , intent(out) :: div_vector
			
			
		
		! end subroutine divergence
		
		! subroutine curl(vector)
		
		
		
		! end subroutine curl
	
		! subroutine grad
	
		
		
		! end subroutine grad
		
end module VectorAlgebra