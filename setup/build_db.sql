create database reservation_system with owner = 'postgres';
\connect reservation_system;

--
-- PostgreSQL database dump
--

-- Dumped from database version 9.5.3
-- Dumped by pg_dump version 9.5.3

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

SET search_path = search, pg_catalog;

ALTER TABLE IF EXISTS ONLY search.flight DROP CONSTRAINT IF EXISTS fk_mqdku2ku3913h6iq0t28a0fw6;
ALTER TABLE IF EXISTS ONLY search.flight DROP CONSTRAINT IF EXISTS fk_glgeh9rbe4g7h88e7oymuvpo4;
SET search_path = book, pg_catalog;

ALTER TABLE IF EXISTS ONLY book.passenger DROP CONSTRAINT IF EXISTS fk_gikudjkl76maaif7e10kgkybi;
SET search_path = search, pg_catalog;

ALTER TABLE IF EXISTS ONLY search.inventory DROP CONSTRAINT IF EXISTS inventory_pkey;
ALTER TABLE IF EXISTS ONLY search.flight DROP CONSTRAINT IF EXISTS flight_pkey;
ALTER TABLE IF EXISTS ONLY search.fares DROP CONSTRAINT IF EXISTS fares_pkey;
SET search_path = fares, pg_catalog;

ALTER TABLE IF EXISTS ONLY fares.fare DROP CONSTRAINT IF EXISTS fare_pkey;
SET search_path = checkin, pg_catalog;

ALTER TABLE IF EXISTS ONLY checkin.check_in_record DROP CONSTRAINT IF EXISTS check_in_record_pkey;
SET search_path = book, pg_catalog;

ALTER TABLE IF EXISTS ONLY book.passenger DROP CONSTRAINT IF EXISTS passenger_pkey;
ALTER TABLE IF EXISTS ONLY book.inventory DROP CONSTRAINT IF EXISTS inventory_pkey;
ALTER TABLE IF EXISTS ONLY book.booking_record DROP CONSTRAINT IF EXISTS booking_record_pkey;
SET search_path = search, pg_catalog;

SET search_path = public, pg_catalog;

SET search_path = fares, pg_catalog;

SET search_path = checkin, pg_catalog;

SET search_path = book, pg_catalog;

SET search_path = search, pg_catalog;

DROP TABLE IF EXISTS search.inventory;
DROP SEQUENCE IF EXISTS search.hibernate_sequence;
DROP TABLE IF EXISTS search.flight;
DROP TABLE IF EXISTS search.fares;
SET search_path = public, pg_catalog;

DROP SEQUENCE IF EXISTS public.hibernate_sequence;
SET search_path = fares, pg_catalog;

DROP SEQUENCE IF EXISTS fares.hibernate_sequence;
DROP TABLE IF EXISTS fares.fare;
SET search_path = checkin, pg_catalog;

DROP SEQUENCE IF EXISTS checkin.hibernate_sequence;
DROP TABLE IF EXISTS checkin.check_in_record;
SET search_path = book, pg_catalog;

DROP TABLE IF EXISTS book.passenger;
DROP TABLE IF EXISTS book.inventory;
DROP SEQUENCE IF EXISTS book.hibernate_sequence;
DROP TABLE IF EXISTS book.booking_record;
DROP SCHEMA IF EXISTS search;
DROP SCHEMA IF EXISTS public;
DROP SCHEMA IF EXISTS fares;
DROP SCHEMA IF EXISTS checkin;
DROP SCHEMA IF EXISTS book;
--
-- Name: book; Type: SCHEMA; Schema: -; Owner: postgres
--

CREATE SCHEMA book;


ALTER SCHEMA book OWNER TO "postgres";

--
-- Name: checkin; Type: SCHEMA; Schema: -; Owner: postgres
--

CREATE SCHEMA checkin;


ALTER SCHEMA checkin OWNER TO "postgres";

