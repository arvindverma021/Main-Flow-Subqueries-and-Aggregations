CREATE DATABASE TASK3;
USE TASK3;

-- CREATING A TABLE
CREATE TABLE Students (
    student_id INT PRIMARY KEY,
    name VARCHAR(50),
    math_score INT,
    science_score INT,
    english_score INT,
    total_score INT
);

-- INSERTING DATA INTO TABLE
INSERT INTO Students (student_id, name, math_score, science_score, english_score)
VALUES
(1, 'Alice', 85, 90, 78),
(2, 'Bob', 92, 88, 85),
(3, 'Charlie', 75, 70, 80),
(4, 'David', 90, 95, 85),
(5, 'Eve', 88, 77, 93);


-- TASK 1 : Identify Top Students by Total Scores ----
SELECT name, 
       (math_score + science_score + english_score) AS total_score
FROM Students
ORDER BY total_score DESC
LIMIT 5;
-- Explaination --
-- The subquery (math_score + science_score + english_score) calculates the total score for each student. This result is then used in the main query to order the students by their total score and limit the output to the top 5 students.


-- Task 2: Calculate Averages Based on Specific Conditions----

-- Example 1: Calculate the average score of students who scored above 70 in Math----
SELECT AVG(math_score) AS average_math_score
FROM Students
WHERE math_score > 70;
-- Explaination --
-- The subquery WHERE math_score > 70 filters the data to include only those students who scored above 70 in Math. The main query then calculates the average of these filtered scores.

-- EXAMPLE 2: Calculate the average total score of students grouped by a specific condition, such as a score range (e.g., students scoring 200–250 in total)----
SELECT AVG(total_score) AS average_total_score
FROM (
    SELECT (math_score + science_score + english_score) AS total_score
    FROM Students
) AS subquery
WHERE total_score BETWEEN 200 AND 250;
-- Explaination --
-- The subquery (math_score + science_score + english_score) AS total_score calculates the total score for each student. The main query then filters these total scores to include only those within the range of 200 to 250 and calculates the average of these filtered scores.

-- Task 3: Find Second-Highest Math Scores----
SELECT MAX(math_score) AS second_highest_math_score
FROM Students
WHERE math_score < (SELECT MAX(math_score) FROM Students);
-- Explaination --
-- The subquery (SELECT MAX(math_score) FROM Students) finds the highest Math score. The main query then uses this result to exclude the top score and find the second-highest Math score using MAX(math_score).



