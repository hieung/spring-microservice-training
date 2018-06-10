select * from search.flight;
select * from search.inventory;

select * from book.inventory;
select * from book.booking_record;
select * from book.passenger;

select * from checkin.check_in_record;
select * from fares.fare;


drop schema book cascade;
drop schema search cascade;
drop schema fares cascade;
drop schema checkin cascade;

create schema book;
create schema search;
create schema fares;
create schema checkin;

-- Table: book.booking_record

-- DROP TABLE book.booking_record;

CREATE TABLE book.booking_record
(
    id serial NOT NULL,
    booking_date timestamp without time zone,
    destination character varying(255) COLLATE pg_catalog."default",
    fare character varying(255) COLLATE pg_catalog."default",
    flight_date character varying(255) COLLATE pg_catalog."default",
    flight_number character varying(255) COLLATE pg_catalog."default",
    origin character varying(255) COLLATE pg_catalog."default",
    status character varying(255) COLLATE pg_catalog."default",
    CONSTRAINT booking_record_pkey PRIMARY KEY (id)
)
WITH (
    OIDS = FALSE
)
TABLESPACE pg_default;

ALTER TABLE book.booking_record
    OWNER to postgres;

-- Table: book.inventory

-- DROP TABLE book.inventory;

CREATE TABLE book.inventory
(
    id serial NOT NULL,
    available integer NOT NULL,
    flight_date character varying(255) COLLATE pg_catalog."default",
    flight_number character varying(255) COLLATE pg_catalog."default",
    CONSTRAINT inventory_pkey PRIMARY KEY (id)
)
WITH (
    OIDS = FALSE
)
TABLESPACE pg_default;

ALTER TABLE book.inventory
    OWNER to postgres;

-- Table: book.passenger

-- DROP TABLE book.passenger;

