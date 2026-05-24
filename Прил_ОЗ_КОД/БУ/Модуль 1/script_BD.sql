--
-- PostgreSQL database dump
--

-- Dumped from database version 17.10
-- Dumped by pg_dump version 17.10

-- Started on 2026-05-24 10:12:38

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- TOC entry 224 (class 1259 OID 24798)
-- Name: acrticules; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.acrticules (
    id integer NOT NULL,
    article character varying
);


ALTER TABLE public.acrticules OWNER TO postgres;

--
-- TOC entry 228 (class 1259 OID 24859)
-- Name: order; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."order" (
    id integer NOT NULL,
    order_date date,
    delivery_date date,
    pickup_point_id integer,
    user_id integer,
    code integer,
    status_id integer
);


ALTER TABLE public."order" OWNER TO postgres;

--
-- TOC entry 226 (class 1259 OID 24842)
-- Name: order_content; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.order_content (
    id integer NOT NULL,
    order_id integer,
    article_id integer,
    quantity integer
);


ALTER TABLE public.order_content OWNER TO postgres;

--
-- TOC entry 227 (class 1259 OID 24852)
-- Name: order_status; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.order_status (
    id integer NOT NULL,
    status character varying
);


ALTER TABLE public.order_status OWNER TO postgres;

--
-- TOC entry 219 (class 1259 OID 24736)
-- Name: pickup_points; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.pickup_points (
    id integer NOT NULL,
    postcode integer NOT NULL,
    city character varying,
    street character varying,
    building integer
);


ALTER TABLE public.pickup_points OWNER TO postgres;

--
-- TOC entry 221 (class 1259 OID 24750)
-- Name: producers; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.producers (
    id integer NOT NULL,
    name character varying NOT NULL
);


ALTER TABLE public.producers OWNER TO postgres;

--
-- TOC entry 225 (class 1259 OID 24810)
-- Name: product; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.product (
    id integer NOT NULL,
    article_id integer,
    name text,
    unit_id integer,
    price integer,
    provider_id integer,
    producer_id integer,
    product_type_id integer,
    discount integer,
    quantity integer,
    description text,
    img character varying
);


ALTER TABLE public.product OWNER TO postgres;

--
-- TOC entry 222 (class 1259 OID 24757)
-- Name: product_type; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.product_type (
    id integer NOT NULL,
    name character varying
);


ALTER TABLE public.product_type OWNER TO postgres;

--
-- TOC entry 220 (class 1259 OID 24743)
-- Name: providers; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.providers (
    id integer NOT NULL,
    name character varying NOT NULL
);


ALTER TABLE public.providers OWNER TO postgres;

--
-- TOC entry 217 (class 1259 OID 24717)
-- Name: roles; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.roles (
    id integer NOT NULL,
    name character varying NOT NULL
);


ALTER TABLE public.roles OWNER TO postgres;

--
-- TOC entry 223 (class 1259 OID 24764)
-- Name: units; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.units (
    id integer NOT NULL,
    unit character varying
);


ALTER TABLE public.units OWNER TO postgres;

--
-- TOC entry 218 (class 1259 OID 24724)
-- Name: users; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.users (
    id integer NOT NULL,
    role_id integer NOT NULL,
    full_name text,
    email character varying NOT NULL,
    password character varying NOT NULL
);


ALTER TABLE public.users OWNER TO postgres;

