DROP DATABASE IF EXISTS hw3;

CREATE DATABASE IF NOT EXISTS hw3;

USE hw3;

-- 'Персонал'
CREATE TABLE IF NOT EXISTS `staff`
(
	`id` INT AUTO_INCREMENT PRIMARY KEY,
    `first_name` VARCHAR(45),
    `last_name` VARCHAR(45),
    `post` VARCHAR(45),
    `seniority` INT,
    `salary` INT,
    `age` INT
);

INSERT INTO `staff` (first_name, last_name, post, seniority, salary, age)
VALUES 
 ('Андрей', 'Иванов', 'Начальник отдела', 40, 80000, 50),
 ('Евгений', 'Колосов', 'Заместитель начальника отдела', 8, 70000, 55),
 ('Виктория', 'Петрова', 'Главный инженер', 2, 65000, 32),
 ('Александр', 'Муратов', 'Ведущий инженер', 12, 50000, 25),
 ('Алексей', 'Иванов', 'Ведущий инженер', 40, 50000, 26),
 ('Анна', 'Александрова', 'Инженер-техник', 20, 35000, 40),
 ('Сидр', 'Сидоров', 'Инженер-техник', 10, 35000, 35),
 ('Антон', 'Антонов', 'Инженер-техник', 8, 25000, 27),
 ('Юрий', 'Юрков', 'Инженер-техник', 5, 25000, 35),
 ('Максим', 'Максимов', 'Инженер-техник', 2, 20000, 22),
 ('Юрий', 'Галкин', 'Инженер-техник', 3, 20000, 34),
 ('Людмила', 'Маркина', 'Инженер-техник', 10, 19000, 19);

-- 1. Отсортируйте данные по полю заработная плата (salary) в порядке: убывания; возрастания

-- по возрастанию: 
SELECT *
FROM staff
ORDER BY salary;

-- по убыванию:
SELECT *
FROM staff
ORDER BY salary DESC;


-- 2. Выведите 5 максимальных заработных плат (saraly)
SELECT salary
FROM staff
ORDER BY salary DESC
LIMIT 5;


-- 3. Посчитайте суммарную зарплату (salary) по каждой специальности (роst)
SELECT 
	post,
    SUM(salary) AS sum_salary
FROM staff
GROUP BY post;


-- 4. Найдите кол-во сотрудников с специальностью (post) «Рабочий» в возрасте от 24 до 49 лет включительно.
SELECT
	COUNT(id) AS count_id
FROM staff
WHERE post = "Рабочий" AND age > 24 AND age <= 49;

-- 5. Найдите количество специальностей
SELECT 
	COUNT(DISTINCT post) AS count_post
FROM staff;

-- 6. Выведите специальности, у которых средний возраст сотрудников меньше 30 лет 
SELECT
	post
FROM staff
GROUP BY post
HAVING AVG(age) < 30;