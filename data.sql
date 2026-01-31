--
-- PostgreSQL database dump
--

\restrict zzoD1DmZurkIwX1KSHz6jMBfy6Kyp96U0sS9EQer8oAkLKT1oMs0hKrSkh57F8A

-- Dumped from database version 18.1 (Debian 18.1-1.pgdg13+2)
-- Dumped by pg_dump version 18.1 (Debian 18.1-1.pgdg13+2)

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET transaction_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- Data for Name: Category; Type: TABLE DATA; Schema: public; Owner: postgresql
--

COPY public."Category" (id, name, "imageUrl", "createdAt", "updatedAt", "isActive", slug) FROM stdin;
8c59ec6b-d565-41e5-a0e1-9685ab4b44a0	Trái cây	http://localhost:5000/uploads/1768215745029-756686103.png	2026-01-11 10:40:49.767	2026-01-14 05:33:27.08	t	trai-cay
286631c0-b3b3-4055-8b3f-b8a3b0637648	Nước tăng lực	http://localhost:5000/uploads/1768127331258-656330177.jpg	2026-01-06 14:40:15.252	2026-01-11 13:21:48.901	t	nuoc-tang-luc
460b0ebd-98a8-4cdc-b995-75a86b321511	Đồ ăn & thực phẩm	http://localhost:5000/uploads/1768188991985-273369358.png	2026-01-06 14:40:15.252	2026-01-12 03:36:33.26	t	do-an-thuc-pham
cb8192f2-7ddb-4611-8cf6-6c22aae6a534	Bánh snack	http://localhost:5000/uploads/1768215597655-439490529.png	2026-01-06 14:40:15.252	2026-01-19 04:57:10.556	t	banh-snack
488c4285-9071-4ddd-915a-7a46fac093b5	Thịt, cá, trứng	http://localhost:5000/uploads/1768215922293-865410864.png	2026-01-11 10:49:50.224	2026-01-23 11:48:02.716	t	thit-ca-trung
c529266e-7706-4809-b784-cfcb81596e20	Quần áo	http://localhost:5000/uploads/1768216170274-55640973.jpeg	2026-01-06 14:40:15.252	2026-01-23 11:48:07.091	t	quan-ao
7ca58ff4-6b27-44b8-a83d-4be20d95a1cd	Đồ uống giải khát	http://localhost:5000/uploads/1768215682805-659006868.png	2026-01-06 14:40:15.252	2026-01-12 11:01:23.679	t	do-uong-giai-khat
d3824cc8-1f29-4e4f-ab72-4a4ad94fa79d	Sữa, bơ & phô mai	http://localhost:5000/uploads/1768215818315-611113424.png	2026-01-06 14:40:15.252	2026-01-12 11:03:39.226	t	sua-bo-va-pho-mai
3e6d3914-1914-4a13-b85f-c72b2d8ab156	Rau củ quả	http://localhost:5000/uploads/1768216006193-707283134.png	2026-01-11 10:44:02.146	2026-01-12 11:06:47.127	t	rau-cu-qua
af4b4680-6565-4c91-b8d1-f41f4eba1256	Dầu ăn, gia vị	http://localhost:5000/uploads/1768216286651-814714218.png	2026-01-06 14:40:15.252	2026-01-12 11:11:27.553	t	giau-an-gia-vi
\.


--
-- Data for Name: Notification; Type: TABLE DATA; Schema: public; Owner: postgresql
--

COPY public."Notification" (id, type, "itemId", message_vi, message_en, "isSeen", "createdAt", "updatedAt") FROM stdin;
afdac4fc-8f53-46a0-8795-1c8bf80c110f	ORDER	068fc5fd-be0c-4219-80d3-cca4fbf620ec	Bạn có đơn hàng mới	You have new order	f	2026-01-30 10:43:54.491	2026-01-30 10:43:54.491
a6603c4d-a0d1-4ea1-9e7f-70e362bf946d	ORDER	41dece2b-0e29-45e6-8ed1-5486b995a934	Bạn có đơn hàng mới	You have new order	f	2026-01-30 10:49:18.443	2026-01-30 10:49:18.443
b78cabcb-0552-4b50-aa2a-89b41fe0afa5	ORDER	62a78853-79c8-4d8e-b237-5082f855625a	Bạn có đơn hàng mới	You have new order	f	2026-01-30 10:55:51.078	2026-01-30 10:55:51.078
00351498-59a1-4dc2-90f3-354e6eca11ac	ORDER	e6570f70-e1f7-4ae9-8874-ed98247fb6dc	Bạn có đơn hàng mới	You have new order	f	2026-01-30 10:57:45.12	2026-01-30 10:57:45.12
5d787078-0ab2-4813-8ca3-228ea5874311	ORDER	9b962855-8111-450b-a99b-e90f81f48285	Bạn có đơn hàng mới	You have new order	f	2026-01-31 02:29:06.857	2026-01-31 02:29:06.857
56cd9695-bb56-48e8-b326-0df4e8ca4a45	ORDER	7d286f8a-4921-454a-bc61-4bb20f528d2f	Bạn có đơn hàng mới	You have new order	f	2026-01-31 02:40:30.049	2026-01-31 02:40:30.049
0161cadc-7818-45af-a31f-049c0e773848	ORDER	c1d6d724-19ef-41da-a4d9-93c51031a9e4	Bạn có đơn hàng mới	You have new order	f	2026-01-31 02:41:00.872	2026-01-31 02:41:00.872
0c58cd13-8bbc-4dc4-94a1-a42a17098e82	ORDER	bff8f9fa-a379-48f8-b95e-c4b71b2e07c9	Bạn có đơn hàng mới	You have new order	t	2026-01-30 10:50:58.037	2026-01-30 10:50:58.037
e0cddbb9-f0e5-4fd9-a53a-beec8d6c86c9	ORDER	765863f9-369d-45e3-9fc8-f97cd2c3cc8a	Bạn có đơn hàng mới	You have new order	t	2026-01-31 02:30:38.932	2026-01-31 02:30:38.932
0759e5b8-d625-4f99-9e12-f100e9e17667	ORDER	fb917b7c-c3f2-4612-9cff-1c15a2244002	Bạn có đơn hàng mới	You have new order	t	2026-01-31 04:30:25.906	2026-01-31 10:27:16.171
8fe8a2fb-f12a-40fd-98b0-ff2daeb36597	ORDER	69196212-5c92-4ceb-9459-4fa71ad802b7	Bạn có đơn hàng mới	You have new order	t	2026-01-30 11:01:25.727	2026-01-31 10:27:24.054
0ab5534d-6059-4180-b90f-f4668b0ab24a	ORDER	c4571324-93f6-4e01-95f7-af697db80bd1	Bạn có đơn hàng mới	You have new order	t	2026-01-31 10:29:37.007	2026-01-31 10:29:47.765
7e54f449-eebc-4adc-8e5e-be9317f6a29d	ORDER	aa6449d8-0eed-4767-a3b0-412aa6eabad5	Bạn có đơn hàng mới	You have new order	t	2026-01-31 02:46:20.308	2026-01-31 10:30:27.435
357ed731-5396-43fc-8abd-1e42f10690d7	ORDER	64f8196f-ecd7-435f-8b65-3cb9a560c5b0	Bạn có đơn hàng mới	You have new order	f	2026-01-31 10:32:02.506	2026-01-31 10:32:02.506
2b6957ac-c601-4fe2-b71e-5607753fc9a2	ORDER	4b1a26f2-22fe-4da2-95c2-f1149499a95f	Bạn có đơn hàng mới	You have new order	f	2026-01-31 10:55:39.082	2026-01-31 10:55:39.082
ec8adfdd-ba65-4cf0-a5a7-ba3e8093a2d1	ORDER	aa4f13d5-3c3b-4b09-ba0d-166722166bf0	Bạn có đơn hàng mới	You have new order	f	2026-01-31 10:58:05.092	2026-01-31 10:58:05.092
24b78af5-63d3-4400-933e-f2481ddd03aa	ORDER	6cafd2f5-0d9f-41ed-9a98-e8106090696a	Bạn có đơn hàng mới	You have new order	f	2026-01-31 11:07:13.148	2026-01-31 11:07:13.148
711c97ca-3190-4be3-ae9a-ac06bb8a9d23	ORDER	af7cb15e-9f4a-48cb-a48f-ad759aa14ede	Bạn có đơn hàng mới	You have new order	f	2026-01-31 11:27:23.444	2026-01-31 11:27:23.444
\.


--
-- Data for Name: User; Type: TABLE DATA; Schema: public; Owner: postgresql
--

