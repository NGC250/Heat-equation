module constants
	implicit none
	
	! system parameters
	integer , parameter :: num_charges = 8
	double precision , parameter :: L = 10.0
	double precision , parameter :: B = 10.0
	double precision , parameter :: H = 10.0
	double precision , parameter :: volume = L * B * H
	
	! physical constants
	double precision , parameter :: pi = 4.0 * atan(1.0)
	double precision , parameter :: epsilon0 = 1.0
	double precision , parameter :: mu0 = 1.0 !Highly exaggerated magnitude (in actuality B_field ~ 1e-8 * E_field)
	
	! simulation parameters
	integer , parameter :: iterations = 100
	double precision , parameter :: dt = 0.01
	double precision , parameter :: dx = 0.001
	double precision , parameter :: dy = 0.001
	double precision , parameter :: dz = 0.001
	
	double precision :: Ke = 1.0/(4.0 * pi * epsilon0) , Km = mu0/(4.0 * pi)
	
end module constants