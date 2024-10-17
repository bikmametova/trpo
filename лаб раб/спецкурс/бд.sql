CREATE TABLE users (
    user_id SERIAL PRIMARY KEY,
    last_name VARCHAR(50) NOT NULL,
    first_name VARCHAR(50) NOT NULL,
    middle_name VARCHAR(50),
    phone_number VARCHAR(15) UNIQUE NOT NULL CHECK (phone_number ~ '^\d+$'),
    position VARCHAR(50),
    email VARCHAR(100) UNIQUE NOT NULL,
    password VARCHAR(100) NOT NULL,
    role VARCHAR(20) NOT NULL CHECK (role IN ('хостес', 'администратор', 'клиент'))
);

CREATE TABLE dish_categories (
    category_id SERIAL PRIMARY KEY,
    category_name VARCHAR(100) UNIQUE NOT NULL
);

CREATE TABLE dishes (
    dish_id SERIAL PRIMARY KEY,
    dish_name VARCHAR(100) UNIQUE NOT NULL,
    photo BYTEA,
    description TEXT,
    category_id INT REFERENCES dish_categories(category_id),
    status VARCHAR(50) NOT NULL,
    price DECIMAL(10, 2) NOT NULL CHECK (price > 0)
);

CREATE TABLE cart (
    cart_id SERIAL PRIMARY KEY,
    dish_id INT REFERENCES dishes(dish_id),
    quantity INT NOT NULL CHECK (quantity > 0)
);

CREATE TABLE order_statuses (
    status_id SERIAL PRIMARY KEY,
    status_name VARCHAR(50) UNIQUE NOT NULL
);


CREATE TABLE order_types (
    type_id SERIAL PRIMARY KEY,
    type_name VARCHAR(50) UNIQUE NOT NULL
);

CREATE TABLE orders (
    order_id SERIAL PRIMARY KEY,
    cart_id INT REFERENCES cart(cart_id),
    payment_method VARCHAR(50) NOT NULL,
    order_type_id INT REFERENCES order_types(type_id),
    status_id INT REFERENCES order_statuses(status_id),
    order_date TIMESTAMP NOT NULL,
    employee_id INT REFERENCES users(user_id)
);
