# Amazon_Vine_Analysis

### Overview of the analysis

This project is analyzing Amazon reviews written by members of the paid Amazon Vine program. The Amazon Vine program is a service that allows manufacturers and publishers to receive reviews for their products. Companies like SellBy pay a small fee to Amazon and provide products to Amazon Vine members, who are then required to publish a review.

Here I am analyzing the [video games reviews](https://s3.amazonaws.com/amazon-reviews-pds/tsv/amazon_reviews_us_Video_Games_v1_00.tsv.gz) AWS dataset. The two processes are performed here.

  1. Amazon_Reviews_ETL.ipynb : ETL process is performed, Extract the data from AWS server to dataframes, Transform the data as per our database schema, Load the data into my                                   AWS Postgres database. 
  2. Vine_Review_Analysis.sql: Write the queries in Postgres database determine if there is any bias toward favorable reviews from Vine members in the video games dataset.
  
### Results

I have added [my Postgres script](https://github.com/nidhipandya/Amazon_Vine_Analysis/blob/main/Vine_Review_Analysis.sql) screenshots to show the results.

* How many Vine reviews and non-Vine reviews were there?
  * Total Vine Reviews 
  
    ![img1](https://github.com/nidhipandya/Amazon_Vine_Analysis/blob/main/images/img1.PNG) 
    
  
    Total non-Vine Reviews
    
    ![img2](https://github.com/nidhipandya/Amazon_Vine_Analysis/blob/main/images/img2.PNG)
  
* How many Vine reviews were 5 stars? How many non-Vine reviews were 5 stars?
  * Total Vine Reviews were 5 stars rating
  
    ![img3](https://github.com/nidhipandya/Amazon_Vine_Analysis/blob/main/images/img3.PNG) 
    
  
    Total non-Vine Reviews were 5 stars rating
    
    ![img4](https://github.com/nidhipandya/Amazon_Vine_Analysis/blob/main/images/img4.PNG)
 
* What percentage of Vine reviews were 5 stars? What percentage of non-Vine reviews were 5 stars?
  * Here I created two views in postgres to get the percentage of Vine and non-Vine review were 5 stars rating. 
    percentage of Vine reviews were 5 stars rating
  
    ![img5](https://github.com/nidhipandya/Amazon_Vine_Analysis/blob/main/images/img5.PNG) 
    
  
    percentage of non-Vine reviews were 5 stars rating
    
    ![img6](https://github.com/nidhipandya/Amazon_Vine_Analysis/blob/main/images/img6.PNG)
    

### Summary

The result suggests that there is a bias toward five-star reviews from paid-reviewers. We can say that there is a positive bias for vine program reviews becuase the percentage of 5 stars review(51%) is more than the unpaid review(38%). still we recommends to analyse other ratings to confirm the our bias reault and also we can see statistical distribution(mean, median and mode) of the star rating for the vine and non-vine reviews.