--
-- TOC entry 4871 (class 0 OID 24798)
-- Dependencies: 224
-- Data for Name: acrticules; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.acrticules VALUES (1, 'E001Т1');
INSERT INTO public.acrticules VALUES (2, 'E002Т2');
INSERT INTO public.acrticules VALUES (3, 'E003Т3');
INSERT INTO public.acrticules VALUES (4, 'E004Т4');
INSERT INTO public.acrticules VALUES (5, 'E005Т5');
INSERT INTO public.acrticules VALUES (6, 'E006Т1');
INSERT INTO public.acrticules VALUES (7, 'E007Т2');
INSERT INTO public.acrticules VALUES (8, 'E008Т3');
INSERT INTO public.acrticules VALUES (9, 'E009Т4');
INSERT INTO public.acrticules VALUES (10, 'E010Т5');
INSERT INTO public.acrticules VALUES (11, 'E011Т1');
INSERT INTO public.acrticules VALUES (12, 'E012Т2');
INSERT INTO public.acrticules VALUES (13, 'E013Т3');
INSERT INTO public.acrticules VALUES (14, 'E014Т4');
INSERT INTO public.acrticules VALUES (15, 'E015Т5');
INSERT INTO public.acrticules VALUES (16, 'E016Т1');
INSERT INTO public.acrticules VALUES (17, 'E017Т2');
INSERT INTO public.acrticules VALUES (18, 'E018Т3');
INSERT INTO public.acrticules VALUES (19, 'E019Т4');
INSERT INTO public.acrticules VALUES (20, 'E020Т5');
INSERT INTO public.acrticules VALUES (21, 'E021Т1');
INSERT INTO public.acrticules VALUES (22, 'E022Т2');
INSERT INTO public.acrticules VALUES (23, 'E023Т3');
INSERT INTO public.acrticules VALUES (24, 'E024Т4');
INSERT INTO public.acrticules VALUES (25, 'E025Т5');
INSERT INTO public.acrticules VALUES (26, 'E026Т1');
INSERT INTO public.acrticules VALUES (27, 'E027Т2');
INSERT INTO public.acrticules VALUES (28, 'E028Т3');
INSERT INTO public.acrticules VALUES (29, 'E029Т4');
INSERT INTO public.acrticules VALUES (30, 'E030Т5');


--
-- TOC entry 4875 (class 0 OID 24859)
-- Dependencies: 228
-- Data for Name: order; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public."order" VALUES (1, '2025-02-27', '2025-04-20', 1, 4, 901, 2);
INSERT INTO public."order" VALUES (2, '2022-09-28', '2025-04-21', 11, 1, 902, 2);
INSERT INTO public."order" VALUES (3, '2025-03-21', '2025-04-22', 2, 2, 903, 2);
INSERT INTO public."order" VALUES (4, '2025-02-20', '2025-04-23', 11, 3, 904, 2);
INSERT INTO public."order" VALUES (5, '2025-03-17', '2025-04-24', 2, 4, 905, 2);
INSERT INTO public."order" VALUES (6, '2025-03-01', '2025-04-25', 15, 1, 906, 2);
INSERT INTO public."order" VALUES (7, '2025-02-28', '2025-04-26', 3, 2, 907, 2);
INSERT INTO public."order" VALUES (8, '2025-03-31', '2025-04-27', 19, 3, 908, 1);
INSERT INTO public."order" VALUES (9, '2025-04-02', '2025-04-28', 5, 4, 909, 1);
INSERT INTO public."order" VALUES (10, '2025-04-03', '2025-04-29', 19, 4, 910, 1);


--
-- TOC entry 4873 (class 0 OID 24842)
-- Dependencies: 226
-- Data for Name: order_content; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.order_content VALUES (1, 1, 1, 2);
INSERT INTO public.order_content VALUES (2, 2, 3, 1);
INSERT INTO public.order_content VALUES (3, 3, 4, 10);
INSERT INTO public.order_content VALUES (4, 4, 7, 5);
INSERT INTO public.order_content VALUES (5, 5, 1, 2);
INSERT INTO public.order_content VALUES (6, 6, 3, 1);
INSERT INTO public.order_content VALUES (7, 7, 5, 10);
INSERT INTO public.order_content VALUES (8, 8, 7, 5);
INSERT INTO public.order_content VALUES (9, 9, 9, 5);
INSERT INTO public.order_content VALUES (10, 10, 11, 5);
INSERT INTO public.order_content VALUES (11, 1, 2, 2);
INSERT INTO public.order_content VALUES (12, 2, 4, 1);
INSERT INTO public.order_content VALUES (13, 3, 6, 10);
INSERT INTO public.order_content VALUES (14, 4, 8, 4);
INSERT INTO public.order_content VALUES (15, 5, 2, 2);
INSERT INTO public.order_content VALUES (16, 6, 4, 1);
INSERT INTO public.order_content VALUES (17, 7, 6, 10);
INSERT INTO public.order_content VALUES (18, 8, 8, 4);
INSERT INTO public.order_content VALUES (19, 9, 10, 1);
INSERT INTO public.order_content VALUES (20, 10, 12, 5);


--
-- TOC entry 4874 (class 0 OID 24852)
-- Dependencies: 227
-- Data for Name: order_status; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.order_status VALUES (1, 'Новый');
INSERT INTO public.order_status VALUES (2, 'Завершён');


