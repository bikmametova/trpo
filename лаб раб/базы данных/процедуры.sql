/*1. Добавление нового курса*/
DELIMITER //

CREATE PROCEDURE add_course(
    IN course_name VARCHAR(255),
    IN course_description TEXT,
    IN course_price DECIMAL(10, 2)
)
BEGIN
    INSERT INTO Course (Name, Description, Price)
    VALUES (course_name, course_description, course_price);
END //

DELIMITER ;

CALL add_course('JavaScript для начинающих', 'Основы программирования на JavaScript', 6000);

/*2. Добавление нового урока*/

DELIMITER //

CREATE PROCEDURE add_lesson(
    IN lesson_name VARCHAR(255),
    IN lesson_description TEXT,
    IN lesson_materials TEXT,
    IN course_id INT
)
BEGIN
    INSERT INTO Lesson (Name, Description, Materials, Course_ID)
    VALUES (lesson_name, lesson_description, lesson_materials, course_id);
END //

DELIMITER ;

CALL add_lesson('Введение в JavaScript', 'Основные понятия и синтаксис', 'PDF, видео', 11);

/*3. Добавление нового учащегося*/
DELIMITER //

CREATE PROCEDURE add_student(
    IN full_name VARCHAR(255),
    IN email VARCHAR(255),
    IN phone VARCHAR(15)
)
BEGIN
    INSERT INTO Student (Full_Name, Email, Phone)
    VALUES (full_name, email, phone);
END //

DELIMITER ;

CALL add_student('Анна Смирнова', 'anna@example.com', '89123456789');

/*4. Регистрация оплаты за курс*/

DELIMITER //

CREATE PROCEDURE register_payment(
    IN student_id INT,
    IN course_id INT,
    IN amount DECIMAL(10, 2),
    IN payment_date DATE
)
BEGIN
    -- Вставка данных об оплате в таблицу Payment
    INSERT INTO Payment (Student_ID, Course_ID, Amount, Payment_Date)
    VALUES (student_id, course_id, amount, payment_date);

    -- Получение названия курса для уведомления
    DECLARE course_name VARCHAR(255);
    SELECT Name INTO course_name FROM Course WHERE ID = course_id;

    -- Формирование текста уведомления
    DECLARE notification_text TEXT;
    SET notification_text = CONCAT('Ваша оплата за курс "', course_name, '" на сумму ', amount, ' подтверждена.');

    -- Вставка уведомления в таблицу Notification
    INSERT INTO Notification (Student_ID, Text, Notification_Date)
    VALUES (student_id, notification_text, payment_date);
END //

DELIMITER ;

CALL register_payment(1, 1, 5000, '2023-10-01');

/*5. Добавление оценки за урок*/

DELIMITER //

CREATE PROCEDURE add_grade(
    IN lesson_id INT,
    IN student_id INT,
    IN grade INT
)
BEGIN
    INSERT INTO Grade (Lesson_ID, Student_ID, Grade)
    VALUES (lesson_id, student_id, grade);
END //

DELIMITER ;

CALL add_grade(1, 1, 5);

/*6. Получение списка уроков курса*/

DELIMITER //

CREATE PROCEDURE get_course_lessons(
    IN course_id INT
)
BEGIN
    SELECT Name FROM Lesson WHERE Course_ID = course_id;
END //

DELIMITER ;

CALL get_course_lessons(1);

/*7. Получение списка курсов учащегося*/

DELIMITER //

CREATE PROCEDURE get_student_courses(
    IN student_id INT
)
BEGIN
    SELECT Course.Name
    FROM Course
    JOIN Payment ON Course.ID = Payment.Course_ID
    WHERE Payment.Student_ID = student_id;
END //

DELIMITER ;

CALL get_student_courses(1);



/*8. Получение статистики по оплатам*/
/*9. Получение списка уведомлений учащегося*/
/*10. Получение средней оценки учащегося*/



