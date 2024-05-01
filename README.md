# sql_challenge


In this repository you will find 1 Directory with 3 files and 8 ".png" images containing queries done.

Part 1. Data Modeling:
Please, refer to Directory "EmployeeSQL" file "Quick DBD-ER Diagram.png" to find the Entity Relationship Diagram (used Quick DBD).

Part2. Data Engineering:
Please, refer to Directory "EmployeeSQL" file "Quick DBD-Free Diagram (2).sql" to find the schema table script. Each step describes what the code is doing, with the primary and foreign keys, as well as the composite keys.
Afterwards, each CSV file provided, was imported successfully to each entity.

Part3. Data Analysis:
Please, refer to "EmployeeSQL" file "Data Analysis.sql" where you could find the queries performed to be able to deliver the requested views. Each view can be analyze in the files in png formats outside the Directory.

Challenges faced:
* When importing the data into each entity, I realized that DATE format was not accepted in Postgres, because the CSV file had a different layout than the once accepted in SQL. 
Therefore, I imported the data changing the format type in hiring date and birth date as VARCHAR, but later on, I created a view to add these 2 columns with the right format. 
These steps where done with the help on a Tutor, whose name is mentioned in the query.
* When creating the columns in Postgres, in Part2, I realized that the queries won't work if "" were missing in the query. I though it was extrange, because it does not follow the rule of "" learnt in class. However, in today's tutoring session,
I learnt that these are only required for tables that are in capital letters. Therefore, I updated the repository a couple of times to make the schema tables reflect that.