--
-- TOC entry 4866 (class 0 OID 24736)
-- Dependencies: 219
-- Data for Name: pickup_points; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.pickup_points VALUES (1, 420151, 'Краснодар', 'Вишневая', 32);
INSERT INTO public.pickup_points VALUES (2, 125061, 'Краснодар', 'Подгорная', 8);
INSERT INTO public.pickup_points VALUES (3, 630370, 'Краснодар', 'Шоссейная', 24);
INSERT INTO public.pickup_points VALUES (4, 400562, 'Краснодар', 'Зеленая', 32);
INSERT INTO public.pickup_points VALUES (5, 614510, 'Краснодар', 'Маяковского', 47);
INSERT INTO public.pickup_points VALUES (6, 410542, 'Краснодар', 'Светлая', 46);
INSERT INTO public.pickup_points VALUES (7, 620839, 'Краснодар', 'Цветочная', 8);
INSERT INTO public.pickup_points VALUES (8, 443890, 'Краснодар', 'Коммунистическая', 1);
INSERT INTO public.pickup_points VALUES (9, 603379, 'Краснодар', 'Спортивная', 46);
INSERT INTO public.pickup_points VALUES (10, 603721, 'Краснодар', 'Гоголя', 41);
INSERT INTO public.pickup_points VALUES (11, 410172, 'Краснодар', 'Северная', 13);
INSERT INTO public.pickup_points VALUES (12, 614611, 'Краснодар', 'Молодежная', 50);
INSERT INTO public.pickup_points VALUES (13, 454311, 'Краснодар', 'Новая', 19);
INSERT INTO public.pickup_points VALUES (14, 660007, 'Краснодар', 'Октябрьская', 19);
INSERT INTO public.pickup_points VALUES (15, 603036, 'Краснодар', 'Садовая', 4);
INSERT INTO public.pickup_points VALUES (16, 394060, 'Краснодар', 'Фрунзе', 43);
INSERT INTO public.pickup_points VALUES (17, 410661, 'Краснодар', 'Школьная', 50);
INSERT INTO public.pickup_points VALUES (18, 625590, 'Краснодар', 'Коммунистическая', 20);
INSERT INTO public.pickup_points VALUES (19, 625683, 'Краснодар', '8 Марта', NULL);
INSERT INTO public.pickup_points VALUES (20, 450983, 'Краснодар', 'Комсомольская', 26);
INSERT INTO public.pickup_points VALUES (21, 394782, 'Краснодар', 'Чехова', 3);
INSERT INTO public.pickup_points VALUES (22, 603002, 'Краснодар', 'Дзержинского', 28);
INSERT INTO public.pickup_points VALUES (23, 450558, 'Краснодар', 'Набережная', 30);
INSERT INTO public.pickup_points VALUES (24, 344288, 'Краснодар', 'Чехова', 1);
INSERT INTO public.pickup_points VALUES (25, 614164, 'Краснодар', 'Степная', 30);
INSERT INTO public.pickup_points VALUES (26, 394242, 'Краснодар', 'Коммунистическая', 43);
INSERT INTO public.pickup_points VALUES (27, 660540, 'Краснодар', 'Солнечная', 25);
INSERT INTO public.pickup_points VALUES (28, 125837, 'Краснодар', 'Шоссейная', 40);
INSERT INTO public.pickup_points VALUES (29, 125703, 'Краснодар', 'Партизанская', 49);
INSERT INTO public.pickup_points VALUES (30, 625283, 'Краснодар', 'Победы', 46);
INSERT INTO public.pickup_points VALUES (31, 614753, 'Краснодар', 'Полевая', 35);
INSERT INTO public.pickup_points VALUES (32, 426030, 'Краснодар', 'Маяковского', 44);
INSERT INTO public.pickup_points VALUES (33, 450375, 'Краснодар', 'Клубная', 44);
INSERT INTO public.pickup_points VALUES (34, 625560, 'Краснодар', 'Некрасова', 12);
INSERT INTO public.pickup_points VALUES (35, 630201, 'Краснодар', 'Комсомольская', 17);
INSERT INTO public.pickup_points VALUES (36, 190949, 'Краснодар', 'Мичурина', 26);


