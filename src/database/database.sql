drop table users CASCADE;

create table users(
    user_id serial primary key,
    user_name varchar(64) not null,
    user_password varchar(64),
    user_type int not null,
    user_img varchar(128)
);

insert into users(user_name, user_type) values('Abdullayev', 2);
insert into users(user_name, user_type) values('Admin111', 2);
insert into users(user_name, user_type) values('Abror', 2);

drop table food_type CASCADE;

create table food_type(
    food_type_id serial primary key,
    food_type_name varchar(32) not null
);

insert into food_type(food_type_name) values('Drinks');
insert into food_type(food_type_name) values('Pizzas');
insert into food_type(food_type_name) values('Deserts');
insert into food_type(food_type_name) values('Burgers');
insert into food_type(food_type_name) values('Spinners');
insert into food_type(food_type_name) values('Chickens');
insert into food_type(food_type_name) values('Others');

drop table foods CASCADE;

create table foods(
    food_id serial primary key,
    food_name varchar(64) not null,
    food_img varchar(256),
    food_price int not null,
    food_type int not null references food_type(food_type_id)
);

insert into foods(food_name, food_img, food_price, food_type) values('appetizer_bites', 'appetizer_bites.jpg', 13000, 7);
insert into foods(food_name, food_img, food_price, food_type) values('appetizer_cheese_nuggets', 'appetizer_cheese_nuggets.jpg', 10000, 7);
insert into foods(food_name, food_img, food_price, food_type) values('burger_bigger', 'burger_bigger.jpg', 18000, 4);
insert into foods(food_name, food_img, food_price, food_type) values('burger_cheese', 'burger_cheese.jpg', 18000, 4);
insert into foods(food_name, food_img, food_price, food_type) values('burger_chicken_longer', 'burger_chicken_longer.jpg', 15000, 4);
insert into foods(food_name, food_img, food_price, food_type) values('burger_doublecheese', 'burger_doublecheese.jpg', 24000, 4);
insert into foods(food_name, food_img, food_price, food_type) values('burger_hamburger', 'burger_hamburger.jpg', 20000, 4);
insert into foods(food_name, food_img, food_price, food_type) values('burger_loook', 'burger_loook.jpg', 16000, 4);
insert into foods(food_name, food_img, food_price, food_type) values('CHEESE_FRIES', 'CHEESE_FRIES.png', 11000, 7);
insert into foods(food_name, food_img, food_price, food_type) values('chicken_bucket_21', 'chicken_bucket_21.jpg', 240000, 6);
insert into foods(food_name, food_img, food_price, food_type) values('chicken_dinner_meal', 'chicken_dinner_meal.jpg', 32000, 6);
insert into foods(food_name, food_img, food_price, food_type) values('chicken_piece', 'chicken_piece.jpg', 10000, 6);
insert into foods(food_name, food_img, food_price, food_type) values('chicken_piece_normal', 'chicken_piece_normal.jpg', 9000, 6);
insert into foods(food_name, food_img, food_price, food_type) values('chicken_togora', 'chicken_togora.jpg', 180000, 6);
insert into foods(food_name, food_img, food_price, food_type) values('cola', 'cola.jpg', 8000, 1);
insert into foods(food_name, food_img, food_price, food_type) values('COMBO', 'COMBO.png', 17000, 1);
insert into foods(food_name, food_img, food_price, food_type) values('desserts_chocotastic', 'desserts_chocotastic.jpg', 11000, 3);
insert into foods(food_name, food_img, food_price, food_type) values('desserts_lemon_curd', 'desserts_lemon_curd.jpg', 9000, 3);
insert into foods(food_name, food_img, food_price, food_type) values('desserts_red_wave', 'desserts_red_wave.jpg', 11000, 3);
insert into foods(food_name, food_img, food_price, food_type) values('desserts_safer', 'desserts_safer.jpg', 10000, 3);
insert into foods(food_name, food_img, food_price, food_type) values('desserts_shake_apple', 'desserts_shake_apple.jpg', 12000, 3);
insert into foods(food_name, food_img, food_price, food_type) values('desserts_shake_banana', 'desserts_shake_banana.jpg', 12000, 3);
insert into foods(food_name, food_img, food_price, food_type) values('desserts_shake_kit_kat', 'desserts_shake_kit_kat.jpg', 12000, 3);
insert into foods(food_name, food_img, food_price, food_type) values('desserts_shake_strawberry', 'desserts_shake_strawberry.jpg', 12000, 3);
insert into foods(food_name, food_img, food_price, food_type) values('desserts_souffle', 'desserts_souffle.jpg', 13000, 3);
insert into foods(food_name, food_img, food_price, food_type) values('drink_ice_tea', 'drink_ice_tea.jpg', 8000, 1);
insert into foods(food_name, food_img, food_price, food_type) values('drink_water_0_5', 'drink_water_0_5.jpg', 3000, 1);
insert into foods(food_name, food_img, food_price, food_type) values('fanta', 'fanta.jpg', 8000, 1);
insert into foods(food_name, food_img, food_price, food_type) values('pepsi', 'pepsi.jpg', 8000, 1);
insert into foods(food_name, food_img, food_price, food_type) values('pizza_bbq', 'pizza_bbq.jpg', 34000, 2);
insert into foods(food_name, food_img, food_price, food_type) values('pizza_frankfurt', 'pizza_frankfurt.jpg', 40000, 2);
insert into foods(food_name, food_img, food_price, food_type) values('pizza_hawaiian', 'pizza_hawaiian.jpg', 44000, 2);
insert into foods(food_name, food_img, food_price, food_type) values('pizza_margarita', 'pizza_margarita.jpg', 38000, 2);
insert into foods(food_name, food_img, food_price, food_type) values('pizza_pepperoni', 'pizza_pepperoni.jpg', 38000, 2);
insert into foods(food_name, food_img, food_price, food_type) values('pizza_spicy', 'pizza_spicy.jpg', 35000, 2);
insert into foods(food_name, food_img, food_price, food_type) values('pizza_steak', 'pizza_steak.jpg', 49000, 2);
insert into foods(food_name, food_img, food_price, food_type) values('pizza_super_supreme', 'pizza_super_supreme.jpg', 42000, 2);
insert into foods(food_name, food_img, food_price, food_type) values('pizza_vegetarian', 'pizza_vegetarian.jpg', 32000, 2);
insert into foods(food_name, food_img, food_price, food_type) values('pizza_white_cheese', 'pizza_white_cheese.jpg', 36000, 2);
insert into foods(food_name, food_img, food_price, food_type) values('salad_coleslaw', 'salad_coleslaw.jpg', 6000, 7);
insert into foods(food_name, food_img, food_price, food_type) values('salad_loook', 'salad_loook.jpg', 8000, 7);
insert into foods(food_name, food_img, food_price, food_type) values('salad_veggie_fresh', 'salad_veggie_fresh.jpg', 9000, 7);
insert into foods(food_name, food_img, food_price, food_type) values('smile_fries', 'smile_fries.jpg', 9000, 7);
insert into foods(food_name, food_img, food_price, food_type) values('spinner_duet_master', 'spinner_duet_master.jpg', 25000, 5);
insert into foods(food_name, food_img, food_price, food_type) values('spinner_smile_box', 'spinner_smile_box.jpg', 23000, 5);
insert into foods(food_name, food_img, food_price, food_type) values('spinner_snack_wrap', 'spinner_snack_wrap.jpg', 18000, 5);
insert into foods(food_name, food_img, food_price, food_type) values('spinner_wrap', 'spinner_wrap.jpg', 15000, 5);
insert into foods(food_name, food_img, food_price, food_type) values('sprite', 'sprite.jpg', 8000, 1);

drop table orders CASCADE;

create table orders(
    order_id serial primary key,
    user_id int not null references users(user_id),
    food_id int not null references foods(food_id),
    count int not null
);

insert into orders(user_id, food_id, count) values(1, 5, 2);
insert into orders(user_id, food_id, count) values(1, 7, 1);
insert into orders(user_id, food_id, count) values(3, 12, 2);
insert into orders(user_id, food_id, count) values(2, 25, 3);
insert into orders(user_id, food_id, count) values(1, 34, 1);
insert into orders(user_id, food_id, count) values(3, 26, 1);
insert into orders(user_id, food_id, count) values(2, 15, 5);
insert into orders(user_id, food_id, count) values(2, 7, 3);
insert into orders(user_id, food_id, count) values(3, 9, 2);
insert into orders(user_id, food_id, count) values(2, 29, 5);