COPY public."User" (id, email, password, "fullName", role, "isActive", "createdAt", "updatedAt", address, phone, avatar) FROM stdin;
5560efbf-0bd5-4055-b41f-f56d6c307f59	admin@gmail.com	$2b$10$UdHxFNw78vBZUco7Qd7w8eoJtPGR8Ek3Y0JEgNQdIt45e9tDcziG.	Admin	ADMIN	t	2026-01-07 04:06:44.962	2026-01-07 04:06:44.962	\N	\N	\N
a0214f6e-5af6-4602-b2f2-80d5465c8f6f	lam7kong_7kao@gmail.com	$2b$10$UdHxFNw78vBZUco7Qd7w8eoJtPGR8Ek3Y0JEgNQdIt45e9tDcziG.	Đào Lâm Đồng	USER	f	2026-01-07 04:06:44.962	2026-01-07 04:06:44.962	12273 Thụy Vân Viaduct	\N	\N
ba19596c-a4f4-4124-be5a-513b12a5c274	7kuctue.ly55@gmail.com	$2b$10$UdHxFNw78vBZUco7Qd7w8eoJtPGR8Ek3Y0JEgNQdIt45e9tDcziG.	Lý Đức Tuệ	USER	t	2026-01-07 04:06:44.962	2026-01-07 04:06:44.962	\N	0449587641	\N
2d5a77bf-a719-4d14-b204-1fcbecbca660	tonhi.7ko@gmail.com	$2b$10$UdHxFNw78vBZUco7Qd7w8eoJtPGR8Ek3Y0JEgNQdIt45e9tDcziG.	Đỗ Tố Nhi	USER	t	2026-01-07 04:06:44.962	2026-01-07 04:06:44.962	76906 Đỗ Lane	0665735641	\N
8b4f1e2b-646d-4ba3-8e11-d813389f8d75	huonglan.to@gmail.com	$2b$10$UdHxFNw78vBZUco7Qd7w8eoJtPGR8Ek3Y0JEgNQdIt45e9tDcziG.	Tô Hương Lan	USER	f	2026-01-07 04:06:44.962	2026-01-07 04:06:44.962	91438 Đỗ Pine	\N	\N
a7048ec2-9a93-402f-89ba-f15d6a480be3	thuydung.le@gmail.com	$2b$10$UdHxFNw78vBZUco7Qd7w8eoJtPGR8Ek3Y0JEgNQdIt45e9tDcziG.	Lê Thùy Dung	USER	f	2026-01-07 04:06:44.962	2026-01-07 04:06:44.962	207 Dương Branch	\N	\N
ae424680-4f29-4606-bb23-b6c346bc132f	thanhtuyet_7ko49@gmail.com	$2b$10$UdHxFNw78vBZUco7Qd7w8eoJtPGR8Ek3Y0JEgNQdIt45e9tDcziG.	Đỗ Thanh Tuyết	USER	t	2026-01-07 04:06:44.962	2026-01-07 04:06:44.962	668 Lê Ports	\N	\N
23d656be-6ef8-424e-bc61-5b85229e169e	7kuctam_7koan85@gmail.com	$2b$10$UdHxFNw78vBZUco7Qd7w8eoJtPGR8Ek3Y0JEgNQdIt45e9tDcziG.	Đoàn Đức Tâm	USER	f	2026-01-07 04:06:44.962	2026-01-23 16:10:06.746	\N	\N	\N
aa3b640c-6acd-4777-b9b3-b7d3f08ad122	thienha_7kinh@gmail.com	$2b$10$UdHxFNw78vBZUco7Qd7w8eoJtPGR8Ek3Y0JEgNQdIt45e9tDcziG.	Đinh Thiên Hà	USER	t	2026-01-07 04:06:44.962	2026-01-24 01:46:16.02	411 Minh Sơn Plains	0630151133	\N
47ac046b-ba8f-48ce-8ffc-4af020608f3b	hungdung.mai78@gmail.com	$2b$10$UdHxFNw78vBZUco7Qd7w8eoJtPGR8Ek3Y0JEgNQdIt45e9tDcziG.	Mai Hùng Dũng	USER	f	2026-01-07 04:06:44.962	2026-01-23 17:17:45.945	\N	\N	\N
d67b18a4-4c67-4562-b334-1c50aca385c1	7kinhngan_duong31@gmail.com	$2b$10$UdHxFNw78vBZUco7Qd7w8eoJtPGR8Ek3Y0JEgNQdIt45e9tDcziG.	Dương Đình Ngân	USER	f	2026-01-07 04:06:44.962	2026-01-23 17:17:48.592	52112 Dương Ports	0310520671	\N
df3d23c0-3bf6-42f7-9f8c-af501551f1ad	xuanphuc.bui@gmail.com	$2b$10$UdHxFNw78vBZUco7Qd7w8eoJtPGR8Ek3Y0JEgNQdIt45e9tDcziG.	Bùi Xuân Phúc	USER	f	2026-01-07 04:06:44.962	2026-01-23 17:17:55.288	\N	\N	\N
e1930a27-1c7a-44d0-8913-b472f8a93554	lamoanh_lam@gmail.com	$2b$10$UdHxFNw78vBZUco7Qd7w8eoJtPGR8Ek3Y0JEgNQdIt45e9tDcziG.	Lâm Lâm Oanh	USER	t	2026-01-07 04:06:44.962	2026-01-24 01:50:47.948	74787 Nhật Minh Dale	\N	\N
77ec2f95-3813-443d-b569-d32051f57aca	thuongkhang_ho@gmail.com	$2b$10$UdHxFNw78vBZUco7Qd7w8eoJtPGR8Ek3Y0JEgNQdIt45e9tDcziG.	Hồ Thượng Khang	USER	t	2026-01-07 04:06:44.962	2026-01-23 17:18:11.737	13851 Gia Huy Lake	0760484516	\N
9ee7ec15-bc4e-4d01-904d-d14f48e4d2a3	hongminh_7ko@gmail.com	$2b$10$UdHxFNw78vBZUco7Qd7w8eoJtPGR8Ek3Y0JEgNQdIt45e9tDcziG.	Đỗ Hồng Minh	USER	t	2026-01-07 04:06:44.962	2026-01-24 01:45:02.862	\N	0192513348	\N
30beadcb-b92d-4e0c-97d0-1edc9ac687a1	anhmai_to@gmail.com	$2b$10$UdHxFNw78vBZUco7Qd7w8eoJtPGR8Ek3Y0JEgNQdIt45e9tDcziG.	Tô Anh Mai	USER	f	2026-01-07 04:06:44.962	2026-01-24 01:45:04.764	\N	\N	\N
1f5adad4-e84c-41ab-87c6-38114e9ef609	duythang.ha24@gmail.com	$2b$10$UdHxFNw78vBZUco7Qd7w8eoJtPGR8Ek3Y0JEgNQdIt45e9tDcziG.	Hà Duy Thắng	USER	t	2026-01-07 04:06:44.962	2026-01-24 01:45:09.843	97677 Thiện Tâm Fords	\N	\N
79d06455-9835-4127-9413-f5aabb014bd8	trungnguyen.mai@gmail.com	$2b$10$UdHxFNw78vBZUco7Qd7w8eoJtPGR8Ek3Y0JEgNQdIt45e9tDcziG.	Mai Trung Nguyên	USER	t	2026-01-07 04:06:44.962	2026-01-24 01:45:06.24	\N	0123376729	\N
5136b4a8-072e-4cd9-8446-aaad66e82008	thanhson_7kinh@gmail.com	$2b$10$UdHxFNw78vBZUco7Qd7w8eoJtPGR8Ek3Y0JEgNQdIt45e9tDcziG.	Đinh Thanh Sơn	USER	t	2026-01-07 04:06:44.962	2026-01-23 17:22:48.546	\N	\N	\N
63bc0a50-c936-4693-aeaa-b15fbaec0324	vinhluan.truong@gmail.com	$2b$10$UdHxFNw78vBZUco7Qd7w8eoJtPGR8Ek3Y0JEgNQdIt45e9tDcziG.	Trương Vĩnh Luân	USER	t	2026-01-07 04:06:44.962	2026-01-23 17:24:32.082	5434 Diễm Thư Overpass	0129191381	\N
bf1d1ebf-1c3e-4bd4-85f4-f4f0f78b87b7	duyenhong.trinh42@gmail.com	$2b$10$UdHxFNw78vBZUco7Qd7w8eoJtPGR8Ek3Y0JEgNQdIt45e9tDcziG.	Trịnh Duyên Hồng	USER	t	2026-01-07 04:06:44.962	2026-01-23 17:25:45.463	\N	0658630082	\N
92f35961-eb44-4779-ab47-a58fa3185252	trieuman.trinh1@gmail.com	$2b$10$UdHxFNw78vBZUco7Qd7w8eoJtPGR8Ek3Y0JEgNQdIt45e9tDcziG.	Trịnh Triệu Mẫn	USER	f	2026-01-07 04:06:44.962	2026-01-23 17:25:50.085	\N	0808516898	\N
d27fc351-7bf9-424a-9170-7f720d2440a9	xuanmai_tran@gmail.com	$2b$10$UdHxFNw78vBZUco7Qd7w8eoJtPGR8Ek3Y0JEgNQdIt45e9tDcziG.	Trần Xuân Mai	USER	f	2026-01-07 04:06:44.962	2026-01-23 17:25:54.875	\N	0437118250	\N
71876d7b-be24-4f4d-aa71-f1d3de4a36da	hongphuong_vuong@gmail.com	$2b$10$UdHxFNw78vBZUco7Qd7w8eoJtPGR8Ek3Y0JEgNQdIt45e9tDcziG.	Vương Hồng Phương	USER	f	2026-01-07 04:06:44.962	2026-01-23 17:29:41.792	\N	\N	\N
05e1b59f-2e97-46cd-a68e-2d41f3c693e8	thanhhien.trinh@gmail.com	$2b$10$UdHxFNw78vBZUco7Qd7w8eoJtPGR8Ek3Y0JEgNQdIt45e9tDcziG.	Trịnh Thanh Hiền	USER	f	2026-01-07 04:06:44.962	2026-01-23 17:29:52.827	36222 Trương Dam	0154608952	\N
a02f8e7e-55b5-4019-b31a-59abec974d49	xuantrang_7kao@gmail.com	$2b$10$UdHxFNw78vBZUco7Qd7w8eoJtPGR8Ek3Y0JEgNQdIt45e9tDcziG.	Đào Xuân Trang	USER	t	2026-01-07 04:06:44.962	2026-01-23 17:29:54.397	\N	0444306776	\N
8bb99979-903d-409e-975e-55f4479e3465	thuyquynh.7kao@gmail.com	$2b$10$UdHxFNw78vBZUco7Qd7w8eoJtPGR8Ek3Y0JEgNQdIt45e9tDcziG.	Đào Thúy Quỳnh	USER	f	2026-01-07 04:06:44.962	2026-01-23 17:29:55.723	\N	0707160377	\N
b81cd923-8936-4e01-b72a-1e0b20c71046	7kuchai.to20@gmail.com	$2b$10$UdHxFNw78vBZUco7Qd7w8eoJtPGR8Ek3Y0JEgNQdIt45e9tDcziG.	Tô Đức Hải	USER	f	2026-01-07 04:06:44.962	2026-01-24 01:51:02.652	\N	0660493443	\N
90d896f9-20c8-4d0e-be35-17c4839cafab	7kinhduong.7kao@gmail.com	$2b$10$UdHxFNw78vBZUco7Qd7w8eoJtPGR8Ek3Y0JEgNQdIt45e9tDcziG.	Đào Đình Dương	USER	f	2026-01-07 04:06:44.962	2026-01-23 17:30:00.445	\N	\N	\N
390cedfa-55cc-46ff-81e8-e735516e4ac7	7kucphong.hoang@gmail.com	$2b$10$UdHxFNw78vBZUco7Qd7w8eoJtPGR8Ek3Y0JEgNQdIt45e9tDcziG.	Hoàng Đức Phong	USER	f	2026-01-07 04:06:44.962	2026-01-23 17:30:46.17	53068 Trung Nhân Ways	0109078579	\N
ea2eb6e1-0363-4a3c-a2c5-b093277c8a9a	vanchi.duong@gmail.com	$2b$10$UdHxFNw78vBZUco7Qd7w8eoJtPGR8Ek3Y0JEgNQdIt45e9tDcziG.	Dương Vân Chi	USER	t	2026-01-07 04:06:44.962	2026-01-24 01:50:46.309	445 Nguyệt Lan Streets	\N	\N
663241c8-aea5-4445-8ae4-93ffef5b6b6d	yenson_tran79@gmail.com	$2b$10$UdHxFNw78vBZUco7Qd7w8eoJtPGR8Ek3Y0JEgNQdIt45e9tDcziG.	Trần Yên Sơn	USER	t	2026-01-07 04:06:44.962	2026-01-23 17:31:00.894	\N	\N	\N
1933234c-c68a-45b6-817b-d5a42ce734b6	huehong.bui@gmail.com	$2b$10$UdHxFNw78vBZUco7Qd7w8eoJtPGR8Ek3Y0JEgNQdIt45e9tDcziG.	Bùi Huệ Hồng	USER	f	2026-01-07 04:06:44.962	2026-01-24 01:45:00.49	\N	\N	\N
fd7ce833-0624-4c07-be3f-0aa61137657a	7kongquan.ly42@gmail.com	$2b$10$UdHxFNw78vBZUco7Qd7w8eoJtPGR8Ek3Y0JEgNQdIt45e9tDcziG.	Lý Đông Quân	USER	f	2026-01-07 04:06:44.962	2026-01-24 01:50:36.277	\N	\N	\N
f86dde75-dea4-4848-b2c2-6d17f1a53d73	yennhi_tran43@gmail.com	$2b$10$UdHxFNw78vBZUco7Qd7w8eoJtPGR8Ek3Y0JEgNQdIt45e9tDcziG.	Trần Yến Nhi	USER	t	2026-01-07 04:06:44.962	2026-01-24 01:54:39.115	1858 Phùng Mills	\N	\N
ada9ede4-328e-46fc-bd40-4f9384674d46	ngockhanh_nguyen38@gmail.com	$2b$10$UdHxFNw78vBZUco7Qd7w8eoJtPGR8Ek3Y0JEgNQdIt45e9tDcziG.	Nguyễn Ngọc Khánh	USER	t	2026-01-07 04:06:44.962	2026-01-07 04:06:44.962	62758 Đỗ Prairie	\N	\N
0cbaab79-3e88-4a6f-8662-d3ec44fcac08	thienlac_mai@gmail.com	$2b$10$UdHxFNw78vBZUco7Qd7w8eoJtPGR8Ek3Y0JEgNQdIt45e9tDcziG.	Mai Thiên Lạc	USER	t	2026-01-07 04:06:44.962	2026-01-07 04:06:44.962	58427 Bùi Alley	0812377029	\N
b873fe64-219f-45e6-a995-bf15ea7f76bb	minhtam_truong@gmail.com	$2b$10$UdHxFNw78vBZUco7Qd7w8eoJtPGR8Ek3Y0JEgNQdIt45e9tDcziG.	Trương Minh Tâm	USER	f	2026-01-07 04:06:44.962	2026-01-07 04:06:44.962	\N	\N	\N
4d198ca0-6418-46d1-a37e-7fd36f048db9	minhnghia.ngo90@gmail.com	$2b$10$UdHxFNw78vBZUco7Qd7w8eoJtPGR8Ek3Y0JEgNQdIt45e9tDcziG.	Ngô Minh Nghĩa	USER	f	2026-01-07 04:06:44.962	2026-01-07 04:06:44.962	476 Quang Thiên Circle	0917780981	\N
d362febe-a28b-4a86-b11c-358497aecab4	bichtram.7koan@gmail.com	$2b$10$UdHxFNw78vBZUco7Qd7w8eoJtPGR8Ek3Y0JEgNQdIt45e9tDcziG.	Đoàn Bích Trâm	USER	t	2026-01-07 04:06:44.962	2026-01-07 04:06:44.962	\N	0609498034	\N
9554fbe5-ca77-468c-a86c-56ec57a04a4e	hong7kuc.ly41@gmail.com	$2b$10$UdHxFNw78vBZUco7Qd7w8eoJtPGR8Ek3Y0JEgNQdIt45e9tDcziG.	Lý Hồng Đức	USER	t	2026-01-07 04:06:44.962	2026-01-07 04:06:44.962	\N	\N	\N
7254c291-33a6-4052-8854-930446e5bdc7	7kinhnguyen.to@gmail.com	$2b$10$UdHxFNw78vBZUco7Qd7w8eoJtPGR8Ek3Y0JEgNQdIt45e9tDcziG.	Tô Đình Nguyên	USER	f	2026-01-07 04:06:44.962	2026-01-07 04:06:44.962	\N	0232042542	\N
2630db90-4906-41c3-aa58-a1e3ad86005c	tuyetlam_vu@gmail.com	$2b$10$UdHxFNw78vBZUco7Qd7w8eoJtPGR8Ek3Y0JEgNQdIt45e9tDcziG.	Vũ Tuyết Lâm	USER	t	2026-01-07 04:06:44.962	2026-01-07 04:06:44.962	8009 Diễm Quyên Street	0437280925	\N
ea45eb1d-8b2f-4629-8630-c15b79f0441c	tuantai.le@gmail.com	$2b$10$UdHxFNw78vBZUco7Qd7w8eoJtPGR8Ek3Y0JEgNQdIt45e9tDcziG.	Lê Tuấn Tài	USER	t	2026-01-07 04:06:44.962	2026-01-07 04:06:44.962	\N	0482468853	\N
b298933a-8af2-471e-9745-d257e291eefe	xuandung.hoang57@gmail.com	$2b$10$UdHxFNw78vBZUco7Qd7w8eoJtPGR8Ek3Y0JEgNQdIt45e9tDcziG.	Hoàng Xuân Dung	USER	f	2026-01-07 04:06:44.962	2026-01-07 04:06:44.962	\N	0716677728	\N
d20a4f67-ae4f-426e-8605-332d6b357411	huuthien.trinh22@gmail.com	$2b$10$UdHxFNw78vBZUco7Qd7w8eoJtPGR8Ek3Y0JEgNQdIt45e9tDcziG.	Trịnh Hữu Thiện	USER	f	2026-01-07 04:06:44.962	2026-01-24 01:54:51.457	\N	\N	\N
987c386e-f28d-4dd1-8ee6-fa23f8da522c	phucnguyen.phung29@gmail.com	$2b$10$UdHxFNw78vBZUco7Qd7w8eoJtPGR8Ek3Y0JEgNQdIt45e9tDcziG.	Phùng Phúc Nguyên	USER	t	2026-01-07 04:06:44.962	2026-01-24 01:55:13.426	\N	0385567218	\N
0407759c-62a8-4fae-81c8-346433ffc26a	diemtrang.mai@gmail.com	$2b$10$UdHxFNw78vBZUco7Qd7w8eoJtPGR8Ek3Y0JEgNQdIt45e9tDcziG.	Mai Diễm Trang	USER	t	2026-01-07 04:06:44.962	2026-01-07 04:06:44.962	\N	\N	\N
2f875ac4-27a9-4bcc-91ed-43512399afe4	thachthao_nguyen85@gmail.com	$2b$10$UdHxFNw78vBZUco7Qd7w8eoJtPGR8Ek3Y0JEgNQdIt45e9tDcziG.	Nguyễn Thạch Thảo	USER	f	2026-01-07 04:06:44.962	2026-01-07 04:06:44.962	\N	0338183440	\N
9b8733f9-71f9-44a6-b8ea-64f801e54723	monghoa_mai25@gmail.com	$2b$10$UdHxFNw78vBZUco7Qd7w8eoJtPGR8Ek3Y0JEgNQdIt45e9tDcziG.	Mai Mộng Hoa	USER	f	2026-01-07 04:06:44.962	2026-01-07 04:06:44.962	14576 Ý Bình Cove	\N	\N
36482050-48cc-45a5-8632-78badf3a4d07	chikhiem.pham@gmail.com	$2b$10$UdHxFNw78vBZUco7Qd7w8eoJtPGR8Ek3Y0JEgNQdIt45e9tDcziG.	Phạm Chí Khiêm	USER	t	2026-01-07 04:06:44.962	2026-01-07 04:06:44.962	356 Oanh Vũ Groves	0688609729	\N
2eae043e-df1d-4480-9b9a-4b4609eff02f	khuetrung_lam63@gmail.com	$2b$10$UdHxFNw78vBZUco7Qd7w8eoJtPGR8Ek3Y0JEgNQdIt45e9tDcziG.	Lâm Khuê Trung	USER	f	2026-01-07 04:06:44.962	2026-01-07 04:06:44.962	91511 Ngọc Liên Manor	0580153942	\N
4a4ae607-6930-44b2-b93a-e393485bb3f6	ngocminh.ly78@gmail.com	$2b$10$UdHxFNw78vBZUco7Qd7w8eoJtPGR8Ek3Y0JEgNQdIt45e9tDcziG.	Lý Ngọc Minh	USER	f	2026-01-07 04:06:44.962	2026-01-07 04:06:44.962	\N	0448908939	\N
bbb2973d-411e-4710-9c32-78b630772dbe	kimthanh_tran@gmail.com	$2b$10$UdHxFNw78vBZUco7Qd7w8eoJtPGR8Ek3Y0JEgNQdIt45e9tDcziG.	Trần Kim Thanh	USER	f	2026-01-07 04:06:44.962	2026-01-07 04:06:44.962	\N	\N	\N
9ebe27ce-60bd-40a6-976d-fa010189e7ca	maichau_hoang87@gmail.com	$2b$10$UdHxFNw78vBZUco7Qd7w8eoJtPGR8Ek3Y0JEgNQdIt45e9tDcziG.	Hoàng Mai Châu	USER	f	2026-01-07 04:06:44.962	2026-01-07 04:06:44.962	\N	0972220813	\N
b6945782-6f3e-41cb-aa2b-16ae2120bf36	7kuclong_7kang3@gmail.com	$2b$10$UdHxFNw78vBZUco7Qd7w8eoJtPGR8Ek3Y0JEgNQdIt45e9tDcziG.	Đặng Đức Long	USER	t	2026-01-07 04:06:44.962	2026-01-07 04:06:44.962	\N	0898402523	\N
5d2179fe-2552-4ed1-b13b-f4629597d286	huethuong.7kinh72@gmail.com	$2b$10$UdHxFNw78vBZUco7Qd7w8eoJtPGR8Ek3Y0JEgNQdIt45e9tDcziG.	Đinh Huệ Thương	USER	f	2026-01-07 04:06:44.962	2026-01-07 04:06:44.962	1341 Hữu Hùng Courts	0706229176	\N
d9405959-37b1-438e-a0b2-c03a3462d55c	hongphat.nguyen80@gmail.com	$2b$10$UdHxFNw78vBZUco7Qd7w8eoJtPGR8Ek3Y0JEgNQdIt45e9tDcziG.	Nguyễn Hồng Phát	USER	f	2026-01-07 04:06:44.962	2026-01-07 04:06:44.962	\N	\N	\N
76ffc976-674a-430b-aa52-850316098709	hieuhoc.phung79@gmail.com	$2b$10$UdHxFNw78vBZUco7Qd7w8eoJtPGR8Ek3Y0JEgNQdIt45e9tDcziG.	Phùng Hiếu Học	USER	f	2026-01-07 04:06:44.962	2026-01-07 04:06:44.962	\N	0608839107	\N
7b09a51b-634c-48ef-a8d6-7911068e3796	monghoa.vuong@gmail.com	$2b$10$UdHxFNw78vBZUco7Qd7w8eoJtPGR8Ek3Y0JEgNQdIt45e9tDcziG.	Vương Mộng Hoa	USER	f	2026-01-07 04:06:44.962	2026-01-07 04:06:44.962	\N	\N	\N
0fa24c7c-d2f6-48aa-9342-326add35010d	huean_phung@gmail.com	$2b$10$UdHxFNw78vBZUco7Qd7w8eoJtPGR8Ek3Y0JEgNQdIt45e9tDcziG.	Phùng Huệ Ân	USER	f	2026-01-07 04:06:44.962	2026-01-07 04:06:44.962	\N	0097155789	\N
29ea56fd-234b-4f8d-8a19-d95ccdddca21	nhattan.truong@gmail.com	$2b$10$UdHxFNw78vBZUco7Qd7w8eoJtPGR8Ek3Y0JEgNQdIt45e9tDcziG.	Trương Nhật Tấn	USER	t	2026-01-07 04:06:44.962	2026-01-07 04:06:44.962	\N	0721314718	\N
163a8adf-29c2-4966-923c-4f693350026c	danhvan.tran93@gmail.com	$2b$10$UdHxFNw78vBZUco7Qd7w8eoJtPGR8Ek3Y0JEgNQdIt45e9tDcziG.	Trần Danh Văn	USER	f	2026-01-07 04:06:44.962	2026-01-07 04:06:44.962	\N	0491896149	\N
961e98d2-c1a9-4902-8328-c9c1c3323fa6	lapnghiep_tran@gmail.com	$2b$10$UdHxFNw78vBZUco7Qd7w8eoJtPGR8Ek3Y0JEgNQdIt45e9tDcziG.	Trần Lập Nghiệp	USER	t	2026-01-07 04:06:44.962	2026-01-07 04:06:44.962	\N	0514078371	\N
f1cc43be-9146-464d-ac86-8702917c666b	monggiac_ho@gmail.com	$2b$10$UdHxFNw78vBZUco7Qd7w8eoJtPGR8Ek3Y0JEgNQdIt45e9tDcziG.	Hồ Mộng Giác	USER	t	2026-01-07 04:06:44.962	2026-01-07 04:06:44.962	\N	\N	\N
0e997977-0ace-40c5-935b-983dbfbb9065	thuongthuong.nguyen@gmail.com	$2b$10$UdHxFNw78vBZUco7Qd7w8eoJtPGR8Ek3Y0JEgNQdIt45e9tDcziG.	Nguyễn Thương Thương	USER	f	2026-01-07 04:06:44.962	2026-01-07 04:06:44.962	\N	0901809410	\N
d4d7a734-c499-4ecc-9de6-6c02d02fbe62	bichty.mai@gmail.com	$2b$10$UdHxFNw78vBZUco7Qd7w8eoJtPGR8Ek3Y0JEgNQdIt45e9tDcziG.	Mai Bích Ty	USER	f	2026-01-07 04:06:44.962	2026-01-07 04:06:44.962	\N	\N	\N
9b07e751-0ba9-4938-ade1-a4cb64203e17	diemphuong_trinh@gmail.com	$2b$10$UdHxFNw78vBZUco7Qd7w8eoJtPGR8Ek3Y0JEgNQdIt45e9tDcziG.	Trịnh Diễm Phượng	USER	t	2026-01-07 04:06:44.962	2026-01-07 04:06:44.962	\N	0351151134	\N
cdbb47ae-5e0c-49d8-b7b8-9b8bb5bf37f6	hienhoa_bui18@gmail.com	$2b$10$UdHxFNw78vBZUco7Qd7w8eoJtPGR8Ek3Y0JEgNQdIt45e9tDcziG.	Bùi Hiền Hòa	USER	f	2026-01-07 04:06:44.962	2026-01-07 04:06:44.962	5350 Bùi Course	\N	\N
1fc2685e-7a0a-4936-becf-dd9d29cc5aef	annhan_7kinh@gmail.com	$2b$10$UdHxFNw78vBZUco7Qd7w8eoJtPGR8Ek3Y0JEgNQdIt45e9tDcziG.	Đinh An Nhàn	USER	f	2026-01-07 04:06:44.962	2026-01-07 04:06:44.962	9557 Đỗ Glens	\N	\N
d5f8c973-7fc2-4394-a3f4-e6839a13a318	duyhoang_ly80@gmail.com	$2b$10$UdHxFNw78vBZUco7Qd7w8eoJtPGR8Ek3Y0JEgNQdIt45e9tDcziG.	Lý Duy Hoàng	USER	f	2026-01-07 04:06:44.962	2026-01-07 04:06:44.962	\N	0395049890	\N
7f03683e-f49c-4356-bb7e-cd34199ef91c	viethuy_tang23@gmail.com	$2b$10$UdHxFNw78vBZUco7Qd7w8eoJtPGR8Ek3Y0JEgNQdIt45e9tDcziG.	Tăng Việt Huy	USER	t	2026-01-07 04:06:44.962	2026-01-07 04:06:44.962	6963 Dương Rue	\N	\N
4467827c-8c0e-47db-b6c6-f9dade8ef5dc	thuoanh_ngo36@gmail.com	$2b$10$UdHxFNw78vBZUco7Qd7w8eoJtPGR8Ek3Y0JEgNQdIt45e9tDcziG.	Ngô Thu Oanh	USER	f	2026-01-07 04:06:44.962	2026-01-07 04:06:44.962	986 Thiếu Anh Cliffs	0680351658	\N
42a4a14c-760f-4410-9e27-8578722fc429	vinhtho.le10@gmail.com	$2b$10$UdHxFNw78vBZUco7Qd7w8eoJtPGR8Ek3Y0JEgNQdIt45e9tDcziG.	Lê Vĩnh Thọ	USER	t	2026-01-07 04:06:44.962	2026-01-07 04:06:44.962	916 Trương Points	\N	\N
511c46ed-b1e9-4f75-afa5-c3107f1c4b86	kiencuong_tran95@gmail.com	$2b$10$UdHxFNw78vBZUco7Qd7w8eoJtPGR8Ek3Y0JEgNQdIt45e9tDcziG.	Trần Kiên Cường	USER	t	2026-01-07 04:06:44.962	2026-01-07 04:06:44.962	\N	0645684589	\N
0c29d5db-487c-4894-8134-5c3c347c70eb	7kinhthien.lam29@gmail.com	$2b$10$UdHxFNw78vBZUco7Qd7w8eoJtPGR8Ek3Y0JEgNQdIt45e9tDcziG.	Lâm Đình Thiện	USER	f	2026-01-07 04:06:44.962	2026-01-07 04:06:44.962	\N	\N	\N
c9285c95-27ac-4cea-8c25-1dded1e8bc2f	mynhan.bui@gmail.com	$2b$10$UdHxFNw78vBZUco7Qd7w8eoJtPGR8Ek3Y0JEgNQdIt45e9tDcziG.	Bùi Mỹ Nhân	USER	f	2026-01-07 04:06:44.962	2026-01-24 01:50:51.978	\N	0071140885	\N
c6dbda8d-73fb-445b-81b6-72c6d36fff1d	kietvo.7kinh@gmail.com	$2b$10$UdHxFNw78vBZUco7Qd7w8eoJtPGR8Ek3Y0JEgNQdIt45e9tDcziG.	Đinh Kiệt Võ	USER	f	2026-01-07 04:06:44.962	2026-01-24 01:54:58.967	9107 Trần Ridge	\N	\N
3eeb506c-28c7-4744-918b-378e11672141	huuthuc.hoang55@gmail.com	$2b$10$UdHxFNw78vBZUco7Qd7w8eoJtPGR8Ek3Y0JEgNQdIt45e9tDcziG.	Hoàng Hữu Thực	USER	f	2026-01-07 04:06:44.962	2026-01-07 04:06:44.962	\N	\N	\N
c8957e1a-1730-48fa-8cdd-4ef31d233745	thuy7kao_7kinh@gmail.com	$2b$10$UdHxFNw78vBZUco7Qd7w8eoJtPGR8Ek3Y0JEgNQdIt45e9tDcziG.	Đinh Thụy Đào	USER	t	2026-01-07 04:06:44.962	2026-01-07 04:06:44.962	2646 Mai Row	\N	\N
505efdd1-efe9-4980-b6c2-6a854176f3b0	7kucnhan.7kang@gmail.com	$2b$10$UdHxFNw78vBZUco7Qd7w8eoJtPGR8Ek3Y0JEgNQdIt45e9tDcziG.	Đặng Đức Nhân	USER	f	2026-01-07 04:06:44.962	2026-01-07 04:06:44.962	738 Vũ Road	0302423457	\N
297db9a6-5d17-41e6-b32c-456f313d87bf	huuvinh_tang@gmail.com	$2b$10$UdHxFNw78vBZUco7Qd7w8eoJtPGR8Ek3Y0JEgNQdIt45e9tDcziG.	Tăng Hữu Vĩnh	USER	f	2026-01-07 04:06:44.962	2026-01-07 04:06:44.962	67523 Hồng Thụy Station	\N	\N
cc7b0c4e-35ac-41b3-be33-5d39860ad12c	7kuckhai_tran@gmail.com	$2b$10$UdHxFNw78vBZUco7Qd7w8eoJtPGR8Ek3Y0JEgNQdIt45e9tDcziG.	Trần Đức Khải	USER	t	2026-01-07 04:06:44.962	2026-01-07 04:06:44.962	28749 Vương Triều Rest	\N	\N
ef3f2d97-6ae1-408c-9498-6e9d8a8acc0a	giahung.vu53@gmail.com	$2b$10$UdHxFNw78vBZUco7Qd7w8eoJtPGR8Ek3Y0JEgNQdIt45e9tDcziG.	Vũ Gia Hùng	USER	t	2026-01-07 04:06:44.962	2026-01-07 04:06:44.962	\N	\N	\N
7daaa864-cfeb-4ea7-8530-f99d2c809855	trung7kuc.7kao@gmail.com	$2b$10$UdHxFNw78vBZUco7Qd7w8eoJtPGR8Ek3Y0JEgNQdIt45e9tDcziG.	Đào Trung Đức	USER	t	2026-01-07 04:06:44.962	2026-01-07 04:06:44.962	\N	0691931711	\N
39c8a16b-9220-43cd-83b6-63d2f34c5973	tuantai.7kao78@gmail.com	$2b$10$UdHxFNw78vBZUco7Qd7w8eoJtPGR8Ek3Y0JEgNQdIt45e9tDcziG.	Đào Tuấn Tài	USER	t	2026-01-07 04:06:44.962	2026-01-07 04:06:44.962	\N	\N	\N
24f15538-1063-4eb3-89cd-a95ff5be9408	phihoang.7kao@gmail.com	$2b$10$UdHxFNw78vBZUco7Qd7w8eoJtPGR8Ek3Y0JEgNQdIt45e9tDcziG.	Đào Phi Hoàng	USER	f	2026-01-07 04:06:44.962	2026-01-07 04:06:44.962	\N	\N	\N
08e4b7ee-549f-4548-b923-da1ad0b3f062	tuyetnhung.bui@gmail.com	$2b$10$UdHxFNw78vBZUco7Qd7w8eoJtPGR8Ek3Y0JEgNQdIt45e9tDcziG.	Bùi Tuyết Nhung	USER	t	2026-01-07 04:06:44.962	2026-01-07 04:06:44.962	\N	\N	\N
b7afb9d1-a5bd-4ff9-9db6-1638c6d5b1c0	caonhan_le@gmail.com	$2b$10$UdHxFNw78vBZUco7Qd7w8eoJtPGR8Ek3Y0JEgNQdIt45e9tDcziG.	Lê Cao Nhân	USER	f	2026-01-07 04:06:44.962	2026-01-07 04:06:44.962	239 Đỗ Oval	\N	\N
4a9f2db8-ea65-4056-a00c-5d60fa6c6afd	ngocngan.tang2@gmail.com	$2b$10$UdHxFNw78vBZUco7Qd7w8eoJtPGR8Ek3Y0JEgNQdIt45e9tDcziG.	Tăng Ngọc Ngạn	USER	t	2026-01-07 04:06:44.962	2026-01-07 04:06:44.962	\N	0790471023	\N
b3f4d3a3-4a58-4c8d-b838-e079d8e91d49	tuansy.trinh82@gmail.com	$2b$10$UdHxFNw78vBZUco7Qd7w8eoJtPGR8Ek3Y0JEgNQdIt45e9tDcziG.	Trịnh Tuấn Sỹ	USER	f	2026-01-07 04:06:44.962	2026-01-07 04:06:44.962	\N	\N	\N
add80722-95bd-4ac1-8329-76e4dce01b6d	thuongxuan_mai18@gmail.com	$2b$10$UdHxFNw78vBZUco7Qd7w8eoJtPGR8Ek3Y0JEgNQdIt45e9tDcziG.	Mai Thường Xuân	USER	f	2026-01-07 04:06:44.962	2026-01-07 04:06:44.962	5135 Lục Bình Loop	\N	\N
5a7e30c8-afba-4e82-afb6-8c9999e5c45e	huongtien_ly16@gmail.com	$2b$10$UdHxFNw78vBZUco7Qd7w8eoJtPGR8Ek3Y0JEgNQdIt45e9tDcziG.	Lý Hương Tiên	USER	f	2026-01-07 04:06:44.962	2026-01-07 04:06:44.962	9949 Trịnh Vista	0939185457	\N
2b2ca2ed-70a6-4c20-b794-b2a1b3a229c3	dahuong_phan@gmail.com	$2b$10$UdHxFNw78vBZUco7Qd7w8eoJtPGR8Ek3Y0JEgNQdIt45e9tDcziG.	Phan Dạ Hương	USER	f	2026-01-07 04:06:44.962	2026-01-07 04:06:44.962	\N	0038254436	\N
69a58920-9d2a-4499-9bbe-7c9dd25b4df3	thongtue_trinh@gmail.com	$2b$10$UdHxFNw78vBZUco7Qd7w8eoJtPGR8Ek3Y0JEgNQdIt45e9tDcziG.	Trịnh Thông Tuệ	USER	f	2026-01-07 04:06:44.962	2026-01-07 04:06:44.962	\N	0354462290	\N
f2947181-ddcb-404c-a0f3-0cd6e119f086	thuyhuong.ha@gmail.com	$2b$10$UdHxFNw78vBZUco7Qd7w8eoJtPGR8Ek3Y0JEgNQdIt45e9tDcziG.	Hà Thúy Hương	USER	t	2026-01-07 04:06:44.962	2026-01-24 01:50:40.616	791 Trịnh Cliff	0353301059	\N
c8f58d71-c696-4d8a-b785-e302527d42d1	bachcuc_phung14@gmail.com	$2b$10$UdHxFNw78vBZUco7Qd7w8eoJtPGR8Ek3Y0JEgNQdIt45e9tDcziG.	Phùng Bạch Cúc	USER	t	2026-01-07 04:06:44.962	2026-01-24 01:55:03.095	615 Sơn Hà Estate	0481135674	\N
af2dfc52-0e5e-400e-ae65-a9ffe58fbea5	diepanh.nguyen@gmail.com	$2b$10$UdHxFNw78vBZUco7Qd7w8eoJtPGR8Ek3Y0JEgNQdIt45e9tDcziG.	Nguyễn Diệp Anh	USER	t	2026-01-07 04:06:44.962	2026-01-24 01:55:07.485	8192 Đào Stream	0645876618	\N
fd0272d7-5cb5-4854-8170-7f9edc8b60af	xuanmai.ngo@gmail.com	$2b$10$UdHxFNw78vBZUco7Qd7w8eoJtPGR8Ek3Y0JEgNQdIt45e9tDcziG.	Ngô Xuân Mai	USER	t	2026-01-07 04:06:44.962	2026-01-24 02:55:29.024	\N	\N	\N
a3f1449b-c861-4637-9923-c3621e0e4b1f	huelan_le47@gmail.com	$2b$10$UdHxFNw78vBZUco7Qd7w8eoJtPGR8Ek3Y0JEgNQdIt45e9tDcziG.	Lê Huệ Lan	USER	t	2026-01-07 04:06:44.962	2026-01-31 11:07:13.106	6737 Quế Lâm Falls	12345678	http://localhost:5000/uploads/1769012310676-944293210.png
d14480c0-ed03-4e5d-86a1-53072605e78b	truccuong.ngo@gmail.com	$2b$10$UdHxFNw78vBZUco7Qd7w8eoJtPGR8Ek3Y0JEgNQdIt45e9tDcziG.	Ngô Trúc Cường	USER	t	2026-01-07 04:06:44.962	2026-01-28 14:18:07.807	Hồ Chí Minh	0111222333	http://localhost:5000/uploads/1768991880772-549422337.png
\.