--
-- TOC entry 4868 (class 0 OID 24750)
-- Dependencies: 221
-- Data for Name: producers; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.producers VALUES (1, 'Sony');
INSERT INTO public.producers VALUES (2, 'Kingston');
INSERT INTO public.producers VALUES (3, 'Logitech');
INSERT INTO public.producers VALUES (4, 'Acer');
INSERT INTO public.producers VALUES (5, 'Samsung');
INSERT INTO public.producers VALUES (6, 'Apex');
INSERT INTO public.producers VALUES (7, 'Baseus');
INSERT INTO public.producers VALUES (8, 'Greenconnect');
INSERT INTO public.producers VALUES (9, 'Сборщик');
INSERT INTO public.producers VALUES (10, 'TP-Link');
INSERT INTO public.producers VALUES (11, 'HP');
INSERT INTO public.producers VALUES (12, 'Ippon');
INSERT INTO public.producers VALUES (13, 'Braun');
INSERT INTO public.producers VALUES (14, 'Ugreen');
INSERT INTO public.producers VALUES (15, 'ORICO');
INSERT INTO public.producers VALUES (16, 'Seagate');
INSERT INTO public.producers VALUES (17, 'AOC');
INSERT INTO public.producers VALUES (18, 'Hoco');
INSERT INTO public.producers VALUES (19, 'WD');
INSERT INTO public.producers VALUES (20, 'Xiaomi');
INSERT INTO public.producers VALUES (21, 'Redragon');
INSERT INTO public.producers VALUES (22, 'Huawei');
INSERT INTO public.producers VALUES (23, 'Datalogic');
INSERT INTO public.producers VALUES (24, 'Ресанта');
INSERT INTO public.producers VALUES (25, 'AMD');
INSERT INTO public.producers VALUES (26, 'Gigabyte');