--
-- Name: fares; Type: SCHEMA; Schema: -; Owner: postgres
--

CREATE SCHEMA fares;


ALTER SCHEMA fares OWNER TO "postgres";

--
-- Name: public; Type: SCHEMA; Schema: -; Owner: postgres
--

CREATE SCHEMA public;


ALTER SCHEMA public OWNER TO postgres;

--
-- Name: SCHEMA public; Type: COMMENT; Schema: -; Owner: postgres
--

COMMENT ON SCHEMA public IS 'standard public schema';


--
-- Name: search; Type: SCHEMA; Schema: -; Owner: postgres
--

CREATE SCHEMA search;


ALTER SCHEMA search OWNER TO "postgres";

SET search_path = book, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: booking_record; Type: TABLE; Schema: book; Owner: postgres
--

CREATE TABLE booking_record (
    id bigint NOT NULL,
    booking_date timestamp without time zone,
    destination character varying(255),
    fare character varying(255),
    flight_date character varying(255),
    flight_number character varying(255),
    origin character varying(255),
    status character varying(255)
);


ALTER TABLE booking_record OWNER TO postgres;

--
-- Name: hibernate_sequence; Type: SEQUENCE; Schema: book; Owner: postgres
--

CREATE SEQUENCE hibernate_sequence
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE hibernate_sequence OWNER TO postgres;

--
-- Name: inventory; Type: TABLE; Schema: book; Owner: postgres
--

CREATE TABLE inventory (
    id bigint NOT NULL,
    available integer NOT NULL,
    flight_date character varying(255),
    flight_number character varying(255)
);


ALTER TABLE inventory OWNER TO postgres;

--
-- Name: passenger; Type: TABLE; Schema: book; Owner: postgres
--

CREATE TABLE passenger (
    id bigint NOT NULL,
    first_name character varying(255),
    gender character varying(255),
    last_name character varying(255),
    booking_id bigint
);


ALTER TABLE passenger OWNER TO postgres;

SET search_path = checkin, pg_catalog;

--
-- Name: check_in_record; Type: TABLE; Schema: checkin; Owner: postgres
--

CREATE TABLE check_in_record (
    id bigint NOT NULL,
    booking_id bigint NOT NULL,
    check_in_time timestamp without time zone,
    first_name character varying(255),
    flight_date character varying(255),
    flight_number character varying(255),
    last_name character varying(255),
    seat_number character varying(255)
);


ALTER TABLE check_in_record OWNER TO postgres;

--
-- Name: hibernate_sequence; Type: SEQUENCE; Schema: checkin; Owner: postgres
--

CREATE SEQUENCE hibernate_sequence
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE hibernate_sequence OWNER TO postgres;

SET search_path = fares, pg_catalog;

--
-- Name: fare; Type: TABLE; Schema: fares; Owner: postgres
--

CREATE TABLE fare (
    id bigint NOT NULL,
    fare character varying(255),
    flight_date character varying(255),
    flight_number character varying(255)
);


ALTER TABLE fare OWNER TO postgres;

--
-- Name: hibernate_sequence; Type: SEQUENCE; Schema: fares; Owner: postgres
--

CREATE SEQUENCE hibernate_sequence
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE hibernate_sequence OWNER TO postgres;

SET search_path = public, pg_catalog;

--
-- Name: hibernate_sequence; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE hibernate_sequence
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE hibernate_sequence OWNER TO "postgres";

SET search_path = search, pg_catalog;

--
-- Name: fares; Type: TABLE; Schema: search; Owner: postgres
--

CREATE TABLE fares (
    id bigint NOT NULL,
    currency character varying(255),
    fare character varying(255)
);


ALTER TABLE fares OWNER TO postgres;

--
-- Name: flight; Type: TABLE; Schema: search; Owner: postgres
--

