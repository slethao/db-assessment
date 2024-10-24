-- Question 1
/* The youngest pet is Anna. (birthday is 2024-10-12)
    Commands:
        SELECT pet.givenName, pet.dateOfBirth, animal.name AS "Animal Type"
        FROM pet
        JOIN extremity ON extremity.animalID = pet.animalID
        JOIN animal ON animal.id = extremity.id
        ORDER BY dateOfBirth DESC
        LIMIT 1
    Performance Anwser:
        The pupose of joning the extremity with the pet table is becasue they
        share the same column name animalID, so I'm able to access the id column
        from the animal table but also having access to the column, dateOfBirth,
        from the pet table. The reason for joining multiple tables is to allow the
        programmer to access multiple columns from different tables at one time.
            So in this question you needed to look into the type of animal, whcih
            would be found in the animal table and the dateOfBirth found in the pet
            table. However, the animal and pet table do not share any common groups
            but pets share animalId with pet, animal shares an id column with extremity.
            So, combining these tables based on these similar columns allows the programmer
            to access the animal type and dateOfBirth at the same time.
*/
-- Question 2
/* Yes, you would just have to query the records that contains a conditional
   that would have filter out any birthdays that happened 3-4 years ago
   (there should be 2 records)
    Commands:
        SELECT uuid, givenName, dateOfBirth
        FROM pet
        WHERE YEAR(NOW()) - YEAR(dateOfBirth) = 3 OR YEAR(NOW()) - YEAR(dateOfBirth) = 4

*/
-- Question 3
/* 
    Code:
        -- Creating viewable object
        CREATE VIEW NumPetType AS
        SELECT COUNT(animal.name) AS "# of types", animal.name
        FROM pet, animal, extremity
        WHERE animal.id = extremity.id AND pet.animalID = extremity.animalID
        GROUP BY animal.name

        -- Displays the view object made
        SELECT *
        FROM NumPetType

*/
-- Question 4
/* 
    Code:
        SELECT pet.animalid, givenName, name
        FROM pet
        JOIN extremity ON extremity.animalId = pet.animalId
        JOIN animal ON animal.id = extremity.id
        ORDER BY name, givenName
    
    Performance Anwser:
        The pupose of joning the extremity with the pet table is becasue they
        share the same column name animalID, so I'm able to access the id column
        from the animal table but also having access to the column, dateOfBirth,
        from the pet table. The reason for joining multiple tables is to allow the
        programmer to access multiple columns from different tables at one time.
            In this question you needed to display the pet names that are found in
            the pet table and the animal type that was found in animal table. So,
            you must find a way to access the givenName column in the pet table
            and the name group in animal table in order to acomplish this task.
            Unfortunately, the pet and animal table do not share any common columns.
            However, extremity shared the column animalId with pet and extremity
            shares the id column with animal. So, if you join the extremity table
            on the animalID and the animalid this would be possible.
*/
-- Question 5
/* The animal name Paul, the piegon.
    Code:
        SELECT givenName, dateOfBirth, legs, animal.name -- I just wanted to see the type of animal
        FROM pet
        JOIN extremity ON extremity.animalid = pet.animalID
        JOIN animal ON animal.id = pet.animalID
        WHERE legs < 3
        ORDER BY dateOfBirth ASC
        LIMIT 1

*/
-- Question 6
/* The ratio is ~44% male and ~56% female. (5:4 -> F:M)
    Code 1#:
        Commands (for separate records with just the count for each gender):
            SELECT DISTINCT(gender), COUNT(gender) AS "Number"
            FROM pet
            GROUP BY gender

    Code #2:
        The more description version description:
            SELECT
            CASE
                WHEN gender = 0 THEN "Female"
                ELSE "Male"
            END AS Description, COUNT(gender) AS "Number"
            FROM pet
            GROUP BY gender

*/
-- Question 7
/* The pets that would be celebrated at this event would be Paul, Henry, Felix, and Mandy.
    Code: 
        SELECT *
        FROM pet
        WHERE MONTH(dateOfBirth) <= 8 AND MONTH(dateOfBirth) >= 6
    Anwser to a meteorological or astronomical summer:
        I think its going to be an  astronomical summer because the
        data in the table that we are looking at, dateOfBirth, is based
        on what month the pet was born.
*/
-- Question 8 (first version)
/*
    I believe you can just use a integer variable that could act as
    a boolean value, to see if there are tails or no tails and it will
    just output a message specifying if there are any tails on teh animal.
        Logic Breif:
            If there is a tail = 1 *or greater than one, if there are more animals that what was specified all ready* (msg: "Tail")
            If there is NO tail = 0, (msg: "No Tails")
        Code:
            SELECT
            CASE
                WHEN tails > 0 THEN "Tails"
                ELSE "No Tails"
            END AS TailStatus, extremity.legs, extremity.id, extremity.animalId
            FROM extremity;
        Code (with a Boolean value 1 = tail and 0 = no tails):
            //

*/
-- Question 8 (second version)
/* The commonalities that could appear whcih is groups that already exist in
    the tables in the database such as gender, dateOfBirth, and the animal type.
    In addition to maybe other groups to add--but not limited to--such as heatlth status, wieght, and vaccines
    that were already recieved or not recieved, and if the pet is already on medications or
    not (medicated status).
   A data-related questions could arise from information would be the dosage of how much medication
   the pet is taking, what sort of diet the pet is on and how much of a portion size they need to take,
   also do you need a selection for the veterian to place personal notes for the pet to follow to maintain
   or imporve the condition of the pet. These facotrs could be separte tables in the database. 
*/