--
-- TOC entry 4872 (class 0 OID 24810)
-- Dependencies: 225
-- Data for Name: product; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.product VALUES (1, 1, 'Беспроводные наушники WH-CH720N', 1, 12990, 1, 1, 1, 18, 6, 'Bluetooth 5.2, ANC, до 35 ч, чёрные', '1.jpg');
INSERT INTO public.product VALUES (2, 2, 'SSD NV2 1 ТБ M.2', 1, 7890, 1, 2, 2, 5, 13, 'NVMe PCIe 4.0, чтение до 3500 МБ/с', '2.jpg');
INSERT INTO public.product VALUES (3, 3, 'Клавиатура K120 USB', 1, 1490, 2, 3, 3, 2, 5, 'Полноразмерная, тихие клавиши, устойчивое основание', '3.jpg');
INSERT INTO public.product VALUES (4, 4, 'Мышь M185 беспроводная', 1, 990, 1, 3, 3, 2, 8, '2,4 ГГц, нано-приёмник, срок батареи до 12 мес', '4.jpg');
INSERT INTO public.product VALUES (5, 5, 'Монитор 24 IPS 75 Гц', 1, 11500, 3, 4, 4, 3, 16, 'FHD, HDMI, VGA, антибликовое покрытие', '5.jpg');
INSERT INTO public.product VALUES (6, 6, 'Флеш-накопитель 64 ГБ USB3', 1, 750, 2, 5, 2, 3, 0, 'USB 3.2, металлический корпус', '6.jpg');
INSERT INTO public.product VALUES (7, 7, 'Веб-камера C270 HD', 1, 3200, 1, 3, 3, 2, 14, '720p, встроенный микрофон, совместимость с Zoom', '7.jpg');
INSERT INTO public.product VALUES (8, 8, 'Сетевой фильтр 6 розеток', 1, 890, 3, 6, 3, 4, 4, '3 м кабель, с заземлением, 16 А', '8.jpg');
INSERT INTO public.product VALUES (9, 9, 'Смартфон A05 4/64', 1, 9990, 4, 5, 5, 2, 0, '6,7 PLS, 50 Мп, 5000 мА·ч, серый', '9.jpg');
INSERT INTO public.product VALUES (10, 10, 'Планшет S6 Lite 64 ГБ', 1, 18990, 4, 5, 6, 3, 6, '10,4 2000x1200, S Pen, Wi?Fi, серый', '10.jpg');
INSERT INTO public.product VALUES (11, 11, 'Зарядное 65W USB-C GaN', 1, 2900, 1, 7, 7, 0, 15, 'PD 3.0, компактный блок, 2 порта', NULL);
INSERT INTO public.product VALUES (12, 12, 'Переходник HDMI–VGA', 1, 450, 2, 8, 8, 0, 14, '1080p, питание 3,5 мм опционально', NULL);
INSERT INTO public.product VALUES (13, 13, 'Системный блок (б/у) i5/16/512', 1, 35000, 3, 9, 9, 0, 0, 'i5-10400, 16 ГБ DDR4, SSD 512, Win11', NULL);
INSERT INTO public.product VALUES (14, 14, 'Маршрутизатор Wi-Fi 5', 1, 4200, 4, 10, 10, 3, 12, 'AC1200, 4 антенны, гигабитный LAN', NULL);
INSERT INTO public.product VALUES (15, 15, 'Принтер лазерный моно', 1, 14990, 1, 11, 11, 0, 18, 'A4, 20 стр/мин, Wi?Fi, сетевой', NULL);
INSERT INTO public.product VALUES (16, 16, 'ИБП 650 VA', 1, 5600, 3, 12, 3, 0, 9, '2 розетки Schuko, LED-индикация', NULL);
INSERT INTO public.product VALUES (17, 17, 'Сумка для ноутбука 15,6', 1, 1990, 2, 13, 7, 0, 0, 'отделение на молнии, водоотталкивающая ткань', NULL);
INSERT INTO public.product VALUES (18, 18, 'Кабель USB–Lightning 1м', 1, 790, 1, 14, 8, 2, 0, 'MFi-сертификат, оплётка нейлон, 2,4 А', NULL);
INSERT INTO public.product VALUES (19, 19, 'Bluetooth-адаптер USB 5.0', 1, 1290, 3, 15, 3, 0, 15, 'Plug-and-play, радиус до 20 м (условия)', NULL);
INSERT INTO public.product VALUES (20, 20, 'HDD 2 ТБ 3,5 SATA', 1, 6500, 4, 16, 2, 2, 11, 'для настольных 9, 256 МБ кэш, 7200 об/мин', NULL);
INSERT INTO public.product VALUES (21, 21, 'Монитор 27 QHD 100 Гц', 1, 22900, 1, 17, 4, 4, 9, 'QHD, IPS, 100 Гц, FreeSync, HDMI+DP', NULL);
INSERT INTO public.product VALUES (22, 22, 'Гарнитура проводная 3,5 мм', 1, 1690, 2, 18, 1, 3, 0, 'на одно ухо, гибкий микрофон, для call-центра', NULL);
INSERT INTO public.product VALUES (23, 23, 'SSD 500 ГБ SATA2.5', 1, 4990, 3, 19, 2, 0, 13, '3D NAND, 560/530 МБ/с, для апгрейда ноутбука', NULL);
INSERT INTO public.product VALUES (24, 24, 'Телевизор 43 4K Smart', 1, 28990, 4, 20, 12, 0, 5, '4K, Android TV, HDR10, 3xHDMI, Wi?Fi', NULL);
INSERT INTO public.product VALUES (25, 25, 'Игровая клавиатура RGB', 1, 4990, 1, 21, 3, 11, 15, 'мембрана, 104 кл., 8 подсветок, программируемые G-клавиши', NULL);
INSERT INTO public.product VALUES (26, 26, 'Смарт-часы GT 4 46мм', 1, 14990, 3, 22, 13, 12, 3, '1,43 AMOLED, 5 АТМ, пульс, GPS, чёрные', NULL);
INSERT INTO public.product VALUES (27, 27, 'Сканер штрихкода 2D ручной', 1, 11900, 4, 23, 11, 2, 12, 'USB, подставка, подсветка, для 1D/2D', NULL);
INSERT INTO public.product VALUES (28, 28, 'Стабилизатор напряжения 1 кВт', 1, 8500, 1, 24, 3, 0, 2, '7 ступеней, LED-вольтметр, 220 В ±10 %', NULL);
INSERT INTO public.product VALUES (29, 29, 'Процессор Ryzen 5 5600', 1, 12900, 2, 25, 14, 2, 0, 'AM4, 6/12, до 4,4 ГГц, без графики', NULL);
INSERT INTO public.product VALUES (30, 30, 'Видеокарта RTX 4060 8 ГБ', 1, 34990, 3, 26, 14, 0, 7, '2 вент., HDMI+3xDP, 115 Вт, OC-профиль', NULL);