CREATE TABLE flight (
    id bigint NOT NULL,
    destination character varying(255),
    flight_date character varying(255),
    flight_number character varying(255),
    origin character varying(255),
    fare_id bigint,
    inv_id bigint
);


ALTER TABLE flight OWNER TO postgres;

--
-- Name: hibernate_sequence; Type: SEQUENCE; Schema: search; Owner: postgres
--

CREATE SEQUENCE hibernate_sequence
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE hibernate_sequence OWNER TO postgres;

--
-- Name: inventory; Type: TABLE; Schema: search; Owner: postgres
--

CREATE TABLE inventory (
    id bigint NOT NULL,
    count integer NOT NULL
);


ALTER TABLE inventory OWNER TO postgres;

SET search_path = book, pg_catalog;

--
-- Data for Name: booking_record; Type: TABLE DATA; Schema: book; Owner: postgres
--

INSERT INTO book.booking_record (id, booking_date, destination, fare, flight_date, flight_number, origin, status) VALUES (1, '2017-11-09 13:00:19.035', 'SFO', '101', '22-JAN-16', 'BF101', 'NYC', 'BOOKING_CONFIRMED');
INSERT INTO book.booking_record (id, booking_date, destination, fare, flight_date, flight_number, origin, status) VALUES (2, '2017-11-09 13:02:13.328', 'SFO', '101', '22-JAN-16', 'BF101', 'NYC', 'BOOKING_CONFIRMED');


--
-- Name: hibernate_sequence; Type: SEQUENCE SET; Schema: book; Owner: postgres
--

SELECT pg_catalog.setval('hibernate_sequence', 11, true);


--
-- Data for Name: inventory; Type: TABLE DATA; Schema: book; Owner: postgres
--

INSERT INTO book.inventory (id, available, flight_date, flight_number) VALUES (1, 100, '22-JAN-16', 'BF100');
INSERT INTO book.inventory (id, available, flight_date, flight_number) VALUES (2, 98, '22-JAN-16', 'BF101');
INSERT INTO book.inventory (id, available, flight_date, flight_number) VALUES (3, 100, '22-JAN-16', 'BF102');
INSERT INTO book.inventory (id, available, flight_date, flight_number) VALUES (4, 100, '22-JAN-16', 'BF103');
INSERT INTO book.inventory (id, available, flight_date, flight_number) VALUES (5, 100, '22-JAN-16', 'BF104');
INSERT INTO book.inventory (id, available, flight_date, flight_number) VALUES (6, 100, '22-JAN-16', 'BF105');
INSERT INTO book.inventory (id, available, flight_date, flight_number) VALUES (7, 100, '22-JAN-16', 'BF106');



--
-- Data for Name: passenger; Type: TABLE DATA; Schema: book; Owner: postgres
--

INSERT INTO book.passenger (id, first_name, gender, last_name, booking_id) VALUES (1, 'Gean', 'Male', 'Franc', 1);
INSERT INTO book.passenger (id, first_name, gender, last_name, booking_id) VALUES (2, 'Gavin', 'Male', 'Franc', 2);


SET search_path = checkin, pg_catalog;

--
-- Data for Name: check_in_record; Type: TABLE DATA; Schema: checkin; Owner: postgres
--

INSERT INTO checkin.check_in_record (id, booking_id, check_in_time, first_name, flight_date, flight_number, last_name, seat_number) VALUES (1, 1, '2017-11-09 12:57:12.381', 'Gean', '22-JAN-16', 'BF101', 'Franc', '28A');
INSERT INTO checkin.check_in_record (id, booking_id, check_in_time, first_name, flight_date, flight_number, last_name, seat_number) VALUES (2, 2, '2017-11-09 13:02:14.819', 'Gavin', '22-JAN-16', 'BF101', 'Franc', '28C');


--
-- Name: hibernate_sequence; Type: SEQUENCE SET; Schema: checkin; Owner: postgres
--

SELECT pg_catalog.setval('hibernate_sequence', 2, true);


