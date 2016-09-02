! { dg-do compile }
      SUBROUTINE WORK(I)
        INTEGER I
        I=I+1
      END SUBROUTINE WORK
      SUBROUTINE CORRECT()
        INTEGER OMP_GET_THREAD_NUM
        INTEGER I
!$OMP PARALLEL PRIVATE(I)
          I = OMP_GET_THREAD_NUM()
          CALL WORK(I)
!$OMP END PARALLEL
      END SUBROUTINE CORRECT