--
-- TOC entry 4869 (class 0 OID 24757)
-- Dependencies: 222
-- Data for Name: product_type; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.product_type VALUES (1, 'Аудио');
INSERT INTO public.product_type VALUES (2, 'Накопители');
INSERT INTO public.product_type VALUES (3, 'Периферия');
INSERT INTO public.product_type VALUES (4, 'Мониторы');
INSERT INTO public.product_type VALUES (5, 'Смартфоны');
INSERT INTO public.product_type VALUES (6, 'Планшеты');
INSERT INTO public.product_type VALUES (7, 'Аксессуары');
INSERT INTO public.product_type VALUES (8, 'Кабели и адаптеры');
INSERT INTO public.product_type VALUES (9, 'ПК');
INSERT INTO public.product_type VALUES (10, 'Сети');
INSERT INTO public.product_type VALUES (11, 'Офисная техника');
INSERT INTO public.product_type VALUES (12, 'ТВ');
INSERT INTO public.product_type VALUES (13, 'Носимая электроника');
INSERT INTO public.product_type VALUES (14, 'Комплектующие');


--
-- TOC entry 4867 (class 0 OID 24743)
-- Dependencies: 220
-- Data for Name: providers; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.providers VALUES (1, 'ООО «ТехноСклад»');
INSERT INTO public.providers VALUES (2, 'ООО «ГаджетПлюс»');
INSERT INTO public.providers VALUES (3, 'ООО «IT-Опт»');
INSERT INTO public.providers VALUES (4, 'ООО «ДистриТех»');


--
-- TOC entry 4864 (class 0 OID 24717)
-- Dependencies: 217
-- Data for Name: roles; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.roles VALUES (1, 'Администратор');
INSERT INTO public.roles VALUES (2, 'Менеджер');
INSERT INTO public.roles VALUES (3, 'Авторизованный клиент');


--
-- TOC entry 4870 (class 0 OID 24764)
-- Dependencies: 223
-- Data for Name: units; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.units VALUES (1, 'шт.');


--
-- TOC entry 4865 (class 0 OID 24724)
-- Dependencies: 218
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.users VALUES (1, 3, 'Никифорова Весения Николаевна', '94d5ous@gmail.com', 'uzWC67');
INSERT INTO public.users VALUES (2, 3, 'Сазонов Руслан Германович', 'uth4iz@mail.com', '2L6KZG');
INSERT INTO public.users VALUES (3, 3, 'Одинцов Серафим Артёмович', 'yzls62@outlook.com', 'JlFRCZ');
INSERT INTO public.users VALUES (4, 2, 'Степанов Михаил Артёмович', '1diph5e@tutanota.com', '8ntwUp');
INSERT INTO public.users VALUES (5, 2, 'Ворсин Петр Евгеньевич', 'tjde7c@yahoo.com', 'YOyhfR');
INSERT INTO public.users VALUES (6, 2, 'Старикова Елена Павловна', 'wpmrc3do@tutanota.com', 'RSbvHv');
INSERT INTO public.users VALUES (7, 1, 'Михайлюк Анна Вячеславовна', '5d4zbu@tutanota.com', 'rwVDh9');
INSERT INTO public.users VALUES (8, 1, 'Ситдикова Елена Анатольевна', 'ptec8ym@yahoo.com', 'LdNyos');
INSERT INTO public.users VALUES (9, 1, 'Ворсин Петр Евгеньевич', '1qz4kw@mail.com', 'gynQMT');
INSERT INTO public.users VALUES (10, 1, 'Старикова Елена Павловна', '4np6se@mail.com', 'AtnDjr');


--
-- TOC entry 4699 (class 2606 OID 24804)
-- Name: acrticules acrticules_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.acrticules
    ADD CONSTRAINT acrticules_pkey PRIMARY KEY (id);


--
-- TOC entry 4703 (class 2606 OID 24846)
-- Name: order_content order_content_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.order_content
    ADD CONSTRAINT order_content_pkey PRIMARY KEY (id);


--
-- TOC entry 4707 (class 2606 OID 24863)
-- Name: order order_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."order"
    ADD CONSTRAINT order_pkey PRIMARY KEY (id);


--
-- TOC entry 4705 (class 2606 OID 24858)
-- Name: order_status order_status_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.order_status
    ADD CONSTRAINT order_status_pkey PRIMARY KEY (id);


