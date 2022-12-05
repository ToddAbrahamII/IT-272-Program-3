       identification division.

       program-id. calc3000.

       environment division.

       input-output section.

       data division.

       file section.

       working-storage section.

       01  user-entries.

           05  number-entered              pic 9        value 1.
           05  loan-amount                 pic 999999.
           05  number-of-months            pic 99.
           05  interest-rate               pic 99v9.

       01  work-fields.
           05  interest-rate-dec           pic S9v9999999999.
           05  total-amount                pic 9(7)v99.
           05  interest-amount             pic 9(4)v99.
           05  monthly-payment             pic 9(7)v99.
           05  edited-monthly-payment      pic $z,zzz,zzz.99.
           05  monthly-rate                pic S9v9999999999 VALUE ZERO.
           05  num-annuity                 pic S9v9999999999 VALUE ZERO.

       procedure division.

       000-calculate-future-values.
           Display "Welcome to Todd's Program 3".
           perform 100-calculate-future-value
               until number-entered = zero.
           display "End of session.".
           stop run.

       100-calculate-future-value.

           display "----------------------------------------".
           display "To end the program, enter 0.".
           display "To perform another calculation, enter 1.".
           accept  number-entered.
           display "----------------------------------------".
           if number-entered = 1
               perform 110-get-user-values
               perform 120-compute-monthly-payment.
               display "Monthly Payment = " edited-monthly-payment.

       110-get-user-values.

           display "Enter loan amount (xxxxxx)."
           accept  loan-amount.
           display "Enter number of months (xx).".
           accept  number-of-months.
           display "Enter yearly interest rate (xx.x).".
           accept  interest-rate.

       120-compute-monthly-payment.
           compute interest-rate-dec = interest-rate/100.
           compute monthly-rate = interest-rate-dec/12.
           compute num-annuity  ROUNDED =
               FUNCTION ANNUITY (Monthly-rate, number-of-months).
           compute monthly-payment = loan-amount * num-annuity.
           move monthly-payment to edited-monthly-payment.




       END PROGRAM calc3000.