--
-- Data for Name: Order; Type: TABLE DATA; Schema: public; Owner: postgresql
--

COPY public."Order" (id, "orderCode", "totalAmount", status, "createdAt", "updatedAt", "userId", note, "deliveryStatus", "deliveryAddress", phone) FROM stdin;
d9359691-de49-4f3d-89fc-9e0c42cc696d	1769697603351	1251000	PAID	2026-01-29 14:40:03.368	2026-01-29 14:40:30.336	d14480c0-ed03-4e5d-86a1-53072605e78b		ORDERED	Hồ Chí Minh	0111222333
b83c7c28-9135-49d3-9a13-cc1a2ee489e3	1769760164835	682000	PENDING	2026-01-30 08:02:44.843	2026-01-30 08:07:46.508	9ee7ec15-bc4e-4d01-904d-d14f48e4d2a3		PREPARING	53068 Trung Nhân Ways	0192513348
e81a4403-4ebf-47d8-9723-e716a162760c	1769763654948	195000	PENDING	2026-01-30 09:00:54.957	2026-01-30 09:00:54.957	a3f1449b-c861-4637-9923-c3621e0e4b1f		ORDERED	6737 Quế Lâm Falls	123456789
146fcdac-6d66-41ad-93ec-51addf4d2863	1769766528195	66000	PENDING	2026-01-30 09:48:48.196	2026-01-30 09:48:48.196	9ee7ec15-bc4e-4d01-904d-d14f48e4d2a3		ORDERED	53068 Trung Nhân Ways	0192513348
068fc5fd-be0c-4219-80d3-cca4fbf620ec	1769769834459	90550	PENDING	2026-01-30 10:43:54.466	2026-01-30 10:43:54.466	9ee7ec15-bc4e-4d01-904d-d14f48e4d2a3		ORDERED	Landmark 81	0192513348
e6570f70-e1f7-4ae9-8874-ed98247fb6dc	1769770665105	165000	PENDING	2026-01-30 10:57:45.106	2026-01-31 02:03:57.428	9ee7ec15-bc4e-4d01-904d-d14f48e4d2a3		CONFIRMED	6737 Quế Lâm Falls	0192513348
bff8f9fa-a379-48f8-b95e-c4b71b2e07c9	1769770258018	495000	PENDING	2026-01-30 10:50:58.02	2026-01-31 02:04:02.65	9ee7ec15-bc4e-4d01-904d-d14f48e4d2a3		SHIPPING	53068 Trung Nhân Ways	0192513348
9b962855-8111-450b-a99b-e90f81f48285	1769826546828	768000	PENDING	2026-01-31 02:29:06.834	2026-01-31 02:29:06.834	d14480c0-ed03-4e5d-86a1-53072605e78b		ORDERED	Hồ Chí Minh	0111222333
7d286f8a-4921-454a-bc61-4bb20f528d2f	1769827230033	67500	PENDING	2026-01-31 02:40:30.034	2026-01-31 02:40:30.034	d14480c0-ed03-4e5d-86a1-53072605e78b		ORDERED	Hồ Chí Minh	0111222333
aa6449d8-0eed-4767-a3b0-412aa6eabad5	1769827580291	123000	PENDING	2026-01-31 02:46:20.292	2026-01-31 02:46:20.292	d14480c0-ed03-4e5d-86a1-53072605e78b		ORDERED	Hồ Chí Minh	0111222333
c4571324-93f6-4e01-95f7-af697db80bd1	1769855348899	126400	PAID	2026-01-31 10:29:08.907	2026-01-31 10:29:36.993	a3f1449b-c861-4637-9923-c3621e0e4b1f		ORDERED	6737 Quế Lâm Falls	0333667
4b1a26f2-22fe-4da2-95c2-f1149499a95f	1769856939062	156000	PENDING	2026-01-31 10:55:39.064	2026-01-31 10:55:39.064	a3f1449b-c861-4637-9923-c3621e0e4b1f		ORDERED	6737 Quế Lâm Falls	123456789
aa4f13d5-3c3b-4b09-ba0d-166722166bf0	1769857085073	87000	PENDING	2026-01-31 10:58:05.074	2026-01-31 10:58:05.074	a3f1449b-c861-4637-9923-c3621e0e4b1f		ORDERED	6737 Quế Lâm Falls	12345678
af7cb15e-9f4a-48cb-a48f-ad759aa14ede	1769858814309	90000	PAID	2026-01-31 11:26:54.317	2026-01-31 11:27:23.431	a3f1449b-c861-4637-9923-c3621e0e4b1f		ORDERED	6737 Quế Lâm Falls	12345678
6809305a-1a24-4ae1-9565-3b3ca296826b	1769697672071	970000	PENDING	2026-01-29 14:41:12.073	2026-01-30 02:00:56.347	a3f1449b-c861-4637-9923-c3621e0e4b1f		CONFIRMED	6737 Quế Lâm Falls	12345678
fcbc7b9f-8468-47be-a1e2-7cbc7b4e4ffc	1769762122432	970000	PAID	2026-01-30 08:35:22.442	2026-01-30 08:35:48.684	9ee7ec15-bc4e-4d01-904d-d14f48e4d2a3	Giao giờ hành chính	ORDERED	Hồ Chí Minh	0192513348
964e5b02-f569-4d4c-8500-dc32cdd8f2de	1769766485769	138000	PENDING	2026-01-30 09:48:05.776	2026-01-30 09:48:05.776	9ee7ec15-bc4e-4d01-904d-d14f48e4d2a3		ORDERED	8958 Minh Tú Fork	0192513348
41dece2b-0e29-45e6-8ed1-5486b995a934	1769770158426	192000	PENDING	2026-01-30 10:49:18.428	2026-01-30 10:49:18.428	9ee7ec15-bc4e-4d01-904d-d14f48e4d2a3		ORDERED	6737 Quế Lâm Falls	0192513348
69196212-5c92-4ceb-9459-4fa71ad802b7	1769770885712	327000	PENDING	2026-01-30 11:01:25.713	2026-01-31 02:03:55.348	9ee7ec15-bc4e-4d01-904d-d14f48e4d2a3		CONFIRMED	6737 Quế Lâm Falls	0192513348
62a78853-79c8-4d8e-b237-5082f855625a	1769770551063	156000	PENDING	2026-01-30 10:55:51.064	2026-01-31 02:03:59.901	9ee7ec15-bc4e-4d01-904d-d14f48e4d2a3		DELIVERED	6737 Quế Lâm Falls	0192513348
1235976d-83da-41cc-a125-bb45c46418da	1769766699667	123000	PENDING	2026-01-30 09:51:39.668	2026-01-31 02:04:06.74	9ee7ec15-bc4e-4d01-904d-d14f48e4d2a3		SHIPPING	6737 Quế Lâm Falls	0192513348
765863f9-369d-45e3-9fc8-f97cd2c3cc8a	1769826638915	67500	PENDING	2026-01-31 02:30:38.916	2026-01-31 02:30:38.916	d14480c0-ed03-4e5d-86a1-53072605e78b		ORDERED	Hồ Chí Minh	0111222333
c1d6d724-19ef-41da-a4d9-93c51031a9e4	1769827260855	136500	PENDING	2026-01-31 02:41:00.856	2026-01-31 02:41:00.856	d14480c0-ed03-4e5d-86a1-53072605e78b		ORDERED	Hồ Chí Minh	0111222333
fb917b7c-c3f2-4612-9cff-1c15a2244002	1769833825879	192000	PENDING	2026-01-31 04:30:25.886	2026-01-31 04:30:25.886	a3f1449b-c861-4637-9923-c3621e0e4b1f		ORDERED	6737 Quế Lâm Falls	12345678
64f8196f-ecd7-435f-8b65-3cb9a560c5b0	1769855491282	225000	PAID	2026-01-31 10:31:31.283	2026-01-31 10:32:02.494	d14480c0-ed03-4e5d-86a1-53072605e78b		ORDERED	Hồ Chí Minh	0111222333
6cafd2f5-0d9f-41ed-9a98-e8106090696a	1769857633117	198000	PENDING	2026-01-31 11:07:13.125	2026-01-31 11:07:13.125	a3f1449b-c861-4637-9923-c3621e0e4b1f		ORDERED	6737 Quế Lâm Falls	12345678
\.