CREATE TABLE book.passenger
(
    id serial NOT NULL,
    first_name character varying(255) COLLATE pg_catalog."default",
    gender character varying(255) COLLATE pg_catalog."default",
    last_name character varying(255) COLLATE pg_catalog."default",
    booking_id serial,
    CONSTRAINT passenger_pkey PRIMARY KEY (id),
    CONSTRAINT fk_gikudjkl76maaif7e10kgkybi FOREIGN KEY (booking_id)
        REFERENCES book.booking_record (id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
)
WITH (
    OIDS = FALSE
)
TABLESPACE pg_default;

ALTER TABLE book.passenger
    OWNER to postgres;

-- Table: checkin.check_in_record

-- DROP TABLE checkin.check_in_record;

CREATE TABLE checkin.check_in_record
(
    id serial NOT NULL,
    booking_id serial NOT NULL,
    check_in_time timestamp without time zone,
    first_name character varying(255) COLLATE pg_catalog."default",
    flight_date character varying(255) COLLATE pg_catalog."default",
    flight_number character varying(255) COLLATE pg_catalog."default",
    last_name character varying(255) COLLATE pg_catalog."default",
    seat_number character varying(255) COLLATE pg_catalog."default",
    CONSTRAINT check_in_record_pkey PRIMARY KEY (id)
)
WITH (
    OIDS = FALSE
)
TABLESPACE pg_default;

ALTER TABLE checkin.check_in_record
    OWNER to postgres;

-- Table: fares.fare

-- DROP TABLE fares.fare;

CREATE TABLE fares.fare
(
    id serial NOT NULL,
    fare character varying(255) COLLATE pg_catalog."default",
    flight_date character varying(255) COLLATE pg_catalog."default",
    flight_number character varying(255) COLLATE pg_catalog."default",
    CONSTRAINT fare_pkey PRIMARY KEY (id)
)
WITH (
    OIDS = FALSE
)
TABLESPACE pg_default;

ALTER TABLE fares.fare
    OWNER to postgres;

-- Table: search.fares

-- DROP TABLE search.fares;

CREATE TABLE search.fares
(
    id serial NOT NULL,
    currency character varying(255) COLLATE pg_catalog."default",
    fare character varying(255) COLLATE pg_catalog."default",
    CONSTRAINT fares_pkey PRIMARY KEY (id)
)
WITH (
    OIDS = FALSE
)
TABLESPACE pg_default;

ALTER TABLE search.fares
    OWNER to postgres;

-- Table: search.flight

-- DROP TABLE search.flight;

CREATE TABLE search.flight
(
    id serial NOT NULL,
    destination character varying(255) COLLATE pg_catalog."default",
    flight_date character varying(255) COLLATE pg_catalog."default",
    flight_number character varying(255) COLLATE pg_catalog."default",
    origin character varying(255) COLLATE pg_catalog."default",
    fare_id serial,
    inv_id serial,
    CONSTRAINT flight_pkey PRIMARY KEY (id),
    CONSTRAINT fk_glgeh9rbe4g7h88e7oymuvpo4 FOREIGN KEY (inv_id)
        REFERENCES search.inventory (id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION,
    CONSTRAINT fk_mqdku2ku3913h6iq0t28a0fw6 FOREIGN KEY (fare_id)
        REFERENCES search.fares (id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
)
WITH (
    OIDS = FALSE
)
TABLESPACE pg_default;

ALTER TABLE search.flight
    OWNER to postgres;

-- Table: search.inventory

-- DROP TABLE search.inventory;

CREATE TABLE search.inventory
(
    id serial NOT NULL,
    count integer NOT NULL,
    CONSTRAINT inventory_pkey PRIMARY KEY (id)
)
WITH (
    OIDS = FALSE
)
TABLESPACE pg_default;

ALTER TABLE search.inventory
    OWNER to postgres;

--- SEQUENCE

CREATE SEQUENCE book.seq_bookingrecord
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
CREATE SEQUENCE book.seq_inventory
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
CREATE SEQUENCE book.seq_passenger
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
--
CREATE SEQUENCE checkin.seq_checkinrecord
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
--
CREATE SEQUENCE search.seq_flight
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
CREATE SEQUENCE search.seq_inventorysearch
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
CREATE SEQUENCE search.seq_searchfares
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
--
CREATE SEQUENCE fares.seq_fare
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;           



--truncate table book.booking_record cascade;
INSERT INTO book.booking_record (id, booking_date, destination, fare, flight_date, flight_number, origin, status) VALUES (1, '2017-11-09 13:00:19.035', 'SFO', '101', '22-JAN-16', 'BF101', 'NYC', 'BOOKING_CONFIRMED');
INSERT INTO book.booking_record (id, booking_date, destination, fare, flight_date, flight_number, origin, status) VALUES (2, '2017-11-09 13:02:13.328', 'SFO', '101', '22-JAN-16', 'BF101', 'NYC', 'BOOKING_CONFIRMED');

--truncate table book.inventory cascade;
INSERT INTO book.inventory (id, available, flight_date, flight_number) VALUES (1, 100, '22-JAN-16', 'BF100');
INSERT INTO book.inventory (id, available, flight_date, flight_number) VALUES (2, 98, '22-JAN-16', 'BF101');
INSERT INTO book.inventory (id, available, flight_date, flight_number) VALUES (3, 100, '22-JAN-16', 'BF102');
INSERT INTO book.inventory (id, available, flight_date, flight_number) VALUES (4, 100, '22-JAN-16', 'BF103');
INSERT INTO book.inventory (id, available, flight_date, flight_number) VALUES (5, 100, '22-JAN-16', 'BF104');
INSERT INTO book.inventory (id, available, flight_date, flight_number) VALUES (6, 100, '22-JAN-16', 'BF105');
INSERT INTO book.inventory (id, available, flight_date, flight_number) VALUES (7, 100, '22-JAN-16', 'BF106');


--truncate table book.passenger cascade;
INSERT INTO book.passenger (id, first_name, gender, last_name, booking_id) VALUES (1, 'Gean', 'Male', 'Franc', 1);
INSERT INTO book.passenger (id, first_name, gender, last_name, booking_id) VALUES (2, 'Gavin', 'Male', 'Franc', 2);

--truncate table checkin.check_in_record cascade;
INSERT INTO checkin.check_in_record (id, booking_id, check_in_time, first_name, flight_date, flight_number, last_name, seat_number) VALUES (1, 1, '2017-11-09 12:57:12.381', 'Gean', '22-JAN-16', 'BF101', 'Franc', '28A');
INSERT INTO checkin.check_in_record (id, booking_id, check_in_time, first_name, flight_date, flight_number, last_name, seat_number) VALUES (2, 2, '2017-11-09 13:02:14.819', 'Gavin', '22-JAN-16', 'BF101', 'Franc', '28C');

--truncate table fares.fare cascade;
INSERT INTO fares.fare (id, fare, flight_date, flight_number) VALUES (1, '101', '22-JAN-16', 'BF100');
INSERT INTO fares.fare (id, fare, flight_date, flight_number) VALUES (2, '101', '22-JAN-16', 'BF101');
INSERT INTO fares.fare (id, fare, flight_date, flight_number) VALUES (3, '102', '22-JAN-16', 'BF102');
INSERT INTO fares.fare (id, fare, flight_date, flight_number) VALUES (4, '103', '22-JAN-16', 'BF103');
INSERT INTO fares.fare (id, fare, flight_date, flight_number) VALUES (5, '104', '22-JAN-16', 'BF104');
INSERT INTO fares.fare (id, fare, flight_date, flight_number) VALUES (6, '105', '22-JAN-16', 'BF105');
INSERT INTO fares.fare (id, fare, flight_date, flight_number) VALUES (7, '106', '22-JAN-16', 'BF106');

--truncate table search.fares cascade;
INSERT INTO search.fares (id, currency, fare) VALUES (1, 'USD', '100');
INSERT INTO search.fares (id, currency, fare) VALUES (2, 'USD', '101');
INSERT INTO search.fares (id, currency, fare) VALUES (3, 'USD', '105');
INSERT INTO search.fares (id, currency, fare) VALUES (4, 'USD', '106');
INSERT INTO search.fares (id, currency, fare) VALUES (5, 'USD', '102');
INSERT INTO search.fares (id, currency, fare) VALUES (6, 'USD', '103');
INSERT INTO search.fares (id, currency, fare) VALUES (7, 'USD', '104');

--truncate table search.inventory cascade;
INSERT INTO search.inventory (id, count) VALUES (1, 100);
INSERT INTO search.inventory (id, count) VALUES (2, 100);
INSERT INTO search.inventory (id, count) VALUES (3, 100);
INSERT INTO search.inventory (id, count) VALUES (4, 100);
INSERT INTO search.inventory (id, count) VALUES (5, 100);
INSERT INTO search.inventory (id, count) VALUES (6, 100);
INSERT INTO search.inventory (id, count) VALUES (7, 100);

--truncate table search.flight cascade;
INSERT INTO search.flight (id, destination, flight_date, flight_number, origin, fare_id, inv_id) VALUES (1, 'SFO', '22-JAN-16', 'BF100', 'SEA', 1, 1);
INSERT INTO search.flight (id, destination, flight_date, flight_number, origin, fare_id, inv_id) VALUES (2, 'SFO', '22-JAN-16', 'BF101', 'NYC', 2, 2);
INSERT INTO search.flight (id, destination, flight_date, flight_number, origin, fare_id, inv_id) VALUES (3, 'SFO', '22-JAN-16', 'BF105', 'NYC', 3, 3);
INSERT INTO search.flight (id, destination, flight_date, flight_number, origin, fare_id, inv_id) VALUES (4, 'SFO', '22-JAN-16', 'BF106', 'NYC', 4, 4);
INSERT INTO search.flight (id, destination, flight_date, flight_number, origin, fare_id, inv_id) VALUES (5, 'SFO', '22-JAN-16', 'BF102', 'CHI', 5, 5);
INSERT INTO search.flight (id, destination, flight_date, flight_number, origin, fare_id, inv_id) VALUES (6, 'SFO', '22-JAN-16', 'BF103', 'HOU', 6, 6);
INSERT INTO search.flight (id, destination, flight_date, flight_number, origin, fare_id, inv_id) VALUES (7, 'SFO', '22-JAN-16', 'BF104', 'LAX', 7, 7);

