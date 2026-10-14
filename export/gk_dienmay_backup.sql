--
-- PostgreSQL database dump
--

\restrict zDON96qNLI1uwVI0vsZVO7373wBvbEf1OCXGflu9CrOwsXVRf8eikd4zP8nQv8a



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
-- Name: chi_tiet_hd; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.chi_tiet_hd (
    ma_hd character varying(10) NOT NULL,
    ma_sp character varying(10) NOT NULL,
    so_luong integer NOT NULL,
    CONSTRAINT chi_tiet_hd_so_luong_check CHECK ((so_luong > 0))
);


ALTER TABLE public.chi_tiet_hd OWNER TO postgres;

--
-- Name: hoa_don; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.hoa_don (
    ma_hd character varying(10) NOT NULL,
    ma_kh character varying(10) NOT NULL,
    ngay_lap date DEFAULT CURRENT_DATE NOT NULL
);


ALTER TABLE public.hoa_don OWNER TO postgres;

--
-- Name: khach_hang; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.khach_hang (
    ma_kh character varying(10) NOT NULL,
    ho_ten character varying(80) NOT NULL,
    thanh_pho character varying(50),
    sdt character varying(15),
    email character varying(100)
);


ALTER TABLE public.khach_hang OWNER TO postgres;

--
-- Name: san_pham; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.san_pham (
    ma_sp character varying(10) NOT NULL,
    ten_sp character varying(100) NOT NULL,
    loai character varying(30) NOT NULL,
    don_gia numeric(12,0) NOT NULL,
    so_luong_ton integer DEFAULT 0 NOT NULL,
    CONSTRAINT san_pham_don_gia_check CHECK ((don_gia > (0)::numeric)),
    CONSTRAINT san_pham_so_luong_ton_check CHECK ((so_luong_ton >= 0))
);


ALTER TABLE public.san_pham OWNER TO postgres;

--
-- Data for Name: chi_tiet_hd; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.chi_tiet_hd (ma_hd, ma_sp, so_luong) FROM stdin;
HD001	SP01	1
HD001	SP08	2
HD002	SP04	1
HD002	SP06	1
HD003	SP02	1
HD004	SP07	2
HD004	SP08	1
HD005	SP05	1
HD005	SP10	1
HD006	SP03	1
HD007	SP08	3
HD007	SP04	1
HD008	SP06	2
HD008	SP05	1
HD009	SP04	2
HD010	SP10	2
HD010	SP07	1
HD011	SP08	2
\.


--
-- Data for Name: hoa_don; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.hoa_don (ma_hd, ma_kh, ngay_lap) FROM stdin;
HD001	KH01	2026-09-02
HD002	KH02	2026-09-05
HD003	KH03	2026-09-12
HD004	KH01	2026-09-20
HD005	KH04	2026-09-25
HD006	KH05	2026-10-01
HD007	KH02	2026-10-03
HD008	KH06	2026-10-06
HD009	KH03	2026-08-28
HD010	KH04	2026-10-08
HD011	KH09	2026-10-09
\.


--
-- Data for Name: khach_hang; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.khach_hang (ma_kh, ho_ten, thanh_pho, sdt, email) FROM stdin;
KH02	Tran Thi Binh	Ha Noi	0912000002	\N
KH03	Le Van Cuong	Phu Tho	0912000003	\N
KH04	Pham Thi Dung	Viet Tri	0912000004	\N
KH05	Hoang Van Em	Vinh Phuc	0912000005	\N
KH06	Do Thi Giang	Ha Noi	0912000006	\N
KH07	Bui Van Hai	Phu Tho	0912000007	\N
KH08	Vu Thi Lan	Viet Tri	0912000008	\N
KH01	Nguyen Van An	Viet Tri	0912000001	an.nguyen@example.com
KH09	Dang Van Kien	Viet Tri	0912000009	\N
\.


--
-- Data for Name: san_pham; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.san_pham (ma_sp, ten_sp, loai, don_gia, so_luong_ton) FROM stdin;
SP04	May giat Toshiba 9kg	May giat	7200000	10
SP05	May giat Electrolux 10kg	May giat	11800000	6
SP06	Dieu hoa Daikin 12000BTU	Dieu hoa	10500000	12
SP07	Dieu hoa Panasonic 9000BTU	Dieu hoa	8900000	9
SP08	Noi chien khong dau Philips	Gia dung	2300000	30
SP10	Quat dieu hoa Kangaroo	Gia dung	3200000	18
SP01	Tivi Samsung 43 inch	Tivi	7650000	15
SP02	Tivi LG 55 inch	Tivi	12510000	8
SP03	Tivi Sony 65 inch	Tivi	22050000	4
\.


--
-- Name: chi_tiet_hd chi_tiet_hd_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.chi_tiet_hd
    ADD CONSTRAINT chi_tiet_hd_pkey PRIMARY KEY (ma_hd, ma_sp);


--
-- Name: hoa_don hoa_don_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.hoa_don
    ADD CONSTRAINT hoa_don_pkey PRIMARY KEY (ma_hd);


--
-- Name: khach_hang khach_hang_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.khach_hang
    ADD CONSTRAINT khach_hang_pkey PRIMARY KEY (ma_kh);


--
-- Name: khach_hang khach_hang_sdt_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.khach_hang
    ADD CONSTRAINT khach_hang_sdt_key UNIQUE (sdt);


--
-- Name: san_pham san_pham_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.san_pham
    ADD CONSTRAINT san_pham_pkey PRIMARY KEY (ma_sp);


--
-- Name: chi_tiet_hd chi_tiet_hd_ma_hd_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.chi_tiet_hd
    ADD CONSTRAINT chi_tiet_hd_ma_hd_fkey FOREIGN KEY (ma_hd) REFERENCES public.hoa_don(ma_hd);


--
-- Name: chi_tiet_hd chi_tiet_hd_ma_sp_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.chi_tiet_hd
    ADD CONSTRAINT chi_tiet_hd_ma_sp_fkey FOREIGN KEY (ma_sp) REFERENCES public.san_pham(ma_sp);


--
-- Name: hoa_don hoa_don_ma_kh_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.hoa_don
    ADD CONSTRAINT hoa_don_ma_kh_fkey FOREIGN KEY (ma_kh) REFERENCES public.khach_hang(ma_kh);


--
-- PostgreSQL database dump complete
--

\unrestrict zDON96qNLI1uwVI0vsZVO7373wBvbEf1OCXGflu9CrOwsXVRf8eikd4zP8nQv8a

