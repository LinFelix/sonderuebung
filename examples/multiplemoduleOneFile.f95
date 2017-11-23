MODULE myawesomemodule
  IMPLICIT NONE

  ! Deklarationen die durch das ganze Module benutzbar sind
  INTEGER, PARAMETER, PUBLIC :: real_kind = SELECTED_REAL_KIND(P=18, R=1337)  ! Programs and modules that use myawesomemodule can use real_kind
  REAL(KIND=real_kind), PARAMETER, PRIVATE :: pi = 3.12, e = 2.7  ! programs and modules that use myawesomemodule CANNOT use pi and e

  CONTAINS

  
  FUNCTION rad_to_deg(rad) result(deg)  ! the value of deg at the end of the exection of the function rad_to_deg will be returned and can then be assigned or ignored
    IMPLICIT NONE
    REAL(KIND=real_kind), intent(in) :: rad  ! Now rad cannot be chanched within the function
    REAl(KIND=real_kind) :: deg !

    deg = rad * pi / 180
  END FUNCTION rad_to_deg


  REAL(KIND=real_kind) FUNCTION deg_to_rad(deg)
    IMPLICIT NONE
    REAL(KIND=real_kind), intent(in) :: deg
    deg_to_rad = deg * 180/pi
  END FUNCTION

END MODULE myawesomemodule


PROGRAM myawesomeprogramm
  USE myawesomemodule
  IMPLICIT NONE

  WRITE(*,*) rad_to_deg(REAL(90, KIND=real_kind))
  WRITE(*,*) deg_to_rad(REAL(1.6, KIND=real_kind))

END PROGRAM myawesomeprogramm
