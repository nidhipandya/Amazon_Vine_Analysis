/*retrieve all the rows where the total_votes count is equal to or greater than 20 to pick reviews*/
CREATE TABLE VINE_total_votes AS 
(select * from vine_table where total_votes >= 20)
Select * from VINE_total_votes

/*retrieve all the rows where the number of helpful_votes divided by total_votes is equal to or greater than 50%.*/
CREATE TABLE VINE_helpful_votes AS 
(Select * from VINE_total_votes where CAST(helpful_votes AS FLOAT)/CAST(total_votes AS FLOAT) >=0.5)
Select * from VINE_helpful_votes

/*retrieves all the rows where a review was written as part of the Vine program (paid)*/
CREATE TABLE VINE_vine_Y AS
(Select * from VINE_helpful_votes where vine = 'Y')
Select * from VINE_vine_Y

/*retrieve all the rows where the review was not part of the Vine program (unpaid)*/
CREATE TABLE VINE_vine_N AS
(Select * from VINE_helpful_votes where vine = 'N')
Select * from VINE_vine_N

/* Total Number of Reviews (Paid vs Unpaid) */
Select count(*) as paid_total from VINE_vine_Y --94
Select count(*) as unpaid_total from VINE_vine_N --40471

/* Total Number of 5-star reviews (Paid vs Unpaid ) */
Select count(*) as paid_5star from VINE_vine_Y where star_rating = 5 --48
Select count(*) as unpaid_5star from VINE_vine_N where star_rating = 5 --15663

/* Created views */
-- paid where paid_total, paid_5star are two columns
-- unpaid where unpaid_total, unpaid_5star are two columns

/* Percentage of 5-star reviews (Paid vs Unpaid)*/
Select 
  cast(paid_5star as float)/cast(paid_total as float) * 100
  AS percent_total_paid
  FROM paid --51.0638%
  
Select 
  cast(unpaid_5star as float)/cast(unpaid_total as float) * 100
  AS percent_total_unpaid
  FROM unpaid --38.7017%