SET search_path = fares, pg_catalog;

--
-- Data for Name: fare; Type: TABLE DATA; Schema: fares; Owner: postgres
--

INSERT INTO fares.fare (id, fare, flight_date, flight_number) VALUES (1, '101', '22-JAN-16', 'BF100');
INSERT INTO fares.fare (id, fare, flight_date, flight_number) VALUES (2, '101', '22-JAN-16', 'BF101');
INSERT INTO fares.fare (id, fare, flight_date, flight_number) VALUES (3, '102', '22-JAN-16', 'BF102');
INSERT INTO fares.fare (id, fare, flight_date, flight_number) VALUES (4, '103', '22-JAN-16', 'BF103');
INSERT INTO fares.fare (id, fare, flight_date, flight_number) VALUES (5, '104', '22-JAN-16', 'BF104');
INSERT INTO fares.fare (id, fare, flight_date, flight_number) VALUES (6, '105', '22-JAN-16', 'BF105');
INSERT INTO fares.fare (id, fare, flight_date, flight_number) VALUES (7, '106', '22-JAN-16', 'BF106');


--
-- Name: hibernate_sequence; Type: SEQUENCE SET; Schema: fares; Owner: postgres
--

SELECT pg_catalog.setval('hibernate_sequence', 7, true);


SET search_path = public, pg_catalog;

--
-- Name: hibernate_sequence; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('hibernate_sequence', 7, true);


SET search_path = search, pg_catalog;

--
-- Data for Name: fares; Type: TABLE DATA; Schema: search; Owner: postgres
--

INSERT INTO search.fares (id, currency, fare) VALUES (1, 'USD', '100');
INSERT INTO search.fares (id, currency, fare) VALUES (2, 'USD', '101');
INSERT INTO search.fares (id, currency, fare) VALUES (3, 'USD', '105');
INSERT INTO search.fares (id, currency, fare) VALUES (4, 'USD', '106');
INSERT INTO search.fares (id, currency, fare) VALUES (5, 'USD', '102');
INSERT INTO search.fares (id, currency, fare) VALUES (6, 'USD', '103');
INSERT INTO search.fares (id, currency, fare) VALUES (7, 'USD', '104');


--
-- Data for Name: flight; Type: TABLE DATA; Schema: search; Owner: postgres
--

INSERT INTO search.flight (id, destination, flight_date, flight_number, origin, fare_id, inv_id) VALUES (1, 'SFO', '22-JAN-16', 'BF100', 'SEA', 1, 1);
INSERT INTO search.flight (id, destination, flight_date, flight_number, origin, fare_id, inv_id) VALUES (2, 'SFO', '22-JAN-16', 'BF101', 'NYC', 2, 2);
INSERT INTO search.flight (id, destination, flight_date, flight_number, origin, fare_id, inv_id) VALUES (3, 'SFO', '22-JAN-16', 'BF105', 'NYC', 3, 3);
INSERT INTO search.flight (id, destination, flight_date, flight_number, origin, fare_id, inv_id) VALUES (4, 'SFO', '22-JAN-16', 'BF106', 'NYC', 4, 4);
INSERT INTO search.flight (id, destination, flight_date, flight_number, origin, fare_id, inv_id) VALUES (5, 'SFO', '22-JAN-16', 'BF102', 'CHI', 5, 5);
INSERT INTO search.flight (id, destination, flight_date, flight_number, origin, fare_id, inv_id) VALUES (6, 'SFO', '22-JAN-16', 'BF103', 'HOU', 6, 6);
INSERT INTO search.flight (id, destination, flight_date, flight_number, origin, fare_id, inv_id) VALUES (7, 'SFO', '22-JAN-16', 'BF104', 'LAX', 7, 7);


--
-- Name: hibernate_sequence; Type: SEQUENCE SET; Schema: search; Owner: postgres
--