--
-- TOC entry 4689 (class 2606 OID 24742)
-- Name: pickup_points pickup_points_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pickup_points
    ADD CONSTRAINT pickup_points_pkey PRIMARY KEY (id);


--
-- TOC entry 4693 (class 2606 OID 24756)
-- Name: producers producers_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.producers
    ADD CONSTRAINT producers_pkey PRIMARY KEY (id);


--
-- TOC entry 4701 (class 2606 OID 24816)
-- Name: product product_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product
    ADD CONSTRAINT product_pkey PRIMARY KEY (id);


--
-- TOC entry 4695 (class 2606 OID 24763)
-- Name: product_type product_type_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product_type
    ADD CONSTRAINT product_type_pkey PRIMARY KEY (id);


--
-- TOC entry 4691 (class 2606 OID 24749)
-- Name: providers providers_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.providers
    ADD CONSTRAINT providers_pkey PRIMARY KEY (id);


--
-- TOC entry 4685 (class 2606 OID 24723)
-- Name: roles roles_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.roles
    ADD CONSTRAINT roles_pkey PRIMARY KEY (id);


--
-- TOC entry 4697 (class 2606 OID 24770)
-- Name: units units_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.units
    ADD CONSTRAINT units_pkey PRIMARY KEY (id);


--
-- TOC entry 4687 (class 2606 OID 24730)
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- TOC entry 4714 (class 2606 OID 24847)
-- Name: order_content order_content_article_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.order_content
    ADD CONSTRAINT order_content_article_id_fkey FOREIGN KEY (article_id) REFERENCES public.acrticules(id) ON DELETE CASCADE;


--
-- TOC entry 4715 (class 2606 OID 24879)
-- Name: order_content order_content_order_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.order_content
    ADD CONSTRAINT order_content_order_id_fkey FOREIGN KEY (order_id) REFERENCES public."order"(id) ON DELETE CASCADE NOT VALID;


--
-- TOC entry 4716 (class 2606 OID 24864)
-- Name: order order_pickup_point_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."order"
    ADD CONSTRAINT order_pickup_point_id_fkey FOREIGN KEY (pickup_point_id) REFERENCES public.pickup_points(id) ON DELETE CASCADE;


--
-- TOC entry 4717 (class 2606 OID 24874)
-- Name: order order_status_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."order"
    ADD CONSTRAINT order_status_id_fkey FOREIGN KEY (status_id) REFERENCES public.order_status(id) ON DELETE CASCADE;


--
-- TOC entry 4718 (class 2606 OID 24869)
-- Name: order order_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."order"
    ADD CONSTRAINT order_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(id) ON DELETE CASCADE;


--
-- TOC entry 4709 (class 2606 OID 24817)
-- Name: product product_article_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product
    ADD CONSTRAINT product_article_id_fkey FOREIGN KEY (article_id) REFERENCES public.acrticules(id) ON DELETE CASCADE NOT VALID;


--
-- TOC entry 4710 (class 2606 OID 24832)
-- Name: product product_producer_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product
    ADD CONSTRAINT product_producer_id_fkey FOREIGN KEY (producer_id) REFERENCES public.producers(id) ON DELETE CASCADE NOT VALID;


--
-- TOC entry 4711 (class 2606 OID 24837)
-- Name: product product_product_type_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product
    ADD CONSTRAINT product_product_type_id_fkey FOREIGN KEY (product_type_id) REFERENCES public.product_type(id) ON DELETE CASCADE NOT VALID;


--
-- TOC entry 4712 (class 2606 OID 24827)
-- Name: product product_provider_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product
    ADD CONSTRAINT product_provider_id_fkey FOREIGN KEY (provider_id) REFERENCES public.providers(id) ON DELETE CASCADE NOT VALID;


--
-- TOC entry 4713 (class 2606 OID 24822)
-- Name: product product_unit_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product
    ADD CONSTRAINT product_unit_id_fkey FOREIGN KEY (unit_id) REFERENCES public.units(id) ON DELETE CASCADE NOT VALID;


--
-- TOC entry 4708 (class 2606 OID 24731)
-- Name: users users_role_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_role_id_fkey FOREIGN KEY (role_id) REFERENCES public.roles(id) ON DELETE CASCADE;


-- Completed on 2026-05-24 10:12:38

--
-- PostgreSQL database dump complete
--