--
-- Data for Name: Product; Type: TABLE DATA; Schema: public; Owner: postgresql
--

COPY public."Product" (id, name, sku, price, description, "isActive", "categoryId", "createdAt", "updatedAt", "imagesUrl", slug, stock, "ratingAvg", "ratingCount", "soldCount") FROM stdin;
f5ce71be-353e-4933-89c0-6653d3e9f3d0	Bánh chuối hạt dinh dưỡng	SKU-UDQWFJ	39000	Bánh chuối vị Socola	t	cb8192f2-7ddb-4611-8cf6-6c22aae6a534	2026-01-12 04:06:12.821	2026-01-19 04:57:10.554	{http://localhost:5000/uploads/1768190771809-978727161.png}	banh-chuoi-hat-dinh-duong	10	0	0	0
830b506d-b5a3-4aa4-9246-c5a01d7f357d	Bánh gạo chà bông JinJu Richy	SKU-OL4N9Q	39900	Gói 168g	t	cb8192f2-7ddb-4611-8cf6-6c22aae6a534	2026-01-12 11:26:43.284	2026-01-31 10:29:08.921	{http://localhost:5000/uploads/1768217201817-848963933.jpg}	banh-gao-cha-bong-jinju-richy	185	4	3	0
6f3df853-178a-493c-8cad-e8a68e245ba9	Bánh gạo Hàn Quốc Richy	SKU-EL2Z0Y	41000	Gói 303g	t	cb8192f2-7ddb-4611-8cf6-6c22aae6a534	2026-01-12 11:24:16.762	2026-01-31 11:07:13.133	{http://localhost:5000/uploads/1768217055595-198380405.jpg}	banh-gao-han-quoc-richy	107	0	0	0
8c4a6223-e86a-471f-aae5-0487c7d06bda	Khô bò xé Hải Châu	SKU-RQDCEV	119000	Hũ 100g	t	cb8192f2-7ddb-4611-8cf6-6c22aae6a534	2026-01-12 07:20:18.561	2026-01-30 08:02:44.863	{http://localhost:5000/uploads/1768202383486-941420044.jpg}	kho-bo-xe-hai-chau	38	0	0	0
d9bd9a8c-5aed-4255-ac7a-36c7db86ad7f	Cà phê đen	SKU-R1MMYP	30000	Cà phê đen không đường	t	7ca58ff4-6b27-44b8-a83d-4be20d95a1cd	2026-01-12 03:34:34.451	2026-01-31 11:26:54.324	{http://localhost:5000/uploads/1768188872730-487161490.jpg}	ca-phe-den-mau-1	94	5	1	0
8ece4d0d-6ca0-4d4c-b731-07387eedc8a9	Bánh Tiramisu	SKU-ZUQA3G	45500	Bánh ngọt lạnh	t	460b0ebd-98a8-4cdc-b995-75a86b321511	2026-01-12 03:30:34.375	2026-01-31 02:41:00.863	{http://localhost:5000/uploads/1768188632898-356659879.png}	banh-tiramisu-mau-1	96	0	0	0
fd2c00be-1600-403e-8602-05600d301a83	Bánh tráng khô bò Vi	SKU-1ST7SQ	22000	Gói 55g	t	cb8192f2-7ddb-4611-8cf6-6c22aae6a534	2026-01-12 07:21:37.808	2026-01-30 09:48:48.201	{http://localhost:5000/uploads/1768202496783-617604854.jpg}	banh-trang-kho-bo-vi	111	0	0	0
6c32938e-6ab2-4158-ac79-d8e55b4ba883	Bánh quy nougat kem sữa Richy Kenju	SKU-SEJI3E	46000	Gói 186g	t	cb8192f2-7ddb-4611-8cf6-6c22aae6a534	2026-01-12 11:25:55.314	2026-01-27 04:16:59.549	{http://localhost:5000/uploads/1768217153671-309965900.jpg}	banh-quy-nougat-kem-sua-richy-kenju	90	0	0	0
00bcd6a5-cd01-45ab-8a84-1af5984d0e94	Cà phê Đà Lạt	SKU-97W6N3	35550	Cà phê Arabica Đà Lạt đậm đà hoà quyện cùng kem whipping thơm ngậy.	t	7ca58ff4-6b27-44b8-a83d-4be20d95a1cd	2026-01-12 11:31:32.549	2026-01-30 10:43:54.475	{http://localhost:5000/uploads/1768217491522-405899145.jpg}	ca-phe-da-lat	87	4.5	2	0
bb76bda1-0e80-4005-a5f6-1c49b68bce7a	Cà phê nâu đặc biệt	SKU-LS00FY	25000	Vị nguyên bản của cà phê	t	7ca58ff4-6b27-44b8-a83d-4be20d95a1cd	2026-01-12 03:56:53.115	2026-01-30 10:43:54.48	{http://localhost:5000/uploads/1768190209359-825797487.jpg}	ca-phe-nau-dac-biet	48	0	0	0
7c879a78-4b81-4b57-b9da-6d3f4019e3ef	Bánh kem ốc quế vị sô cô la Pororo	SKU-E6FJMH	64000	Hộp 54g	t	cb8192f2-7ddb-4611-8cf6-6c22aae6a534	2026-01-12 11:27:36.027	2026-01-31 10:29:08.915	{http://localhost:5000/uploads/1768217255226-114193266.jpg}	banh-kem-oc-que-vi-so-co-la-pororo	169	3	3	0
7d4097a8-4981-49ac-a61c-8836709ca8d7	Bánh gạo An vị tự nhiên Orion	SKU-D7SV1V	22500	Gói 151.2g	t	cb8192f2-7ddb-4611-8cf6-6c22aae6a534	2026-01-12 11:28:19.254	2026-01-31 10:29:08.918	{http://localhost:5000/uploads/1768217278721-360001158.jpg}	banh-gao-an-vi-tu-nhien-orion	185	4.3	3	0
0abf7597-6c23-481e-9f27-8f226906f61d	Bạc sỉu vị Vani	SKU-Z4LOO2	30000	(Có sẵn Thạch) Vị chua nhẹ tự nhiên của hạt Arabica Lạc Dương & Robusta Lâm Hà, hoà quyện cùng Vani Tự Nhiên, Thạch Xỉu Vani mềm mượt và Sữa Tươi Thanh Trùng đem đến hương vị đậm mượt đầy tinh tế.	t	7ca58ff4-6b27-44b8-a83d-4be20d95a1cd	2026-01-12 11:30:18.072	2026-01-23 05:15:11.129	{http://localhost:5000/uploads/1768217410171-921576460.jpg}	bac-siu-vi-vani	0	4	3	3
9c75a5b6-b8e7-4011-bec5-70c4fca2567c	Bánh quy yến mạch mix 3 vị Quaker	SKU-QGJXWD	109000	Hộp thiếc (3g)	t	cb8192f2-7ddb-4611-8cf6-6c22aae6a534	2026-01-12 11:13:56.658	2026-01-30 11:01:25.718	{http://localhost:5000/uploads/1768216434480-806957610.jpg}	banh-quy-yen-mach-mix-3-vi-quaker	82	0	0	0
3d24a690-6ae8-4f35-9cbe-6e5cc69aa804	Bánh quy Petit Beurre Lu	SKU-DID84P	256000	Hộp 600g	t	cb8192f2-7ddb-4611-8cf6-6c22aae6a534	2026-01-12 11:16:08.506	2026-01-31 02:29:06.844	{http://localhost:5000/uploads/1768216563641-965468031.jpg}	banh-quy-petit-beurre-lu	87	0	0	0
d3a3e4be-4b14-4041-a663-55b353aa7ef5	BAD F1 JERSEY	SKU-4DUC9W	420000	•Thiết kế: form oversize hiện đại, màu sắc phối hài hòa, phù hợp cho mọi outfit từ casual đến sporty.\n\nChất liệu: Vải mè cao cấp, thoáng khí, giúp bạn luôn thoải mái khi mặc.\n\nKỹ thuật: In lụa sắc nét kết hợp với patch thêu và ép cao thành, tạo hiệu ứng nổi bật và bền bỉ theo thời gian.	t	c529266e-7706-4809-b784-cfcb81596e20	2026-01-12 07:32:49.446	2026-01-30 08:35:22.451	{http://localhost:5000/uploads/1768203167251-334553119.jpg}	bad-f1-jersey	14	5	1	0
c2847fe7-ff94-4b8a-b1b0-9de05d9d0cc9	SUPERTRAMP MULTI-POCKET SHORTS	SKU-VAVADN	550000	Được phát triển từ tinh thần outdoor trekking, thiết kế này tập trung vào tính ứng dụng cao, phom dáng gọn gàng và chất liệu bền bỉ. SUPERTRAMP MULTI-POCKET SHORTS là lựa chọn không thể thiếu trong hành trang của những kẻ nghiện dịch chuyển.\n\n- Form dáng: Oversize\n- Chất liệu: Dù 100% nylon\n- Kỹ thuật: Hệ thống túi chuyên dụng, hệ thống thoáng khí, patch logo kết hợp in cao thành	t	c529266e-7706-4809-b784-cfcb81596e20	2026-01-12 07:33:47.12	2026-01-30 08:35:22.455	{http://localhost:5000/uploads/1768203225384-731602653.jpg}	supertramp-multi-pocket-shorts	24	4.3	3	1
a143eb0d-f88a-4714-8422-0fd64412e9b2	Bánh Choco Pie Orion	SKU-01K9DG	52000	Hộp 33g x 12 gói	t	cb8192f2-7ddb-4611-8cf6-6c22aae6a534	2026-01-12 11:15:12.712	2026-01-31 10:55:39.07	{http://localhost:5000/uploads/1768216511180-881893158.jpg}	banh-choco-pie-orion	81	0	0	3
503bc40b-a82f-4c51-a7d2-a85738e2ea9a	Bánh quy Kenju rau củ Richy	SKU-7RRCX0	46000	Gói 192g	t	cb8192f2-7ddb-4611-8cf6-6c22aae6a534	2026-01-12 11:20:02.247	2026-01-30 09:48:05.785	{http://localhost:5000/uploads/1768216800820-728930129.jpg}	banh-quy-kenju-rau-cu-richy	494	5	1	0
3ad8ce5f-5226-4e41-b2ff-26418022a523	Bánh gạo An vị tảo biển Orion	SKU-ZY7Y7V	22500	Gói 111.3g	t	cb8192f2-7ddb-4611-8cf6-6c22aae6a534	2026-01-12 11:17:59.213	2026-01-31 02:40:30.037	{http://localhost:5000/uploads/1768216676541-314478669.jpg}	banh-gao-an-vi-tao-bien-orion	5	0	0	0
b97aae67-431a-4ca4-a59d-f42de7a5a78a	Bánh gạo cuộn vị phô mai Want Want	SKU-T6OA8R	29000	Gói 170g	t	cb8192f2-7ddb-4611-8cf6-6c22aae6a534	2026-01-12 11:21:14.804	2026-01-31 10:58:05.081	{http://localhost:5000/uploads/1768216847062-532398150.jpg}	banh-gao-cuon-vi-pho-mai-want-want	393	5	2	0
bb4270d7-0796-486c-9368-906b32d3438c	Bánh trứng muối Sheng Tian	SKU-NBFW1F	75000	Gói 180g	t	cb8192f2-7ddb-4611-8cf6-6c22aae6a534	2026-01-12 11:23:33.536	2026-01-31 11:07:13.136	{http://localhost:5000/uploads/1768217012537-77428079.jpg}	banh-trung-muoi-sheng-tian	86	0	0	0
01a527db-a675-416d-9c1f-5f0ceb5bb08a	Thịt bò tơ Fohla	SKU-TRVCLX	89900	Khay 200g	t	488c4285-9071-4ddd-915a-7a46fac093b5	2026-01-19 04:41:39.018	2026-01-28 11:40:38.776	{http://localhost:5000/uploads/1768797697791-63118460.jpg}	thit-bo-to-fohla	185	0	0	3
368eca33-d24c-46fc-9109-6e8c24e2195a	Bắp hoa bò Úc cắt lát Freshfoco	SKU-2EBAME	99900	Khay 175g	t	488c4285-9071-4ddd-915a-7a46fac093b5	2026-01-19 04:40:46.945	2026-01-28 11:40:38.781	{http://localhost:5000/uploads/1768797644981-214166711.jpg}	bap-hoa-bo-uc-cat-lat-freshfoco	90	0	0	5
44808874-2789-4e32-a215-7ea6ab3ec556	Bánh gạo Nhật vị shouyu mật ong Ichi	SKU-91BTB5	40000	Gói 180g	t	cb8192f2-7ddb-4611-8cf6-6c22aae6a534	2026-01-12 11:22:03.819	2026-01-28 13:09:43.397	{http://localhost:5000/uploads/1768216922909-332419801.jpg}	banh-gao-nhat-vi-shouyu-mat-ong-ichi	289	0	0	0
27cc074c-8684-4b0e-843a-bf82fd542fc7	CROSS CUT POLO / Black-Grey Color	SKU-2E462F	165000	‼️LƯU Ý ▪️Khi giặt sản phẩm bằng tay: Vui lòng hoà tan kĩ nước giặt, bột giặt với nước sau đó mới cho sản phẩm vào. ▪️Khi giặt sản phẩm bằng máy giặt: Vui lòng đổ nước giặt, bột giặt vào khay của máy.\n\n 🚫TUYỆT ĐỐI KHÔNG đổ nước giặt, bột giặt trực tiếp vào sản phẩm. Như vậy sẽ ảnh hưởng đến màu sắc của sản phẩm và làm cho áo có tình trạng loang màu. Shop xin cảm ơn ạ🖤\n\n🔹 Chính sách đổi trả Shop.\n– Miễn phí đổi hàng cho khách mua ở Shop trong trường hợp bị lỗi từ nhà sản xuất, giao nhầm hàng, nhầm size.\n- Quay video mở sản phẩm khi nhận hàng, nếu không có video unbox, khi phát hiện lỗi phải báo ngay cho Shop trong 1 ngày tính từ ngày giao hàng thành công. Qua 1 ngày chúng mình không giải quyết khi không có video unbox.\n– Sản phẩm đổi trong thời gian 3 ngày kể từ ngày nhận hàng\n– Sản phẩm còn mới nguyên tem, tags, sản phẩm chưa giặt và không dơ bẩn, hư hỏng bởi những tác nhân bên ngoài cửa hàng sau khi mua hàng.\n👉 Đặc biệt:\n– Tất cả sản phẩm ver 3.0 sẽ được hỗ trợ trả hàng hoàn tiền trong vòng 05 ngày kể từ ngày nhận hàng nếu có trải nghiệm không tốt, không hài lòng về sản phẩm\n– Chấp nhận trả hàng hoàn tiền với sản phẩm đã qua sử dụng, không còn nguyên tag tuy nhiên sản phẩm phải còn nguyên vẹn, không bị rách, bung chỉ, bạc màu do quá trình sử dụng	t	c529266e-7706-4809-b784-cfcb81596e20	2026-01-12 07:25:16.36	2026-01-30 10:57:45.11	{http://localhost:5000/uploads/1768202715044-201063080.jpg,http://localhost:5000/uploads/1768230041491-77062467.jpg,http://localhost:5000/uploads/1768230041503-552863892.jpg}	cross-cut-polo-black-grey-color	94	0	0	1
4e553107-51fd-4697-87f1-c8c17d33ac8e	Monster Energy Vị Nguyên Bản	SKU-8QIB10	29000	🧃 Monster Energy — Nước tăng lực năng lượng mạnh mẽ\n\nMonster Energy là một thương hiệu nước tăng lực carbonat được sản xuất bởi Monster Beverage Corporation (Mỹ), ra mắt lần đầu vào năm 2002.\n\n🔥 Mô tả chung\n\nĐây là một loại nước tăng lực có hàm lượng caffeine cao, được pha với nhiều thành phần khác nhằm tăng cường tỉnh táo và năng lượng cho cơ thể khi mệt mỏi hoặc cần tập trung.\n\nSản phẩm thường được đóng trong lon 500 ml (tại nhiều thị trường) với thiết kế đồ họa mạnh mẽ, nổi bật và cá tính.\n\n🌟 Thành phần chính\n\nNước có ga\n\nCaffeine — chất kích thích giúp tỉnh táo, giảm mệt mỏi\n\nTaurine, L-Carnitine, Glucuronolactone, Inositol — các hợp chất thường thấy trong nước tăng lực\n\nVitamin nhóm B (B2, B3, B6, B12) — hỗ trợ chuyển hóa năng lượng\n\nHương liệu tự nhiên / tổng hợp, đường hoặc không đường tùy loại\n(Ghi chú: thành phần có thể khác nhau theo từng dòng sản phẩm và từng thị trường).\n\n💥 Công dụng chính\n\nTăng cường năng lượng nhanh khi bạn cần tỉnh táo.\n\nHỗ trợ tập trung và giảm mệt mỏi trong học tập, làm việc, lái xe, chơi game hoặc trước buổi tập thể thao.\n\nDòng sản phẩm có cả phiên bản không đường (Zero Sugar / Ultra) phù hợp với người muốn giảm lượng calo.\n\n🍹 Các dòng phổ biến\n\nMonster không chỉ có một hương vị:\n\nMonster Original — vị đặc trưng ngọt-mặn nhẹ, tinh thần “Unleash the Beast!”.\n\nZero Sugar / Ultra — không đường, hương nhẹ dễ uống.\n\nJuice Monster — kết hợp hương trái cây (ví dụ: Mango Loco vị xoài).\n\nJava Monster — pha cà phê + năng lượng.\n…và nhiều hương vị khác trên toàn cầu.\n\n⚠️ Lưu ý khi sử dụng\n\nSản phẩm có hàm lượng caffeine cao, không nên dùng quá liều trong ngày.\n\nKhông khuyến nghị cho phụ nữ mang thai, trẻ em, người mẫn cảm với caffeine.\n\nNên uống lạnh để cảm nhận hương vị tốt nhất.	t	286631c0-b3b3-4055-8b3f-b8a3b0637648	2026-01-12 04:09:35.426	2026-01-30 08:02:44.868	{http://localhost:5000/uploads/1768190973801-170466901.png,http://localhost:5000/uploads/1768193416980-425570219.png}	monster-energy-vi-nguyen-ban	243	0	0	0
\.


--
-- Data for Name: OrderItem; Type: TABLE DATA; Schema: public; Owner: postgresql
--

COPY public."OrderItem" (id, "orderId", "productId", quantity, price) FROM stdin;
4eec3686-c7c7-4b50-ab7a-3123727cad6f	d9359691-de49-4f3d-89fc-9e0c42cc696d	a143eb0d-f88a-4714-8422-0fd64412e9b2	3	52000
a6a155a5-8019-4653-8485-b14fa700626c	d9359691-de49-4f3d-89fc-9e0c42cc696d	9c75a5b6-b8e7-4011-bec5-70c4fca2567c	3	109000
1fd2f8cc-2111-4779-a782-757a35c26a80	d9359691-de49-4f3d-89fc-9e0c42cc696d	3d24a690-6ae8-4f35-9cbe-6e5cc69aa804	3	256000
39709b3f-f0fd-4292-ab7a-d4fda58ecb99	6809305a-1a24-4ae1-9565-3b3ca296826b	d3a3e4be-4b14-4041-a663-55b353aa7ef5	1	420000
6e08df92-d39e-49b9-9842-c9f83cd76185	6809305a-1a24-4ae1-9565-3b3ca296826b	c2847fe7-ff94-4b8a-b1b0-9de05d9d0cc9	1	550000
7738f2a3-6fba-4c1d-a9f5-fdd210227d4f	b83c7c28-9135-49d3-9a13-cc1a2ee489e3	a143eb0d-f88a-4714-8422-0fd64412e9b2	3	52000
4fbfe6e8-a533-47ca-b710-9336cd689baa	b83c7c28-9135-49d3-9a13-cc1a2ee489e3	9c75a5b6-b8e7-4011-bec5-70c4fca2567c	3	109000
949b3815-fde9-45af-a607-9f9f2a1c589d	b83c7c28-9135-49d3-9a13-cc1a2ee489e3	fd2c00be-1600-403e-8602-05600d301a83	1	22000
4a5b08be-6dba-44df-8209-967ce98e6413	b83c7c28-9135-49d3-9a13-cc1a2ee489e3	8c4a6223-e86a-471f-aae5-0487c7d06bda	1	119000
117e2df3-8853-4edc-9e2a-7b59af336520	b83c7c28-9135-49d3-9a13-cc1a2ee489e3	4e553107-51fd-4697-87f1-c8c17d33ac8e	2	29000
f612edac-2911-4107-8d3b-ee67b71cc770	fcbc7b9f-8468-47be-a1e2-7cbc7b4e4ffc	d3a3e4be-4b14-4041-a663-55b353aa7ef5	1	420000
fc274ac8-fc07-4d15-87df-cf692bc2ff9c	fcbc7b9f-8468-47be-a1e2-7cbc7b4e4ffc	c2847fe7-ff94-4b8a-b1b0-9de05d9d0cc9	1	550000
db5f94ce-ff99-4341-92c6-6047074e1ae4	e81a4403-4ebf-47d8-9723-e716a162760c	7c879a78-4b81-4b57-b9da-6d3f4019e3ef	1	64000
b67c193e-4f38-42c0-b35b-2526e662dd11	e81a4403-4ebf-47d8-9723-e716a162760c	9c75a5b6-b8e7-4011-bec5-70c4fca2567c	1	109000
fe5014a5-8bd2-4860-acf2-13236f20d17b	e81a4403-4ebf-47d8-9723-e716a162760c	fd2c00be-1600-403e-8602-05600d301a83	1	22000
f42f72ff-5a6b-4f55-a32f-a537266cdabc	964e5b02-f569-4d4c-8500-dc32cdd8f2de	503bc40b-a82f-4c51-a7d2-a85738e2ea9a	3	46000
2f6acf3e-c49b-42ab-8aea-fd908cc24098	146fcdac-6d66-41ad-93ec-51addf4d2863	fd2c00be-1600-403e-8602-05600d301a83	3	22000
86f105b2-45d3-48a8-a874-39b029015d7d	1235976d-83da-41cc-a125-bb45c46418da	6f3df853-178a-493c-8cad-e8a68e245ba9	3	41000
a0954b66-7773-4c70-9914-4132e7b32a12	068fc5fd-be0c-4219-80d3-cca4fbf620ec	00bcd6a5-cd01-45ab-8a84-1af5984d0e94	1	35550
9f1cf968-daa6-4931-85d3-e2177aef5bf5	068fc5fd-be0c-4219-80d3-cca4fbf620ec	d9bd9a8c-5aed-4255-ac7a-36c7db86ad7f	1	30000
0b7b7daa-0eba-4311-844c-5de5281ce9dc	068fc5fd-be0c-4219-80d3-cca4fbf620ec	bb76bda1-0e80-4005-a5f6-1c49b68bce7a	1	25000
62d59be6-263b-4269-82da-90c414d6902b	41dece2b-0e29-45e6-8ed1-5486b995a934	7c879a78-4b81-4b57-b9da-6d3f4019e3ef	3	64000
c75006c8-37dd-427f-b25e-990a50eed220	bff8f9fa-a379-48f8-b95e-c4b71b2e07c9	27cc074c-8684-4b0e-843a-bf82fd542fc7	3	165000
3c295df1-6fe2-42a2-9a57-15ab0d5c8fa9	62a78853-79c8-4d8e-b237-5082f855625a	a143eb0d-f88a-4714-8422-0fd64412e9b2	3	52000
2f9f62ff-93c3-4094-b1ab-7fd423a74197	e6570f70-e1f7-4ae9-8874-ed98247fb6dc	27cc074c-8684-4b0e-843a-bf82fd542fc7	1	165000
56746f7d-5573-4f89-a7af-dd8af3bed3e5	69196212-5c92-4ceb-9459-4fa71ad802b7	9c75a5b6-b8e7-4011-bec5-70c4fca2567c	3	109000
8b8d09c9-7a9d-4b7d-bba2-cbe1a6679101	9b962855-8111-450b-a99b-e90f81f48285	3d24a690-6ae8-4f35-9cbe-6e5cc69aa804	3	256000
2657cb09-1022-4e15-a667-7bae8a84d2bc	765863f9-369d-45e3-9fc8-f97cd2c3cc8a	7d4097a8-4981-49ac-a61c-8836709ca8d7	3	22500
a544fbb9-152b-46fd-a4f4-4441cbce1c12	7d286f8a-4921-454a-bc61-4bb20f528d2f	3ad8ce5f-5226-4e41-b2ff-26418022a523	3	22500
2e57fe04-0cf7-4158-bb00-7ac2928d71b0	c1d6d724-19ef-41da-a4d9-93c51031a9e4	8ece4d0d-6ca0-4d4c-b731-07387eedc8a9	3	45500
f158ed63-bc7a-4d74-ae32-e853c64d4e9e	aa6449d8-0eed-4767-a3b0-412aa6eabad5	6f3df853-178a-493c-8cad-e8a68e245ba9	3	41000
e3747e28-88fd-4a15-8e35-e17f201f1b01	fb917b7c-c3f2-4612-9cff-1c15a2244002	7c879a78-4b81-4b57-b9da-6d3f4019e3ef	3	64000
b103e155-cf87-4a9c-a92f-81dea4583bca	c4571324-93f6-4e01-95f7-af697db80bd1	7c879a78-4b81-4b57-b9da-6d3f4019e3ef	1	64000
e913ead7-68c9-43bf-9321-273de231900c	c4571324-93f6-4e01-95f7-af697db80bd1	7d4097a8-4981-49ac-a61c-8836709ca8d7	1	22500
dbbb57e5-b718-4000-9e5a-65ab1900e206	c4571324-93f6-4e01-95f7-af697db80bd1	830b506d-b5a3-4aa4-9246-c5a01d7f357d	1	39900
ef993bce-3d32-4f07-bd31-ca65a52d00cc	64f8196f-ecd7-435f-8b65-3cb9a560c5b0	bb4270d7-0796-486c-9368-906b32d3438c	3	75000
b96bc4e1-2e22-44de-ba7e-a5e5f2585d7c	4b1a26f2-22fe-4da2-95c2-f1149499a95f	a143eb0d-f88a-4714-8422-0fd64412e9b2	3	52000
64fe0e95-d91f-44a7-b2c1-cc30480b664a	aa4f13d5-3c3b-4b09-ba0d-166722166bf0	b97aae67-431a-4ca4-a59d-f42de7a5a78a	3	29000
101ca9ef-dfe4-4427-8faa-ad683ede1985	6cafd2f5-0d9f-41ed-9a98-e8106090696a	6f3df853-178a-493c-8cad-e8a68e245ba9	3	41000
3dc28348-e599-4347-a958-f2d209198d36	6cafd2f5-0d9f-41ed-9a98-e8106090696a	bb4270d7-0796-486c-9368-906b32d3438c	1	75000
192e3be8-7f2d-4bed-bdf2-227d103abb78	af7cb15e-9f4a-48cb-a48f-ad759aa14ede	d9bd9a8c-5aed-4255-ac7a-36c7db86ad7f	3	30000
\.


--
-- Data for Name: Payment; Type: TABLE DATA; Schema: public; Owner: postgresql
--

COPY public."Payment" (id, "orderId", amount, method, "paidAt") FROM stdin;
7650ff52-849d-405d-9a35-29de83e9ff51	964e5b02-f569-4d4c-8500-dc32cdd8f2de	138000	COD	2026-01-30 09:48:05.788
9d43cebd-7301-4206-a306-77346ae56e3a	146fcdac-6d66-41ad-93ec-51addf4d2863	66000	COD	2026-01-30 09:48:48.203
1ae0062f-4952-4e02-b50b-605bce266f74	1235976d-83da-41cc-a125-bb45c46418da	123000	COD	2026-01-30 09:51:39.677
1274a6a9-344c-4499-abe7-b6af4dcdb2ba	d9359691-de49-4f3d-89fc-9e0c42cc696d	1251000	VNPAY	2026-01-29 14:40:30.339
5c0af204-3a8b-4662-bc07-e093d6cead03	6809305a-1a24-4ae1-9565-3b3ca296826b	970000	COD	2026-01-29 14:41:12.086
80d13643-9c5a-4e04-a75f-82c6a25ae94c	b83c7c28-9135-49d3-9a13-cc1a2ee489e3	682000	COD	2026-01-30 08:02:44.873
7b89e2cc-70be-47dd-8373-14d95d97dfa8	fcbc7b9f-8468-47be-a1e2-7cbc7b4e4ffc	970000	VNPAY	2026-01-30 08:35:48.686
6404d86f-4506-491a-baf4-f4977d193486	e81a4403-4ebf-47d8-9723-e716a162760c	195000	COD	2026-01-30 09:00:54.974
8553ffa3-8d2a-45d2-8b25-a3e886c85c22	068fc5fd-be0c-4219-80d3-cca4fbf620ec	90550	COD	2026-01-30 10:43:54.481
14cd3cb4-8e82-4eb1-96b4-c4122290e67e	41dece2b-0e29-45e6-8ed1-5486b995a934	192000	COD	2026-01-30 10:49:18.435
1059fa74-b233-423b-91c6-7aac37b13512	bff8f9fa-a379-48f8-b95e-c4b71b2e07c9	495000	COD	2026-01-30 10:50:58.028
dfdcdd01-0095-412f-9be4-a5fe0c56fa81	62a78853-79c8-4d8e-b237-5082f855625a	156000	COD	2026-01-30 10:55:51.07
f0dee18d-b964-483e-8d67-7c7bd351163d	e6570f70-e1f7-4ae9-8874-ed98247fb6dc	165000	COD	2026-01-30 10:57:45.112
635e2ead-060f-4121-8d7d-9bdd60d9b05f	69196212-5c92-4ceb-9459-4fa71ad802b7	327000	COD	2026-01-30 11:01:25.719
46a3c95d-df0b-4ff8-9bd7-6d282a7d72d8	9b962855-8111-450b-a99b-e90f81f48285	768000	COD	2026-01-31 02:29:06.846
c19fcb01-0a69-4271-96cd-1f65c3d0176c	765863f9-369d-45e3-9fc8-f97cd2c3cc8a	67500	COD	2026-01-31 02:30:38.924
c6555049-5b2e-497c-9a75-536eab258a0d	7d286f8a-4921-454a-bc61-4bb20f528d2f	67500	COD	2026-01-31 02:40:30.039
16d72dca-e12b-4420-b58f-592d9e468c90	c1d6d724-19ef-41da-a4d9-93c51031a9e4	136500	COD	2026-01-31 02:41:00.864
a74331fb-83e8-4b79-a6ef-60b73a874736	aa6449d8-0eed-4767-a3b0-412aa6eabad5	123000	COD	2026-01-31 02:46:20.3
da5dcc97-e253-464d-af8c-e8be1183c1e5	fb917b7c-c3f2-4612-9cff-1c15a2244002	192000	COD	2026-01-31 04:30:25.897
0d3e263b-6c09-498a-97c4-ce04ae38bce7	c4571324-93f6-4e01-95f7-af697db80bd1	126400	VNPAY	2026-01-31 10:29:36.995
4936116e-4c26-45a9-a7a1-035e74cda068	64f8196f-ecd7-435f-8b65-3cb9a560c5b0	225000	VNPAY	2026-01-31 10:32:02.497
787c7d5e-c1a8-4188-b3dc-ba9b9bf8c5a1	4b1a26f2-22fe-4da2-95c2-f1149499a95f	156000	COD	2026-01-31 10:55:39.072
2a7e4dc5-78f3-4d84-9d5a-6610bf648395	aa4f13d5-3c3b-4b09-ba0d-166722166bf0	87000	COD	2026-01-31 10:58:05.083
908eb7a4-662c-43d9-81a6-213b8fccac01	6cafd2f5-0d9f-41ed-9a98-e8106090696a	198000	COD	2026-01-31 11:07:13.138
01400b5b-d5b4-412e-9ac1-5dfc43d0587c	af7cb15e-9f4a-48cb-a48f-ad759aa14ede	90000	VNPAY	2026-01-31 11:27:23.434
\.


--
-- Data for Name: Review; Type: TABLE DATA; Schema: public; Owner: postgresql
--

COPY public."Review" (id, rating, comment, "productId", "userId", "createdAt", "updatedAt", "imagesUrl") FROM stdin;
94256202-4acd-468c-b4ad-0e44e7d0dc07	5	Bánh ngon	7c879a78-4b81-4b57-b9da-6d3f4019e3ef	d14480c0-ed03-4e5d-86a1-53072605e78b	2026-01-22 13:38:48.979	2026-01-22 13:38:48.979	{http://localhost:5000/uploads/1769089126640-939032304.png}
37c71912-4586-497e-922c-6321d1f9937c	1	bánh bị vỡ	7c879a78-4b81-4b57-b9da-6d3f4019e3ef	a3f1449b-c861-4637-9923-c3621e0e4b1f	2026-01-22 13:46:31.582	2026-01-22 13:46:31.582	{}
e1b78a70-a4be-4a40-b303-8312591faef2	3	bánh ngon lắm	7c879a78-4b81-4b57-b9da-6d3f4019e3ef	390cedfa-55cc-46ff-81e8-e735516e4ac7	2026-01-22 13:53:00.053	2026-01-22 13:53:00.053	{}
3fd989f8-8f2f-49e8-8004-e52c7b3d13da	5	vị ngon	0abf7597-6c23-481e-9f27-8f226906f61d	d14480c0-ed03-4e5d-86a1-53072605e78b	2026-01-22 15:04:50.447	2026-01-22 15:04:50.447	{}
684f34a6-2684-4d22-97c5-1503d000f2f8	4	hơi ngọt	0abf7597-6c23-481e-9f27-8f226906f61d	a3f1449b-c861-4637-9923-c3621e0e4b1f	2026-01-22 15:05:21.3	2026-01-22 15:05:21.3	{}
a63b5476-cbf8-41f2-8885-ec9f10c062f1	3	cho hơi nhiều đường	0abf7597-6c23-481e-9f27-8f226906f61d	390cedfa-55cc-46ff-81e8-e735516e4ac7	2026-01-22 15:05:49.898	2026-01-22 15:05:49.898	{}
9a32902c-fdfe-4a53-b600-3ba62f64deb1	5	bánh ngon	830b506d-b5a3-4aa4-9246-c5a01d7f357d	390cedfa-55cc-46ff-81e8-e735516e4ac7	2026-01-22 15:06:11.76	2026-01-22 15:06:11.76	{}
acf3983e-937f-4c19-940a-ffa0539369ca	4	đóng gói chưa tốt	830b506d-b5a3-4aa4-9246-c5a01d7f357d	a3f1449b-c861-4637-9923-c3621e0e4b1f	2026-01-22 15:06:38.789	2026-01-22 15:06:38.789	{}
376a4f0e-d880-4573-8579-c8f139b33b94	5	mẫu đẹp	c2847fe7-ff94-4b8a-b1b0-9de05d9d0cc9	d14480c0-ed03-4e5d-86a1-53072605e78b	2026-01-22 15:07:49.686	2026-01-22 15:07:49.686	{}
dc933e28-7d68-4dc5-86fc-b1991888b1c4	4	giao nhầm size	c2847fe7-ff94-4b8a-b1b0-9de05d9d0cc9	a3f1449b-c861-4637-9923-c3621e0e4b1f	2026-01-22 15:08:05.423	2026-01-22 15:08:05.423	{}
fc6fce79-2407-4587-b538-a1a7547d2dc5	4	giao thiếu quà tặng kèm	c2847fe7-ff94-4b8a-b1b0-9de05d9d0cc9	390cedfa-55cc-46ff-81e8-e735516e4ac7	2026-01-22 15:08:34.16	2026-01-22 15:08:34.16	{}
88019e1d-8075-4028-91c3-584157bb0b29	5	10 điểm	00bcd6a5-cd01-45ab-8a84-1af5984d0e94	390cedfa-55cc-46ff-81e8-e735516e4ac7	2026-01-22 15:31:11.001	2026-01-22 15:31:11.001	{}
3adbbd6f-e5f6-49ac-a9d8-528b8294987c	5	nên thử 1 lần vì 10 điểm	d9bd9a8c-5aed-4255-ac7a-36c7db86ad7f	d14480c0-ed03-4e5d-86a1-53072605e78b	2026-01-22 15:43:41.483	2026-01-22 15:43:41.483	{http://localhost:5000/uploads/1769096619329-344795627.jpg,http://localhost:5000/uploads/1769096619336-801517933.jpg}
d33388d6-35d7-44a5-88f9-b1245c990c72	5	Bánh chất lượng	b97aae67-431a-4ca4-a59d-f42de7a5a78a	d14480c0-ed03-4e5d-86a1-53072605e78b	2026-01-22 15:46:42.993	2026-01-22 15:46:42.993	{}
cab28b5b-8d87-4c50-9762-4bb445dc3759	5	bánh tuổi thơ	b97aae67-431a-4ca4-a59d-f42de7a5a78a	a3f1449b-c861-4637-9923-c3621e0e4b1f	2026-01-22 15:52:24.005	2026-01-22 15:52:24.005	{http://localhost:5000/uploads/1769097139500-115418379.jpg,http://localhost:5000/uploads/1769097139506-270522307.jpg}
e73dcf2f-e944-4e1a-81ee-9c6089cb6df8	5	sẽ ủng hộ tiếp :>	d3a3e4be-4b14-4041-a663-55b353aa7ef5	a3f1449b-c861-4637-9923-c3621e0e4b1f	2026-01-22 15:53:49.557	2026-01-22 15:53:49.557	{http://localhost:5000/uploads/1769097226167-71263892.png,http://localhost:5000/uploads/1769097228237-32625033.jpg}
dd5f0a09-e2ae-4cb9-bbf1-d158a6f68e52	5	Ngon lắm	7d4097a8-4981-49ac-a61c-8836709ca8d7	d14480c0-ed03-4e5d-86a1-53072605e78b	2026-01-23 03:59:48.693	2026-01-23 03:59:48.693	{}
4d67b774-cf0a-4d73-9c2f-6d00d6ac20ab	4	sẽ tiếp tục ủng hộ	7d4097a8-4981-49ac-a61c-8836709ca8d7	390cedfa-55cc-46ff-81e8-e735516e4ac7	2026-01-23 04:01:27.894	2026-01-23 04:01:27.894	{}
c25ca96a-9f41-40b1-8787-9cf00a5b92f2	5	Bánh ngon tuyệt vời, sẽ tiếp tục ủng hộ	503bc40b-a82f-4c51-a7d2-a85738e2ea9a	d14480c0-ed03-4e5d-86a1-53072605e78b	2026-01-30 05:04:19.469	2026-01-30 05:04:19.469	{}
706925ab-4be2-482e-8053-c72bf815f57c	4	Cho nhiều đá	00bcd6a5-cd01-45ab-8a84-1af5984d0e94	d14480c0-ed03-4e5d-86a1-53072605e78b	2026-01-30 05:12:40.34	2026-01-30 05:12:40.34	{}
\.


--
-- Data for Name: SearchKeyword; Type: TABLE DATA; Schema: public; Owner: postgresql
--

COPY public."SearchKeyword" (id, title, count, "createdAt") FROM stdin;
f34f9fd7-1c4d-4e49-94b6-2241c081c6cc	áo thun	2	2026-01-27 11:09:58.823
9cd090e4-6177-4fb2-a207-762cd109f6ff	bánh	1	2026-01-27 11:10:19.92
df552893-5064-4784-9b46-8721e3d407fd	bánh quy	8	2026-01-27 10:48:55.986
b80943a4-2877-4a56-b3d5-45f2a5da5bd3	pizza	2	2026-01-27 11:35:16.431
d37b7cf4-4bf0-4e75-8097-a1e5210a3142	phô mai	2	2026-01-27 11:35:34.625
fa5af54a-9fef-405c-ae52-63f134ab0db4	cà phê	16	2026-01-27 10:48:46.525
09d99247-962f-433a-acd1-831d893c2e24	nước ngọt	5	2026-01-27 10:49:14.091
4d4eddf4-fe67-4f29-883b-9e1079b3ad16	bánh gạo	23	2026-01-27 10:48:18.316
\.


--
-- Data for Name: WebsiteTemplate; Type: TABLE DATA; Schema: public; Owner: postgresql
--

COPY public."WebsiteTemplate" (id, name, "primaryColor", "logoUrl", "isActive", "createdAt", "updatedAt", "bannersUrl", email, "footerDescription", phone) FROM stdin;
1345e4e5-50ec-458d-b7ff-0927526dfce6	Green Template	#3bb94c	http://localhost:5000/uploads/1768752104623-220882229.png	f	2026-01-18 16:01:51.208	2026-01-22 12:06:56.742	{}			
bc5d7304-fbe4-473c-9c55-25388d60602e	Highland	#b2292e	http://localhost:5000/uploads/1768833151261-891921872.png	f	2026-01-19 14:36:21.768	2026-01-21 04:15:04.792	{}			
2a050fc8-9c14-4d28-b7f4-a9c092c3eaec	Starbucks	#006342	http://localhost:5000/uploads/1768897459238-563206699.png	f	2026-01-20 08:24:26.439	2026-01-23 17:30:37.885	{}			
d307f608-9ac4-4d89-ae05-3da7fbd9cf03	Spotify	#3bb94c	http://localhost:5000/uploads/1769315479545-724981797.png	f	2026-01-25 04:31:38.149	2026-01-27 16:41:49.505	{http://localhost:5000/uploads/1769315483706-466916956.jpg,http://localhost:5000/uploads/1769315483717-668386983.jpg,http://localhost:5000/uploads/1769315483729-792584668.png}	truccuong.ngo@gmail.com	© Copyright 2026 & built with ❤️ by minhtrifit	12345678
42341e9b-234a-4d92-b43d-bbe18d8fe21e	Amazon	#FEB21A	http://localhost:5000/uploads/1768749605134-312713254.png	f	2026-01-18 15:20:18.493	2026-01-23 10:09:46.4	{}			
d2553322-dd48-4147-9e67-375a0a217960	Tiki	#0a68ff	http://localhost:5000/uploads/1769314959269-916383756.png	f	2026-01-25 04:19:02.767	2026-01-28 08:31:12.945	{http://localhost:5000/uploads/1769314833484-466103201.jpg,http://localhost:5000/uploads/1769314833492-957116955.jpg,http://localhost:5000/uploads/1769314833502-14250577.png}	hongminh_7ko@gmail.com	© Copyright 2026 & built with ❤️ by minhtrifit	022265555
6160d213-90b0-46e6-8363-9aee894f12b3	Shopee	#fa5230	http://localhost:5000/uploads/1768752436982-207219776.png	t	2026-01-18 16:07:19.547	2026-01-29 09:12:33.618	{http://localhost:5000/uploads/1768896794793-327175953.jpg,http://localhost:5000/uploads/1768896794804-103175363.jpg,http://localhost:5000/uploads/1768896794814-697014807.png}	truccuong.ngo@gmail.com	© Copyright 2026 & built with ❤️ by minhtrifit	123456789
\.


--
-- Data for Name: WebsiteSection; Type: TABLE DATA; Schema: public; Owner: postgresql
--

COPY public."WebsiteSection" (id, "templateId", title, "position", "createdAt", "updatedAt") FROM stdin;
23dd83ed-ff5e-4c28-94b1-f945a36456de	6160d213-90b0-46e6-8363-9aee894f12b3	Cà phê	1	2026-01-29 09:12:33.636	2026-01-29 09:12:33.636
7ecf99d8-32eb-405b-8fac-23221b892c48	6160d213-90b0-46e6-8363-9aee894f12b3	Xả kho cuối năm	2	2026-01-29 09:12:33.649	2026-01-29 09:12:33.649
a519f618-7666-48d7-9a00-01eea1295349	6160d213-90b0-46e6-8363-9aee894f12b3	Đồ ăn vặt mới	3	2026-01-29 09:12:33.655	2026-01-29 09:12:33.655
c61dc0bc-dd28-4024-b3f0-f70a488d14c5	6160d213-90b0-46e6-8363-9aee894f12b3	Sản phẩm khuyến mãi	4	2026-01-29 09:12:33.662	2026-01-29 09:12:33.662
49be0806-c980-446a-8403-dcab467b72d7	d2553322-dd48-4147-9e67-375a0a217960	Bánh snack ăn vặt	1	2026-01-26 08:31:15.202	2026-01-26 08:31:15.202
6b0c0457-7a77-4003-ad79-e623b59be296	d2553322-dd48-4147-9e67-375a0a217960	Coffee snake & chill	2	2026-01-26 08:31:15.206	2026-01-26 08:31:15.206
41084149-a3d1-41c5-945e-974399fd85a6	42341e9b-234a-4d92-b43d-bbe18d8fe21e	Sản phẩm mới	1	2026-01-23 10:09:28.514	2026-01-23 10:09:28.514
67a11c71-e6e4-477a-a2e2-8ad69ffacdb7	42341e9b-234a-4d92-b43d-bbe18d8fe21e	Sản phẩm khuyến mãi	2	2026-01-23 10:09:28.517	2026-01-23 10:09:28.517
\.


--
-- Data for Name: WebsiteSectionItem; Type: TABLE DATA; Schema: public; Owner: postgresql
--

COPY public."WebsiteSectionItem" (id, "sectionId", "productId", "position") FROM stdin;
2fac8cc9-23a5-464d-b063-c4b82ba6755c	23dd83ed-ff5e-4c28-94b1-f945a36456de	0abf7597-6c23-481e-9f27-8f226906f61d	1
4de37a33-df68-4b19-88ae-01a4bafbe63b	23dd83ed-ff5e-4c28-94b1-f945a36456de	00bcd6a5-cd01-45ab-8a84-1af5984d0e94	2
77b9aa06-d2aa-4eed-8f1c-90ac08082372	23dd83ed-ff5e-4c28-94b1-f945a36456de	d9bd9a8c-5aed-4255-ac7a-36c7db86ad7f	3
99617c9c-c6be-4a3a-8a6f-5d1bbfb02dcd	23dd83ed-ff5e-4c28-94b1-f945a36456de	bb76bda1-0e80-4005-a5f6-1c49b68bce7a	4
436b26df-4945-4961-91fb-f52884c07f32	7ecf99d8-32eb-405b-8fac-23221b892c48	a143eb0d-f88a-4714-8422-0fd64412e9b2	1
502cc19a-615e-49ed-95fc-8267eab05a19	7ecf99d8-32eb-405b-8fac-23221b892c48	9c75a5b6-b8e7-4011-bec5-70c4fca2567c	2
ffd0f8b9-6f4c-43d0-8b28-551632a1de56	7ecf99d8-32eb-405b-8fac-23221b892c48	3d24a690-6ae8-4f35-9cbe-6e5cc69aa804	3
3770526f-5566-46b4-9afb-239d8c71286e	7ecf99d8-32eb-405b-8fac-23221b892c48	503bc40b-a82f-4c51-a7d2-a85738e2ea9a	4
e2726276-bcca-4f23-9b38-654666eb71e7	7ecf99d8-32eb-405b-8fac-23221b892c48	fd2c00be-1600-403e-8602-05600d301a83	5
cbafd4f8-3bfc-488b-9385-952266741c44	a519f618-7666-48d7-9a00-01eea1295349	7c879a78-4b81-4b57-b9da-6d3f4019e3ef	1
10c6747d-2fe9-47d8-a5c0-594cda2a5990	a519f618-7666-48d7-9a00-01eea1295349	7d4097a8-4981-49ac-a61c-8836709ca8d7	2
e206825c-eada-416e-974c-d585ddec63df	a519f618-7666-48d7-9a00-01eea1295349	830b506d-b5a3-4aa4-9246-c5a01d7f357d	3
ea658cea-9b03-4363-85a1-61cfb9498f89	a519f618-7666-48d7-9a00-01eea1295349	6f3df853-178a-493c-8cad-e8a68e245ba9	4
45584210-5f55-4cda-b881-59c09bad4f02	a519f618-7666-48d7-9a00-01eea1295349	6c32938e-6ab2-4158-ac79-d8e55b4ba883	5
1b86f9fb-b2ba-4b4a-9cd8-318045cc0a40	c61dc0bc-dd28-4024-b3f0-f70a488d14c5	d3a3e4be-4b14-4041-a663-55b353aa7ef5	1
c7c00dd3-8103-43da-9f50-1e6c94820baa	c61dc0bc-dd28-4024-b3f0-f70a488d14c5	27cc074c-8684-4b0e-843a-bf82fd542fc7	2
ee21fdb1-5e6e-454b-8ae5-58584a35992f	c61dc0bc-dd28-4024-b3f0-f70a488d14c5	c2847fe7-ff94-4b8a-b1b0-9de05d9d0cc9	3
d4429224-6beb-4691-9c24-6bae760cc656	c61dc0bc-dd28-4024-b3f0-f70a488d14c5	8ece4d0d-6ca0-4d4c-b731-07387eedc8a9	4
4927c56d-c466-4acb-a442-cecd3dc2ddc7	c61dc0bc-dd28-4024-b3f0-f70a488d14c5	4e553107-51fd-4697-87f1-c8c17d33ac8e	5
d75fcf15-ecb8-4bc6-8d22-c478ecff2b60	41084149-a3d1-41c5-945e-974399fd85a6	368eca33-d24c-46fc-9109-6e8c24e2195a	1
27ca07c5-d944-4ecc-9929-3653682f909f	41084149-a3d1-41c5-945e-974399fd85a6	01a527db-a675-416d-9c1f-5f0ceb5bb08a	2
ee0d4786-c852-460f-a7da-fd74b5bd0e9c	41084149-a3d1-41c5-945e-974399fd85a6	0abf7597-6c23-481e-9f27-8f226906f61d	3
2a3a877d-51ce-4cea-a450-3fe248e7c4d4	41084149-a3d1-41c5-945e-974399fd85a6	b97aae67-431a-4ca4-a59d-f42de7a5a78a	4
d672c336-a270-43b3-a5a4-b72aea683561	67a11c71-e6e4-477a-a2e2-8ad69ffacdb7	27cc074c-8684-4b0e-843a-bf82fd542fc7	1
594a448e-3130-4062-923e-3b66fc2184ca	67a11c71-e6e4-477a-a2e2-8ad69ffacdb7	d3a3e4be-4b14-4041-a663-55b353aa7ef5	2
b80aae5e-035b-4548-9d78-d2d82286332a	67a11c71-e6e4-477a-a2e2-8ad69ffacdb7	c2847fe7-ff94-4b8a-b1b0-9de05d9d0cc9	3
3f55af74-6c35-4c6a-a501-95669e76476d	67a11c71-e6e4-477a-a2e2-8ad69ffacdb7	4e553107-51fd-4697-87f1-c8c17d33ac8e	4
bbb1ee4a-5175-4d33-a411-c9326842a321	49be0806-c980-446a-8403-dcab467b72d7	a143eb0d-f88a-4714-8422-0fd64412e9b2	1
02068bb4-e28f-4363-aa29-d8feaaf12845	49be0806-c980-446a-8403-dcab467b72d7	830b506d-b5a3-4aa4-9246-c5a01d7f357d	2
79aed889-3842-4aa9-8b3e-6053f86ef0aa	49be0806-c980-446a-8403-dcab467b72d7	3d24a690-6ae8-4f35-9cbe-6e5cc69aa804	3
2d720c5b-a10a-45a0-bb53-2d3ae895b591	49be0806-c980-446a-8403-dcab467b72d7	6f3df853-178a-493c-8cad-e8a68e245ba9	4
c55a0d1a-1d88-4233-95a6-b57489923c92	49be0806-c980-446a-8403-dcab467b72d7	7c879a78-4b81-4b57-b9da-6d3f4019e3ef	5
f3196c89-4f86-4073-a505-0f609b5baf08	6b0c0457-7a77-4003-ad79-e623b59be296	00bcd6a5-cd01-45ab-8a84-1af5984d0e94	1
0e73003a-ea36-43d3-990a-3643fe7672a3	6b0c0457-7a77-4003-ad79-e623b59be296	0abf7597-6c23-481e-9f27-8f226906f61d	2
a7992155-c8ce-4581-b8db-6f1790e52c6f	6b0c0457-7a77-4003-ad79-e623b59be296	bb76bda1-0e80-4005-a5f6-1c49b68bce7a	3
7d04dd49-7b58-4f8a-9dda-fb0390740ab2	6b0c0457-7a77-4003-ad79-e623b59be296	d9bd9a8c-5aed-4255-ac7a-36c7db86ad7f	4
897adf30-0041-4b1a-b1d7-4925c4bf8bba	6b0c0457-7a77-4003-ad79-e623b59be296	8ece4d0d-6ca0-4d4c-b731-07387eedc8a9	5
\.


--
-- Data for Name: _prisma_migrations; Type: TABLE DATA; Schema: public; Owner: postgresql
--

COPY public._prisma_migrations (id, checksum, finished_at, migration_name, logs, rolled_back_at, started_at, applied_steps_count) FROM stdin;
a65056cb-4189-4df2-a2b4-bf358ed5066b	f3cb623197110dd14f8e7bc41c146ddea97369aac4f1aff04c4e5111e9c2347e	2026-01-22 13:30:11.715175+00	20260122133011_update_product_review_images	\N	\N	2026-01-22 13:30:11.709037+00	1
792499f5-8ced-4468-a193-8bc290f52765	d53adad52e0ea4d362393fd5ec102a0fa81408cb6cc93db42cd29530f94975ff	2026-01-06 10:13:14.37638+00	20260104110523_init_user	\N	\N	2026-01-06 10:13:14.366626+00	1
6e0e79a9-ebd5-425a-bd9d-2ee866257169	67fe523861c3df66b978dd40b31a5090e100fc804ae8a0fd9ba8284bf6dd9879	2026-01-07 10:50:40.65035+00	20260107105040_update_product_sku_validate	\N	\N	2026-01-07 10:50:40.638671+00	1
df46c35d-64a3-430b-b14d-b0824a8c918c	735dbf532ee8d2a05e35cb295851cf6f89b3c9900b9162b24b2c1e17941bb973	2026-01-06 10:13:23.515657+00	20260106101323_init_schema	\N	\N	2026-01-06 10:13:23.487938+00	1
b75f79ff-2341-4299-88ef-a50b4533b56e	e1be3c413d94a88dc356f45a326dfc98c83e105eb1b2cdb267977e1ead3dc13e	2026-01-06 11:06:10.558177+00	20260106110610_update_id_type	\N	\N	2026-01-06 11:06:10.522583+00	1
783b11fb-5242-44ac-9c36-da56c343ad23	ea3d269f9169ff2077ce67e9d7d4ddb58f30d0c6f86a2b5cbf12c8c5e4a071ee	2026-01-19 13:34:23.910915+00	20260119133423_update_websitetemplate	\N	\N	2026-01-19 13:34:23.903141+00	1
5ece0815-f341-407b-88ea-afce334f7665	bfc79cc5eaaf69b71daf66f014659a2fb174f63dc0491234fdc3bcba64abd487	2026-01-06 11:08:40.031339+00	20260106110839_product_images_url	\N	\N	2026-01-06 11:08:40.023674+00	1
c87b5f71-5c3e-41a3-abac-64716f23c5f7	013a26980db5b182032120489b49dc72956c53cbdfd28425efa30e4ad0aaba2b	2026-01-09 10:06:44.228084+00	20260109100644_update_order_note	\N	\N	2026-01-09 10:06:44.217816+00	1
fc1f4aff-876d-41f5-a790-d94de3b9b05f	94cc7fd14917da3682312406818966ada26ab809a60efec7e5ebae7fb9e509dd	2026-01-06 11:22:17.496633+00	20260106112217_update_category	\N	\N	2026-01-06 11:22:17.488713+00	1
41ad48d4-47ec-4c37-9516-36b490c3de2c	24de90c46385384d88f81593f5161320a16661a6a8ae8f1145e43613e401912b	2026-01-06 11:35:39.935288+00	20260106113539_update_category_is_active	\N	\N	2026-01-06 11:35:39.926318+00	1
e648a6f0-1496-489d-8ffa-60f477b12f38	cc91bdbd3b225b1f0598bb404d7ae9e85c4af3b74e56d0cb740607de09d92433	2026-01-06 13:42:21.152579+00	20260106134221_update_user_customer	\N	\N	2026-01-06 13:42:21.135925+00	1
929c4cbc-3d23-47fc-8ea2-511f122f7079	fc6284ba9a8e357e9eb491d2fe3ad33c6f4e9cce2c7b15bb723f738beed30c8d	2026-01-09 11:58:36.310414+00	20260109115836_update_order_delivery	\N	\N	2026-01-09 11:58:36.295223+00	1
f36a9111-a778-4371-ab17-c277924de3eb	4386ee2ac75c77c8050b9b04f708ffcca60b0f5437c5d42f5a0fa0fea65c1cb9	2026-01-06 14:04:01.820567+00	20260106140401_category_slug	\N	\N	2026-01-06 14:04:01.81223+00	1
fea94f07-8a7a-44c5-a529-0074450262e5	bf4c38d367854f234604ed784acb27d30e7efd5a3795f8fcbee713073fb5b7cc	2026-01-07 02:33:08.533689+00	20260107023308_update_user_defaultvalue	\N	\N	2026-01-07 02:33:08.517486+00	1
da5b2aba-2ebd-4a0e-9aa0-b25120f060bb	e25cfc74457270ef7f935ea4a852e7a6bec6504c96cc1cb74b91a712a75ab705	2026-01-07 02:38:05.73759+00	20260107023805_fix_user_defaultvalue	\N	\N	2026-01-07 02:38:05.726808+00	1
cf910de0-9c59-490a-b7b1-41a91624e657	0781fe00e984c4276b4c66d76a70b1cfb1b21bcb3269eb9d8f6f661751f0def9	2026-01-09 12:27:48.316025+00	20260109122748_update_order_deliveryaddress	\N	\N	2026-01-09 12:27:48.307335+00	1
b25c92cc-8a72-4e65-a0dc-21933156c0e7	ac95853551676a24ca45f0e87ae969b96ee5881ac9eae4c892aa925ce5615b88	2026-01-07 03:09:25.301982+00	20260107030925_update_customer_email	\N	\N	2026-01-07 03:09:25.291113+00	1
4cd8c250-6d39-4b33-9000-86e1ca1a65c6	64de3e1e1e730e4fd43215f1c097e105e5f5a14d2dddf3447792d94af929c41a	2026-01-07 03:16:49.87091+00	20260107031649_update_customer_full_name	\N	\N	2026-01-07 03:16:49.858569+00	1
894fe3f3-1128-4833-b0d5-fe5e7f3d7b0c	6a05dbdcc2da3a8611d156e1db79e6a551568d2d3e9f6961817d3fe9c71a0a93	2026-01-20 06:58:22.159944+00	20260120065822_website_template_banners	\N	\N	2026-01-20 06:58:22.151148+00	1
6cb696cb-eec8-4b4b-aa09-007e8df08203	72c52e8efa698953b59c7b146af7c665dcdd7d95ce9fb7311104b635a9e93528	2026-01-07 10:36:49.777374+00	20260107103649_update_product_slug	\N	\N	2026-01-07 10:36:49.763664+00	1
da6e7966-ef3a-4db8-9874-af7a36d963e1	e6e1da2bd8954026923ba16627e6645a36291e08daee8c6a4206516f7424b391	2026-01-11 13:08:08.884537+00	20260111130808_update_product_stock	\N	\N	2026-01-11 13:08:08.714007+00	1
148a3be1-f1fb-4878-8f74-50af351a1b0b	7a46927668051cdd6def64af75e2a3358ce1249c9c4b895dfba07ed39c3e9720	2026-01-18 10:46:23.956785+00	20260118104623_update_websitetempalte	\N	\N	2026-01-18 10:46:23.849235+00	1
18dbb54a-1322-4b95-b618-adfdc0abfd8c	94dbded0de161ccc8e392ecfe1cce72edb2431ddf8e8c929ed2b2807d32d204a	2026-01-29 14:29:44.389079+00	20260129142944_update_order_user	\N	\N	2026-01-29 14:29:44.374839+00	1
b9f2be30-39cb-4f93-85c1-d56145bff711	5640ec8b72350bf288377bb04eb36599d9c24fcee2dba6c26c3831fa0d66b493	2026-01-19 09:37:05.210681+00	20260119093705_update_websitetemplate	\N	\N	2026-01-19 09:37:05.188681+00	1
f008a184-8c81-4c4a-aca4-479463cef9c6	eab85acb429c2520d912f8c560afda1c41c6aef667c2fc5b28e3cfa00ed51140	2026-01-20 11:01:06.050444+00	20260120110106_add_websitetemplate_field	\N	\N	2026-01-20 11:01:06.044581+00	1
7f8c8c83-8871-4cb8-80a4-c4c79aa55e20	6050d15ec3fbc377ccf63c8b0f31f2666a73ee438609b68621985904b296de0e	2026-01-19 11:07:05.667024+00	20260119110705_update_websitesection	\N	\N	2026-01-19 11:07:05.650744+00	1
10994695-1493-4d28-b8ee-bf4d51cd1b32	ecdb1e8748232cd8df52d21ae0c355c1a91a974214e86dfc6b5d964949cb266d	2026-01-22 13:35:32.475698+00	20260122133532_update_product_rating	\N	\N	2026-01-22 13:35:32.469423+00	1
0dfaba85-d9a8-45d2-a53e-3d1b8fb86972	1527e28ca6984eb4164a536b0298dbb1a295e558cb4ddfc86bc436e7367d8696	2026-01-21 10:14:45.335961+00	20260121101445_update_user_avatar	\N	\N	2026-01-21 10:14:45.328595+00	1
1e4be53d-8b54-4ab7-ad88-447202826281	34ff5c07c270042687c31d1a8f0743a13e1ce7ebe5d73eeb82c860ec92528f1b	2026-01-22 13:09:32.096251+00	20260122130932_add_product_review	\N	\N	2026-01-22 13:09:32.075584+00	1
8238681a-19f5-4cf9-b8c4-ae4102cab373	bdc55fda28f63589c7e4aefe0b3fcfbdd6343f34defbbe6a353859ba75b11f24	2026-01-28 10:29:13.291613+00	20260128102913_add_order_phone	\N	\N	2026-01-28 10:29:13.283247+00	1
c68f4e1b-e62f-4341-9920-6f8850c8c272	2d41fb40488ce05c71e182ff2678932d8def5c048a134b68c14d732926393d9e	2026-01-23 03:23:04.323169+00	20260123032304_update_product_soldcount	\N	\N	2026-01-23 03:23:04.309123+00	1
8d441b2d-5e60-43c5-96a8-fb3ced1d85bd	a0f0ed741abf4c3ef52ea2411bce911bf21e791d295afb02bf39738017cceccb	2026-01-27 10:15:18.8537+00	20260127101518_add_search_keyword	\N	\N	2026-01-27 10:15:18.835738+00	1
5e458992-08c9-4ae6-923b-18d5825c5522	b669b6d4eb5131b33e57042aeaa3b47c302bf454add5822a6e3d4bf6ae1caa62	2026-01-29 14:18:16.85419+00	20260129141816_remove_customer	\N	\N	2026-01-29 14:18:16.832362+00	1
5b0ea6e9-b3b5-425b-8448-900a85661c4a	6bbd04aabcb002c94ce7b02b2623f36b688211b4e9932106b04431a08c7e670b	2026-01-30 10:25:39.416771+00	20260130102539_add_notification	\N	\N	2026-01-30 10:25:39.395133+00	1
\.


--
-- PostgreSQL database dump complete
--

\unrestrict zzoD1DmZurkIwX1KSHz6jMBfy6Kyp96U0sS9EQer8oAkLKT1oMs0hKrSkh57F8A