SELECT pg_catalog.setval('hibernate_sequence', 21, true);


--
-- Data for Name: inventory; Type: TABLE DATA; Schema: search; Owner: postgres
--

INSERT INTO search.inventory (id, count) VALUES (1, 100);
INSERT INTO search.inventory (id, count) VALUES (2, 100);
INSERT INTO search.inventory (id, count) VALUES (3, 100);
INSERT INTO search.inventory (id, count) VALUES (4, 100);
INSERT INTO search.inventory (id, count) VALUES (5, 100);
INSERT INTO search.inventory (id, count) VALUES (6, 100);
INSERT INTO search.inventory (id, count) VALUES (7, 100);


SET search_path = book, pg_catalog;

--
-- Name: booking_record_pkey; Type: CONSTRAINT; Schema: book; Owner: postgres
--

ALTER TABLE ONLY booking_record
    ADD CONSTRAINT booking_record_pkey PRIMARY KEY (id);


--
-- Name: inventory_pkey; Type: CONSTRAINT; Schema: book; Owner: postgres
--

ALTER TABLE ONLY inventory
    ADD CONSTRAINT inventory_pkey PRIMARY KEY (id);


--
-- Name: passenger_pkey; Type: CONSTRAINT; Schema: book; Owner: postgres
--

ALTER TABLE ONLY passenger
    ADD CONSTRAINT passenger_pkey PRIMARY KEY (id);


SET search_path = checkin, pg_catalog;

--
-- Name: check_in_record_pkey; Type: CONSTRAINT; Schema: checkin; Owner: postgres
--

ALTER TABLE ONLY check_in_record
    ADD CONSTRAINT check_in_record_pkey PRIMARY KEY (id);


SET search_path = fares, pg_catalog;

--
-- Name: fare_pkey; Type: CONSTRAINT; Schema: fares; Owner: postgres
--

ALTER TABLE ONLY fare
    ADD CONSTRAINT fare_pkey PRIMARY KEY (id);


SET search_path = search, pg_catalog;

--
-- Name: fares_pkey; Type: CONSTRAINT; Schema: search; Owner: postgres
--

ALTER TABLE ONLY fares
    ADD CONSTRAINT fares_pkey PRIMARY KEY (id);


--
-- Name: flight_pkey; Type: CONSTRAINT; Schema: search; Owner: postgres
--

ALTER TABLE ONLY flight
    ADD CONSTRAINT flight_pkey PRIMARY KEY (id);


--
-- Name: inventory_pkey; Type: CONSTRAINT; Schema: search; Owner: postgres
--

ALTER TABLE ONLY inventory
    ADD CONSTRAINT inventory_pkey PRIMARY KEY (id);


SET search_path = book, pg_catalog;

--
-- Name: fk_gikudjkl76maaif7e10kgkybi; Type: FK CONSTRAINT; Schema: book; Owner: postgres
--

ALTER TABLE ONLY passenger
    ADD CONSTRAINT fk_gikudjkl76maaif7e10kgkybi FOREIGN KEY (booking_id) REFERENCES booking_record(id);


SET search_path = search, pg_catalog;

--
-- Name: fk_glgeh9rbe4g7h88e7oymuvpo4; Type: FK CONSTRAINT; Schema: search; Owner: postgres
--

ALTER TABLE ONLY flight
    ADD CONSTRAINT fk_glgeh9rbe4g7h88e7oymuvpo4 FOREIGN KEY (inv_id) REFERENCES inventory(id);


--
-- Name: fk_mqdku2ku3913h6iq0t28a0fw6; Type: FK CONSTRAINT; Schema: search; Owner: postgres
--

ALTER TABLE ONLY flight
    ADD CONSTRAINT fk_mqdku2ku3913h6iq0t28a0fw6 FOREIGN KEY (fare_id) REFERENCES fares(id);


--
-- Name: public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;


--
-- PostgreSQL database dump complete
--

