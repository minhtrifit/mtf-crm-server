--
-- PostgreSQL database dump
--

\restrict LxIgF4GQZ0LCrSczvoTVjGdXHj37NGVGcShPokrRUNwmHjj3uZ6V6NnG1LGKwlt

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
-- Data for Name: Customer; Type: TABLE DATA; Schema: public; Owner: postgresql
--

COPY public."Customer" (id, phone, email, address, "createdAt", "updatedAt", "fullName") FROM stdin;
fcd3ebc7-c84e-46c2-8fba-cf9062814a07	0043048652	quynhhuong.to67@gmail.com	39490 Đan Quỳnh Burgs	2026-01-07 04:06:45.062	2026-01-07 04:06:45.062	Vũ Việt Khuê
27f14cab-69ca-4f20-8138-1d047c1a961d	0743885765	duyhung1@yahoo.com	2254 Hoàng Land	2026-01-07 04:06:45.062	2026-01-07 04:06:45.062	Hà Hữu Thực
bb0b9d18-78f5-44b7-b908-955066aa9695	0516019970	xuanham_7kinh38@yahoo.com	196 Sơn Quân Junction	2026-01-07 04:06:45.062	2026-01-07 04:06:45.062	Đinh Quỳnh Giang
c5d3a4df-c100-4d20-a433-ba03c044f613	0959918590	chilan47@hotmail.com	775 Đắc Cường Pine	2026-01-07 04:06:45.062	2026-01-07 04:06:45.062	Ngô Duy Cẩn
ce504307-2251-4f0f-b00c-b9cb9546daa2	0893421735	nhathung55@gmail.com	8832 Diệu Nga Ports	2026-01-07 04:06:45.062	2026-01-07 04:06:45.062	Đoàn Sỹ Thực
938c452d-7381-45b5-a306-5b7e55fb3e24	0448292407	chicong.ho26@yahoo.com	277 Đặng Flat	2026-01-07 04:06:45.062	2026-01-07 04:06:45.062	Vương Hữu Bào
3976308d-1b28-4703-bf31-9710802e6c64	0417942709	nguyenbao.tang@yahoo.com	656 Bích Vân Glen	2026-01-07 04:06:45.062	2026-01-07 04:06:45.062	Trương Hoàng Mai
a695fd27-a293-45ed-a6f5-13e494a59e54	0420615106	giaolinh.phan81@hotmail.com	286 Tâm Đan Forks	2026-01-07 04:06:45.062	2026-01-07 04:06:45.062	Phan Đức Sinh
8598fca8-87d0-4fdb-a05d-2282d8e94acd	0877155354	hongliem_7kao79@gmail.com	887 Hoàng Way	2026-01-07 04:06:45.062	2026-01-07 04:06:45.062	Vương Ngọc Hân
0448ea86-22dc-4540-9b5c-002b2fc6d8b9	0518761381	thuhuyen50@hotmail.com	189 Tú Tâm Port	2026-01-07 04:06:45.062	2026-01-07 04:06:45.062	Phan Đinh Lộc
7ddde3a1-7996-4817-b916-072747cda34a	0638346987	bathuc.tran@gmail.com	83144 Chi Lan Lodge	2026-01-07 04:06:45.062	2026-01-07 04:06:45.062	Đoàn Hữu Khang
db122f6b-8a47-46cc-9d24-fef3278f367a	0953726765	hoangdue49@hotmail.com	6957 Mỹ Huyền Summit	2026-01-07 04:06:45.062	2026-01-07 04:06:45.062	Vũ Xuân Huy
6e9b8604-6c9e-47ca-91ec-db8543cb2880	0434230165	songlam.7kao44@hotmail.com	647 Xuân Trang Burg	2026-01-07 04:06:45.062	2026-01-07 04:06:45.062	Mai Uyển Nghi
e75ef439-1786-4b59-a956-113d00695f30	0142197785	vietha.phan67@hotmail.com	65247 Sơn Lâm Point	2026-01-07 04:06:45.062	2026-01-07 04:06:45.062	Ngô Thế Sơn
715994fe-73c9-4ac5-8bd6-6d1b0b17474a	0306283781	thanhvinh54@yahoo.com	714 Tân Định Mews	2026-01-07 04:06:45.062	2026-01-07 04:06:45.062	Đoàn Quốc Trường
2d40e82e-d31e-4bd4-a3b3-fd0b515d9980	0170791998	khanhthuy.vu32@hotmail.com	1161 Phùng Ways	2026-01-07 04:06:45.062	2026-01-07 04:06:45.062	Hà Phi Phi
f149fcbf-e037-4b1c-81e7-a426406ed7ee	0459308961	anhchi_ho60@yahoo.com	7890 Quốc Phong Burg	2026-01-07 04:06:45.062	2026-01-07 04:06:45.062	Hà Việt Sơn
ac5f6a2c-c6b6-4751-a26a-318a3d5d2973	0951317358	haivan_bui70@yahoo.com	46473 Vương Parkway	2026-01-07 04:06:45.062	2026-01-07 04:06:45.062	Đinh Kim Yến
1cebdc10-1159-456b-8cef-6305055e8139	0415233910	7kuctuong_mai24@gmail.com	38741 Đinh Hollow	2026-01-07 04:06:45.062	2026-01-07 04:06:45.062	Phùng Thuận Phương
9064cab7-4416-4027-801b-4d562db1e8e3	0990627690	thientien_truong68@yahoo.com	621 Mạnh Trình Trail	2026-01-07 04:06:45.062	2026-01-07 04:06:45.062	Phan Quang Triều
652fbea6-1cc7-4b42-b57f-56bf49ba46f6	0081880316	hoangthai33@hotmail.com	61738 Phùng Branch	2026-01-07 04:06:45.062	2026-01-07 04:06:45.062	Đinh Hữu Toàn
501a17d8-4a1a-45cc-a6b3-a1e36e525ae6	0363858570	minhthuy24@gmail.com	412 Quốc Trụ Greens	2026-01-07 04:06:45.062	2026-01-07 04:06:45.062	Mai Phúc Duy
c2532f64-daec-4094-a3e5-b0dbcb965bac	0147295113	caoky_vuong19@hotmail.com	17029 Cát Linh Terrace	2026-01-07 04:06:45.062	2026-01-07 04:06:45.062	Đào Yên Đan
8c8cea9d-1de6-47f6-b8c8-fa6bf1240ec8	0903942966	trihuu.to48@yahoo.com	5575 Phùng Corner	2026-01-07 04:06:45.062	2026-01-07 04:06:45.062	Lý Tuệ Mẫn
1b9612bf-e755-45dc-bc5e-5006a3788771	0660617859	thuynga_vu15@gmail.com	613 Lê Groves	2026-01-07 04:06:45.062	2026-01-07 04:06:45.062	Tô Khôi Vĩ
ee5d55a4-9fbc-4f3d-a046-56138c6d7946	0843835296	haiuyen.7kinh@gmail.com	120 Lý Walks	2026-01-07 04:06:45.062	2026-01-07 04:06:45.062	Lý Xuân Nghi
0dcab57b-1018-4c5a-8a06-b9f2267af715	0663174986	nguyenphong79@gmail.com	4757 Kiều Khanh Walks	2026-01-07 04:06:45.062	2026-01-07 04:06:45.062	Hồ Hạ Vy
380ce05b-fba4-48e2-bf14-fd0e14d61314	0239509136	nguyetcam79@hotmail.com	49424 Đỗ Coves	2026-01-07 04:06:45.062	2026-01-07 04:06:45.062	Đinh Triều Thanh
e23d68b4-17c8-4dbe-95d6-56662df5c123	0845114990	ngocoanh.ha@gmail.com	2835 Trịnh Mills	2026-01-07 04:06:45.062	2026-01-07 04:06:45.062	Đinh Chí Giang
7b3eae84-c56a-45f6-835f-d2d659f0e2c0	0320144084	sontrang.pham23@hotmail.com	6320 Phùng Unions	2026-01-07 04:06:45.062	2026-01-07 04:06:45.062	Phùng Phú Thời
c1aaa680-4834-471e-b61a-95e7c3c54009	0926039295	phuccuong26@hotmail.com	632 Đào Manor	2026-01-07 04:06:45.062	2026-01-07 04:06:45.062	Tăng Thục Trang
e7c6cd7a-ce8a-4da8-ac7b-933d3d666fdb	0077051783	hami.trinh@hotmail.com	482 Ý Nhi Wells	2026-01-07 04:06:45.062	2026-01-07 04:06:45.062	Mai Thế Vinh
1a632d6c-171f-41a8-9dce-14cb3f3831cd	0953579680	diemhuong66@yahoo.com	50372 Lý Pines	2026-01-07 04:06:45.062	2026-01-07 04:06:45.062	Phạm Đình Phú
da01cc31-fe4f-4994-a079-c48034582ee5	0821614763	xuanham.phan61@hotmail.com	8654 Vũ Pike	2026-01-07 04:06:45.062	2026-01-07 04:06:45.062	Hồ Khắc Anh
f053b2a5-78eb-401c-9d2f-89f84962d247	0536456021	kieugiang.bui@yahoo.com	6094 Phương Thùy Drive	2026-01-07 04:06:45.062	2026-01-07 04:06:45.062	Đinh Bạch Quỳnh
582f82ec-1f7d-4c77-95eb-3b5faed3cb45	0873625098	quochoa53@yahoo.com	94036 Lâm Springs	2026-01-07 04:06:45.062	2026-01-07 04:06:45.062	Vũ Mạnh Tuấn
2453fba6-9b03-4582-ad09-1a27fb67d977	0140777403	tathieu_tran@hotmail.com	61247 Hồ Throughway	2026-01-07 04:06:45.062	2026-01-07 04:06:45.062	Ngô Yên Bằng
887b2ab0-dc0c-46da-8d5e-02d5d0949dd6	0358977985	quynhngan10@yahoo.com	48632 Bùi Cliffs	2026-01-07 04:06:45.062	2026-01-07 04:06:45.062	Bùi Mộng Long
77682e61-a381-4c1f-a3cb-e450b2c710e8	0514542331	vietdung_duong64@yahoo.com	22423 Đặng Curve	2026-01-07 04:06:45.062	2026-01-07 04:06:45.062	Bùi Hướng Bình
dd81eca4-4bc9-42b3-87c4-6364d1272097	0219514674	mongthu.tang9@yahoo.com	81119 Tăng Overpass	2026-01-07 04:06:45.062	2026-01-07 04:06:45.062	Trịnh Gia Hân
f9155770-c556-4cc5-90e7-1c97e6e0f13e	0622168103	vanthong86@yahoo.com	50984 Vương Vista	2026-01-07 04:06:45.062	2026-01-07 04:06:45.062	Đỗ Diễm Trang
f3bdbde8-0a27-4456-8ab3-ffe7ca71ba3e	0531898554	ngocsan_to@hotmail.com	97402 Vương Route	2026-01-07 04:06:45.062	2026-01-07 04:06:45.062	Ngô Bảo Uyên
523eaa5e-7993-482d-8254-f2dc8ba31137	0360239243	thuc7kinh38@yahoo.com	32487 Đỗ Mall	2026-01-07 04:06:45.062	2026-01-07 04:06:45.062	Ngô Hồ Bắc
e334f11c-5a7d-4995-bba1-da755bfd7d56	0821048750	khanhlinh_7ko91@yahoo.com	3147 Sao Mai Parks	2026-01-07 04:06:45.062	2026-01-07 04:06:45.062	Ngô Kiên Trung
dabf1416-db29-44db-8f66-1cb8c8aa1822	0295493900	tuanminh18@hotmail.com	777 Vương Point	2026-01-07 04:06:45.062	2026-01-07 04:06:45.062	Đoàn Hưng Đạo
4d20be1e-0315-4ff8-b1cd-3f73454f31e8	0713549758	thykhanh_hoang@hotmail.com	3340 Oanh Vũ Roads	2026-01-07 04:06:45.062	2026-01-07 04:06:45.062	Đỗ Hòa Hợp
2ab644e8-9d52-4b88-8435-77ec2412455e	0946572284	hoabinh_le61@hotmail.com	4916 Khang Kiện Ramp	2026-01-07 04:06:45.062	2026-01-07 04:06:45.062	Đỗ Trọng Hiếu
c0cc5fa4-3d0c-46e3-b96b-1270b03e1e74	0919434153	tuanviet.ho@yahoo.com	6104 Trương Lock	2026-01-07 04:06:45.062	2026-01-07 04:06:45.062	Ngô Phong Độ
57fd0974-3c60-4155-b13a-182a28039b1f	0060239195	mongthi29@hotmail.com	875 Đỗ Terrace	2026-01-07 04:06:45.062	2026-01-07 04:06:45.062	Mai Thanh Vinh
e74df7ca-f525-496c-ad6b-17e01651d84e	0362605268	maitrinh.7koan@gmail.com	2431 Uyên Thi Ranch	2026-01-07 04:06:45.062	2026-01-07 04:06:45.062	Tô Giáng Ngọc
ace743a9-c159-4e78-90e1-7b7613a8fb8a	0834303191	vanquynh_vu92@hotmail.com	701 Quang Hữu Unions	2026-01-07 04:06:45.062	2026-01-07 04:06:45.062	Nguyễn Thanh Vinh
d828f2b4-476a-44cb-989a-940d5d8dc81a	0318426571	thaolinh_7kinh82@gmail.com	99958 Dương Loop	2026-01-07 04:06:45.062	2026-01-07 04:06:45.062	Đào Duy Quang
b5433dde-745b-41de-a105-86704f11beb8	0248615714	trongkhanh.mai@hotmail.com	82211 Thảo Trang Lock	2026-01-07 04:06:45.062	2026-01-07 04:06:45.062	Tô Thục Đoan
9140c2d9-6385-4f89-a475-2e52b377bfc8	0366133255	thienlam8@hotmail.com	7624 Trương Manors	2026-01-07 04:06:45.062	2026-01-07 04:06:45.062	Đinh Phượng Bích
cbb94c75-c73f-4a2f-bef6-a9d8c8c884b4	0027359048	songhuong.7koan@gmail.com	58581 Đỗ Ridges	2026-01-07 04:06:45.062	2026-01-07 04:06:45.062	Bùi Thụy Trinh
ef4883c6-108f-4b94-b58d-7b28237e3206	0204765336	quynhhuong.phan@yahoo.com	41720 Vương Fords	2026-01-07 04:06:45.062	2026-01-07 04:06:45.062	Bùi Nam Hải
56ad54f8-8fac-49a9-8df0-8f1d62587558	0491509559	hieuminh.7kang@yahoo.com	82583 Lâm Lake	2026-01-07 04:06:45.062	2026-01-07 04:06:45.062	Tăng Tuyết Hân
f7a30dbf-dff6-4f7a-9ec8-b3695cbb40f2	0000941426	hai7kuong.duong50@hotmail.com	5434 Thúy Kiều Creek	2026-01-07 04:06:45.062	2026-01-07 04:06:45.062	Đào Kim Tuyến
9cbf04fd-d3e7-4e8e-93ba-62d197176c93	0342255227	kimlan.trinh@gmail.com	712 Phan Prairie	2026-01-07 04:06:45.062	2026-01-07 04:06:45.062	Nguyễn Kiều Loan
13d8fee0-99eb-41ef-a263-15a4435dff6c	0044008075	giathinh.ho94@yahoo.com	41069 Tường Minh Pass	2026-01-07 04:06:45.062	2026-01-07 04:06:45.062	Bùi Thúy Hường
7cdd7640-ed4d-4b83-b763-7da79259d8df	0844833221	antam.truong23@hotmail.com	406 Cao Sỹ Club	2026-01-07 04:06:45.062	2026-01-07 04:06:45.062	Trương Vân Nhi
82bfa378-cefd-4920-8ed2-5031a9c14682	0415597984	vietnhi.vu34@yahoo.com	613 Lý Ferry	2026-01-07 04:06:45.062	2026-01-07 04:06:45.062	Đoàn Gia Phước
27fd900f-be82-4595-b726-4f450ac8cc76	0589428904	duyluan.truong17@gmail.com	626 Anh Chi Glen	2026-01-07 04:06:45.062	2026-01-07 04:06:45.062	Bùi Lan Thương
9b2923e2-f76c-4684-b37e-606967e16ac5	0808311847	kieukhanh_7kinh35@gmail.com	2479 Mộng Nhi Village	2026-01-07 04:06:45.062	2026-01-07 04:06:45.062	Đinh Hằng Anh
08f5cf9e-3c99-476f-8a7a-4969bdf46a99	0606136902	minhhy_7ko11@yahoo.com	80603 Thái Bình Orchard	2026-01-07 04:06:45.062	2026-01-07 04:06:45.062	Bùi Phương Chi
dadc0caf-a73b-4cb0-b1e5-5783cb89b09e	0238789252	phiphuong18@hotmail.com	613 Duy Khánh Path	2026-01-07 04:06:45.062	2026-01-07 04:06:45.062	Mai Phi Cường
bf0bc1a5-f18d-42da-8142-1fee7bb09d49	0226977674	xuankien.truong65@gmail.com	601 Công Lập Route	2026-01-07 04:06:45.062	2026-01-07 04:06:45.062	Đinh Như Hảo
ff0b16a2-2736-4c3b-ab40-3f4374285da9	0476127174	bichnga_ho@gmail.com	4138 Hồng Lĩnh Isle	2026-01-07 04:06:45.062	2026-01-07 04:06:45.062	Ngô Thế Lực
070e2a31-4ebe-4486-8160-a31f942dfa74	0857306436	thanhcong18@gmail.com	7549 Kim Thủy Place	2026-01-07 04:06:45.062	2026-01-07 04:06:45.062	Trần Phương Lan
450ed2c4-7e61-4aaf-a0a0-191ca8d4d37c	0928172771	danhvan.7kao@yahoo.com	112 Đỗ Well	2026-01-07 04:06:45.062	2026-01-07 04:06:45.062	Nguyễn Quảng Thông
478cfcf6-e80f-410a-8aa8-7935bb8b213e	0209924190	tieumi_ha39@hotmail.com	11758 Tường Vi Circles	2026-01-07 04:06:45.062	2026-01-07 04:06:45.062	Tăng Anh Mai
5c83a397-913f-4dd1-a7b7-1e8720055387	0783287820	khaihoa_ha45@hotmail.com	2129 Vĩnh Thụy Unions	2026-01-07 04:06:45.062	2026-01-07 04:06:45.062	Mai Thắng Cảnh
cc9d3265-108a-4aaf-a174-72dc67eaa736	0400336780	xuannghi_to29@gmail.com	171 Bùi Ports	2026-01-07 04:06:45.062	2026-01-07 04:06:45.062	Đinh Hải Mỹ
52490cb5-8c36-4a38-988d-b5a2bca13862	0613492369	xuankien_7kang46@yahoo.com	4597 Hướng Dương Skyway	2026-01-07 04:06:45.062	2026-01-07 04:06:45.062	Đào Huy Việt
2a084bd4-7e0c-4877-92d4-ea6b6ac800cb	0378813896	hanhlinh47@yahoo.com	418 Phúc Duy Park	2026-01-07 04:06:45.062	2026-01-07 04:06:45.062	Tăng Trúc Ly
ebfa5021-a656-4b76-a405-9c1e27a0189a	0180591729	tuongphat_le93@yahoo.com	62657 Công Lý Lodge	2026-01-07 04:06:45.062	2026-01-07 04:06:45.062	Dương Mai Trinh
ee09c2af-92f9-4283-a579-08590da94d24	0016070900	minhtuan_vuong@gmail.com	280 Phùng Trail	2026-01-07 04:06:45.062	2026-01-07 04:06:45.062	Hồ Tuấn Hoàng
c9ed8a35-0c16-4e9d-8d9f-8de2d51170f8	0518365809	nhatanh24@yahoo.com	553 Ngọc Huyền Ports	2026-01-07 04:06:45.062	2026-01-07 04:06:45.062	Phạm Trường Vũ
8e3c6244-95ee-4a83-9dcd-c2677c1e1989	0802910915	bachcuc52@hotmail.com	6365 Đặng Parkway	2026-01-07 04:06:45.062	2026-01-07 04:06:45.062	Dương Văn Tuyển
47a2da06-3d8c-46ae-8153-c9a419c50f75	0781551173	quynhsa.nguyen11@gmail.com	44897 Ngô Ville	2026-01-07 04:06:45.062	2026-01-07 04:06:45.062	Đặng Bạch Tuyết
5cfa80a5-dd0e-441f-a3a5-cc9f558c293f	0142076319	hiepdinh30@gmail.com	16617 Diệu Loan Squares	2026-01-07 04:06:45.062	2026-01-07 04:06:45.062	Nguyễn Tùng Châu
3a57a0f0-358f-4d0a-af26-3970df1c63c8	0467289474	quangvinh.vu@yahoo.com	3818 Lâm Loop	2026-01-07 04:06:45.062	2026-01-07 04:06:45.062	Phạm Quảng Đại
0a27d651-6ba6-4fe8-8334-d054bd087198	0507979696	nhuloan0@yahoo.com	984 Tuyết Vân Hills	2026-01-07 04:06:45.062	2026-01-07 04:06:45.062	Phan Ngọc Minh
408be5db-1ce8-4195-b0a9-e8366521ea1d	0229011010	khacduy.pham@yahoo.com	2761 Dương Skyway	2026-01-07 04:06:45.062	2026-01-07 04:06:45.062	Phạm Nam Dương
dd3306c0-717a-45e5-9760-293f12a3b105	0623773250	uyenmy_vuong14@hotmail.com	1699 Duy Tuyền Streets	2026-01-07 04:06:45.062	2026-01-07 04:06:45.062	Hồ Hán Lâm
b6f6532f-0e61-46e2-87af-8f34a1cd4ef9	0703830686	minhkhai.vuong@gmail.com	501 Hà Viaduct	2026-01-07 04:06:45.062	2026-01-07 04:06:45.062	Hoàng Thiên Tuyền
1e3e8c78-2075-4db3-882b-66fabd357656	0967291167	ngocly_ly2@gmail.com	5059 Đan Thu Glen	2026-01-07 04:06:45.062	2026-01-07 04:06:45.062	Vũ Đức Trí
489a2a3b-bc30-4a5a-a694-dd4e293b7516	0975682236	xuanuyen_lam98@yahoo.com	590 Huệ Hương Plaza	2026-01-07 04:06:45.062	2026-01-07 04:06:45.062	Đào Ngọc Ẩn
659625cf-b950-4a54-952e-e16cd7674767	0047136476	queanh.7ko64@hotmail.com	85323 Tô Corner	2026-01-07 04:06:45.062	2026-01-07 04:06:45.062	Bùi Huy Chiểu
d8609dee-833f-43d7-ac40-486d19cd92fa	0291894441	quechi_tang@hotmail.com	8796 Quang Thịnh Turnpike	2026-01-07 04:06:45.062	2026-01-07 04:06:45.062	Đỗ Mộc Miên
4f4544c8-ea7c-446d-b32b-26523375f89f	0364031513	huyquang_7ko@yahoo.com	649 Lam Khê Ranch	2026-01-07 04:06:45.062	2026-01-07 04:06:45.062	Trương Yến Mai
c36097ab-93ee-4903-95e5-dd63529dcbae	0968871395	anhthy_nguyen@gmail.com	5047 Hoàng Gateway	2026-01-07 04:06:45.062	2026-01-07 04:06:45.062	Đinh Hữu Khôi
1d5300d3-b95a-4ba7-aff6-ea2f74351275	0827254321	caotho10@yahoo.com	408 Trương Manor	2026-01-07 04:06:45.062	2026-01-07 04:06:45.062	Lý Lâm Nhi
4db06da5-2480-4da1-ad58-895eb1917be9	0608508091	truongphu96@yahoo.com	92096 Hồ Shoals	2026-01-07 04:06:45.062	2026-01-07 04:06:45.062	Đoàn Minh Thủy
3fae371a-0647-4df4-abe1-2569dcd4d274	0044662730	truclam93@yahoo.com	72982 Quốc Hoàng Key	2026-01-07 04:06:45.062	2026-01-07 04:06:45.062	Tăng Gia Đạo
cb24110c-e90e-4329-8b81-50d993ca721d	0223176323	thanhhuy28@yahoo.com	171 Đoàn Walks	2026-01-07 04:06:45.062	2026-01-07 04:06:45.062	Phan Phương Diễm
3a1bceb4-ffaf-44ff-a3c4-ee256460d999	0532227158	minhnhu.ly0@yahoo.com	83960 Ngọc Yến Coves	2026-01-07 04:06:45.062	2026-01-07 04:06:45.062	Ngô Hải Giang
cb9a379e-6c3a-4e5d-aa8d-ee479fd9d1ce	0481090296	mailien_7koan96@gmail.com	130 Thiện Minh Gardens	2026-01-07 04:06:45.062	2026-01-07 04:06:45.062	Phạm Nhật Lệ
b4c92c08-88a9-4fbf-889d-6bfc5a61e7a2	0448891869	xuanlieu_vu75@hotmail.com	3986 Tăng Row	2026-01-07 04:06:45.062	2026-01-07 04:06:45.062	Hồ Thu Hậu
1fecf8c7-a05d-4431-bc89-a72fa49114f5	0915099506	hongthuy_ha21@hotmail.com	4864 Trung Thực Rapids	2026-01-07 04:06:45.062	2026-01-07 04:06:45.062	Lê Bảo Định
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
a3f1449b-c861-4637-9923-c3621e0e4b1f	huelan_le47@gmail.com	$2b$10$UdHxFNw78vBZUco7Qd7w8eoJtPGR8Ek3Y0JEgNQdIt45e9tDcziG.	Lê Huệ Lan	USER	t	2026-01-07 04:06:44.962	2026-01-23 16:16:45.669	6737 Quế Lâm Falls		http://localhost:5000/uploads/1769012310676-944293210.png
d14480c0-ed03-4e5d-86a1-53072605e78b	truccuong.ngo@gmail.com	$2b$10$UdHxFNw78vBZUco7Qd7w8eoJtPGR8Ek3Y0JEgNQdIt45e9tDcziG.	Ngô Trúc Cường	USER	t	2026-01-07 04:06:44.962	2026-01-24 01:54:54.685	Hồ Chí Minh	0333667	http://localhost:5000/uploads/1768991880772-549422337.png
\.


--
-- Data for Name: Order; Type: TABLE DATA; Schema: public; Owner: postgresql
--

COPY public."Order" (id, "orderCode", "totalAmount", status, "customerId", "createdAt", "updatedAt", "userId", note, "deliveryStatus", "deliveryAddress") FROM stdin;
2422f1be-1eb7-4743-bec1-dea2a9af606a	1768400606245	136500	PAID	\N	2026-01-14 14:23:26.248	2026-01-15 11:17:06.212	a3f1449b-c861-4637-9923-c3621e0e4b1f		CONFIRMED	6737 Quế Lâm Falls
1a954978-34b0-4597-a9d0-38127b9117c0	1768315080600	80000	PENDING	\N	2026-01-13 14:38:00.601	2026-01-14 13:38:07.483	390cedfa-55cc-46ff-81e8-e735516e4ac7		PREPARING	53068 Trung Nhân Ways
86cbf853-d932-4dbe-8b45-1721663529f9	1768315751940	30000	PENDING	\N	2026-01-13 14:49:11.942	2026-01-14 16:40:34.941	390cedfa-55cc-46ff-81e8-e735516e4ac7		DELIVERED	53068 Trung Nhân Ways
7475ae1e-aaac-4dda-b496-67d9de110a63	1768315051035	46000	PENDING	\N	2026-01-13 14:37:31.036	2026-01-14 13:38:09.984	390cedfa-55cc-46ff-81e8-e735516e4ac7		SHIPPING	53068 Trung Nhân Ways
d9040918-1380-482c-8aa9-18c8a29c25a1	1768315384524	420000	PENDING	\N	2026-01-13 14:43:04.525	2026-01-14 14:50:09.953	390cedfa-55cc-46ff-81e8-e735516e4ac7		SHIPPING	53068 Trung Nhân Ways
3ab0e81b-ef43-4102-9169-fe2f707669be	1768304441993	192000	PAID	\N	2026-01-13 11:40:41.995	2026-01-14 13:40:22.212	390cedfa-55cc-46ff-81e8-e735516e4ac7		SHIPPING	53068 Trung Nhân Ways
0147b315-f2ca-4a0d-8601-6793f7142aa8	1768366093247	396900	PAID	\N	2026-01-14 04:48:13.261	2026-01-15 11:20:45.468	390cedfa-55cc-46ff-81e8-e735516e4ac7		CONFIRMED	53068 Trung Nhân Ways
bf9857e4-65b8-479c-89b7-bd1463c87efc	1768304387798	192000	PENDING	\N	2026-01-13 11:39:47.8	2026-01-14 13:40:23.642	390cedfa-55cc-46ff-81e8-e735516e4ac7		DELIVERED	53068 Trung Nhân Ways
0c834ba2-e959-4590-b975-fd23fffaed47	1768396289637	970000	PENDING	\N	2026-01-14 13:11:29.656	2026-01-15 10:50:40.919	a3f1449b-c861-4637-9923-c3621e0e4b1f		SHIPPING	6737 Quế Lâm Falls
957b67cf-2076-4647-a23f-11a155fb50f6	1768315496752	30000	PENDING	\N	2026-01-13 14:44:56.753	2026-01-14 15:44:58.664	390cedfa-55cc-46ff-81e8-e735516e4ac7		PREPARING	53068 Trung Nhân Ways
371a1a87-3384-421e-8779-411206a589e0	1768314252226	715000	PENDING	\N	2026-01-13 14:24:12.245	2026-01-14 15:46:52.005	390cedfa-55cc-46ff-81e8-e735516e4ac7	Giao dưới chung cư, gửi bảo vệ	SHIPPING	53068 Trung Nhân Ways
2cf688e4-c0f1-434a-b485-28785a3c0333	1768315770532	25000	PAID	\N	2026-01-13 14:49:30.533	2026-01-14 16:33:22.803	390cedfa-55cc-46ff-81e8-e735516e4ac7		ORDERED	53068 Trung Nhân Ways
22ce9930-b248-4b1e-a681-206f59bb1361	1768315345082	46000	PENDING	\N	2026-01-13 14:42:25.084	2026-01-14 13:40:39.008	390cedfa-55cc-46ff-81e8-e735516e4ac7		CONFIRMED	53068 Trung Nhân Ways
7c7f3d65-8fcc-4a7c-a1c2-c309ea5d038a	1768315273969	64000	PENDING	\N	2026-01-13 14:41:13.97	2026-01-14 13:40:52.101	390cedfa-55cc-46ff-81e8-e735516e4ac7		DELIVERED	53068 Trung Nhân Ways
2fc15446-87d3-4ab9-affc-0935f69f6379	1768382114430	495000	PAID	\N	2026-01-14 09:15:14.444	2026-01-15 10:50:43.303	390cedfa-55cc-46ff-81e8-e735516e4ac7		ORDERED	53068 Trung Nhân Ways
abca074b-a89d-46a4-b5f9-b961b02ec689	1768477499544	955500	PAID	\N	2026-01-15 11:44:59.553	2026-01-23 04:03:12.167	a3f1449b-c861-4637-9923-c3621e0e4b1f	Giao buổi sáng, bấm chuông trước khi giao	DELIVERED	Landmark 81 Hà Nội
c3a64c59-e206-4494-97af-b90c7578fd6e	1768315604226	39900	PENDING	\N	2026-01-13 14:46:44.228	2026-01-14 16:33:27.105	390cedfa-55cc-46ff-81e8-e735516e4ac7		SHIPPING	53068 Trung Nhân Ways
e09b2590-bee6-4e6f-92d2-366f9f956504	1768315826508	30000	PENDING	\N	2026-01-13 14:50:26.51	2026-01-14 15:40:58.124	390cedfa-55cc-46ff-81e8-e735516e4ac7		PREPARING	53068 Trung Nhân Ways
afd6a717-3e43-40fa-a280-2f67ae4f7a65	1768380690053	39900	PENDING	\N	2026-01-14 08:51:30.068	2026-01-15 10:50:34.438	390cedfa-55cc-46ff-81e8-e735516e4ac7		DELIVERED	53068 Trung Nhân Ways
308e5a79-bcb1-4b79-9b69-6602db581b18	1769002886970	166050	PAID	\N	2026-01-21 13:41:26.978	2026-01-21 13:42:03.589	d14480c0-ed03-4e5d-86a1-53072605e78b		ORDERED	Hồ Chí Minh
cc63ae26-fc71-49af-862a-76a985677abc	1768968134654	138000	PENDING	\N	2026-01-21 04:02:14.662	2026-01-21 15:24:31.125	d14480c0-ed03-4e5d-86a1-53072605e78b	Giao giờ ngoài hành chính	PREPARING	8958 Minh Tú Fork
8f9c8caa-6402-4290-9405-c9b98709f25d	1768233502161	105500	PAID	\N	2026-01-12 15:58:22.175	2026-01-21 15:24:34.165	d14480c0-ed03-4e5d-86a1-53072605e78b	Giao hàng giờ hành chính	DELIVERED	Hồ Chí Minh
41fcc634-920f-4c2f-b6a7-004f53e87c89	1768385582033	22500	PENDING	\N	2026-01-14 10:13:02.051	2026-01-21 15:42:08.703	d14480c0-ed03-4e5d-86a1-53072605e78b		SHIPPING	8958 Minh Tú Fork
f3330fb3-8ef5-44c7-be28-570958aec436	1769141205565	90000	PAID	\N	2026-01-23 04:06:45.574	2026-01-23 04:09:05.749	d14480c0-ed03-4e5d-86a1-53072605e78b		DELIVERED	Hồ Chí Minh
efba1556-ded9-40c6-bf9a-c5333de33055	1769141736393	769200	PENDING	\N	2026-01-23 04:15:36.402	2026-01-23 04:16:54.292	390cedfa-55cc-46ff-81e8-e735516e4ac7		DELIVERED	53068 Trung Nhân Ways
18b8c2ed-f902-40d5-8d31-16ab1868832f	1768301822244	1398700	PENDING	\N	2026-01-13 10:57:02.27	2026-01-13 10:57:02.27	390cedfa-55cc-46ff-81e8-e735516e4ac7	Giao giờ hành chính	ORDERED	53068 Trung Nhân Ways
cd74b1a0-bd64-40b5-b67a-f753d2c29a81	1768303554228	966800	PENDING	\N	2026-01-13 11:25:54.23	2026-01-13 11:25:54.23	390cedfa-55cc-46ff-81e8-e735516e4ac7		ORDERED	53068 Trung Nhân Ways
d50f5f92-b4e7-43b0-b09a-2c6eb7a62ed7	1768304325186	385650	PENDING	\N	2026-01-13 11:38:45.188	2026-01-13 11:38:45.188	390cedfa-55cc-46ff-81e8-e735516e4ac7	Cà phê không đá	ORDERED	Hà Nội
fe62891a-f6b6-41f8-8894-7c3dd9ab1a7f	1768314472465	120000	PENDING	\N	2026-01-13 14:27:52.467	2026-01-13 14:27:52.467	390cedfa-55cc-46ff-81e8-e735516e4ac7		ORDERED	53068 Trung Nhân Ways
f53e608c-c095-49b6-9be9-db91b46245fb	1768315218973	136500	PENDING	\N	2026-01-13 14:40:18.974	2026-01-13 14:40:18.974	390cedfa-55cc-46ff-81e8-e735516e4ac7		ORDERED	53068 Trung Nhân Ways
2b45e417-a496-4ba5-81f9-83fe4d24861e	1768315244968	90550	PENDING	\N	2026-01-13 14:40:44.97	2026-01-13 14:40:44.97	390cedfa-55cc-46ff-81e8-e735516e4ac7		ORDERED	53068 Trung Nhân Ways
6f584aef-4432-445b-be95-7c0769141dae	1768315435885	41000	PENDING	\N	2026-01-13 14:43:55.887	2026-01-13 14:43:55.887	390cedfa-55cc-46ff-81e8-e735516e4ac7		ORDERED	53068 Trung Nhân Ways
cd396ea6-93c5-4593-82a3-91f0cf9f177f	1768303732698	1135000	PENDING	\N	2026-01-13 11:28:52.699	2026-01-13 11:28:52.699	390cedfa-55cc-46ff-81e8-e735516e4ac7	Giao buổi tối	ORDERED	Landmark 81
eb586c8d-ec57-4a94-9921-2e9174a328a7	1768303797293	715000	PENDING	\N	2026-01-13 11:29:57.295	2026-01-13 11:29:57.295	390cedfa-55cc-46ff-81e8-e735516e4ac7		ORDERED	53068 Trung Nhân Ways
6eea9c08-f20c-45f5-bc55-4825d98f757e	1768303925864	191650	PENDING	\N	2026-01-13 11:32:05.867	2026-01-13 11:32:05.867	390cedfa-55cc-46ff-81e8-e735516e4ac7		ORDERED	53068 Trung Nhân Ways
ef178d0d-e94f-4a21-a6d8-d7ebefa8de75	1768314384326	87000	PENDING	\N	2026-01-13 14:26:24.327	2026-01-13 14:26:24.327	390cedfa-55cc-46ff-81e8-e735516e4ac7		ORDERED	53068 Trung Nhân Ways
b9664434-4ad1-4fd3-ac29-7dd418ed7a0f	1768314421581	22500	PENDING	\N	2026-01-13 14:27:01.584	2026-01-13 14:27:01.584	390cedfa-55cc-46ff-81e8-e735516e4ac7		ORDERED	53068 Trung Nhân Ways
646489fd-32e6-42a3-877c-51f8bf58e27d	1768968191565	2501200	PAID	\N	2026-01-21 04:03:11.567	2026-01-23 04:05:41.677	d14480c0-ed03-4e5d-86a1-53072605e78b		DELIVERED	8958 Minh Tú Fork
8b05142f-4473-4b38-b242-211302c52b75	1769274852954	4299900	PAID	\N	2026-01-24 17:14:12.963	2026-01-26 09:28:01.475	a3f1449b-c861-4637-9923-c3621e0e4b1f		ORDERED	6737 Quế Lâm Falls
e51d7a29-d1dc-4464-8409-0be07e2ea15e	1769443063183	1169350	PENDING	\N	2026-01-26 15:57:43.192	2026-01-26 15:57:43.192	ea45eb1d-8b2f-4629-8630-c15b79f0441c	Trả góp 10%	CONFIRMED	Hồ Chí Minh
cdf02c79-820b-4dd6-bee3-d21385cbecbc	1769443281313	860000	PENDING	\N	2026-01-26 16:01:21.314	2026-01-26 16:01:21.314	d9405959-37b1-438e-a0b2-c03a3462d55c	Trả góp 10%	CONFIRMED	Landmark 81
0aece8c0-1b48-4c1d-bcde-fbd6cce6736e	1769487419506	1178700	PAID	\N	2026-01-27 04:16:59.515	2026-01-27 04:16:59.515	ada9ede4-328e-46fc-bd40-4f9384674d46	Giao giờ hành chính	CONFIRMED	Khu công nghiệp Thủ Đức
f18937d3-87d3-4e88-966d-ef7bc385f2be	1769529540825	1003200	PAID	\N	2026-01-27 15:59:00.834	2026-01-27 15:59:32.207	d14480c0-ed03-4e5d-86a1-53072605e78b	Hello	ORDERED	6737 Quế Lâm Falls
\.


--
-- Data for Name: Product; Type: TABLE DATA; Schema: public; Owner: postgresql
--

COPY public."Product" (id, name, sku, price, description, "isActive", "categoryId", "createdAt", "updatedAt", "imagesUrl", slug, stock, "ratingAvg", "ratingCount", "soldCount") FROM stdin;
f5ce71be-353e-4933-89c0-6653d3e9f3d0	Bánh chuối hạt dinh dưỡng	SKU-UDQWFJ	39000	Bánh chuối vị Socola	t	cb8192f2-7ddb-4611-8cf6-6c22aae6a534	2026-01-12 04:06:12.821	2026-01-19 04:57:10.554	{http://localhost:5000/uploads/1768190771809-978727161.png}	banh-chuoi-hat-dinh-duong	10	0	0	0
8c4a6223-e86a-471f-aae5-0487c7d06bda	Khô bò xé Hải Châu	SKU-RQDCEV	119000	Hũ 100g	t	cb8192f2-7ddb-4611-8cf6-6c22aae6a534	2026-01-12 07:20:18.561	2026-01-19 04:57:10.554	{http://localhost:5000/uploads/1768202383486-941420044.jpg}	kho-bo-xe-hai-chau	40	0	0	0
00bcd6a5-cd01-45ab-8a84-1af5984d0e94	Cà phê Đà Lạt	SKU-97W6N3	35550	Cà phê Arabica Đà Lạt đậm đà hoà quyện cùng kem whipping thơm ngậy.	t	7ca58ff4-6b27-44b8-a83d-4be20d95a1cd	2026-01-12 11:31:32.549	2026-01-26 15:57:43.224	{http://localhost:5000/uploads/1768217491522-405899145.jpg}	ca-phe-da-lat	88	5	1	0
bb76bda1-0e80-4005-a5f6-1c49b68bce7a	Cà phê nâu đặc biệt	SKU-LS00FY	25000	Vị nguyên bản của cà phê	t	7ca58ff4-6b27-44b8-a83d-4be20d95a1cd	2026-01-12 03:56:53.115	2026-01-21 13:41:26.994	{http://localhost:5000/uploads/1768190209359-825797487.jpg}	ca-phe-nau-dac-biet	49	0	0	0
6c32938e-6ab2-4158-ac79-d8e55b4ba883	Bánh quy nougat kem sữa Richy Kenju	SKU-SEJI3E	46000	Gói 186g	t	cb8192f2-7ddb-4611-8cf6-6c22aae6a534	2026-01-12 11:25:55.314	2026-01-27 04:16:59.549	{http://localhost:5000/uploads/1768217153671-309965900.jpg}	banh-quy-nougat-kem-sua-richy-kenju	90	0	0	0
fd2c00be-1600-403e-8602-05600d301a83	Bánh tráng khô bò Vi	SKU-1ST7SQ	22000	Gói 55g	t	cb8192f2-7ddb-4611-8cf6-6c22aae6a534	2026-01-12 07:21:37.808	2026-01-27 04:16:59.557	{http://localhost:5000/uploads/1768202496783-617604854.jpg}	banh-trang-kho-bo-vi	117	0	0	0
d9bd9a8c-5aed-4255-ac7a-36c7db86ad7f	Cà phê đen	SKU-R1MMYP	30000	Cà phê đen không đường	t	7ca58ff4-6b27-44b8-a83d-4be20d95a1cd	2026-01-12 03:34:34.451	2026-01-22 15:43:41.488	{http://localhost:5000/uploads/1768188872730-487161490.jpg}	ca-phe-den-mau-1	99	5	1	0
830b506d-b5a3-4aa4-9246-c5a01d7f357d	Bánh gạo chà bông JinJu Richy	SKU-OL4N9Q	39900	Gói 168g	t	cb8192f2-7ddb-4611-8cf6-6c22aae6a534	2026-01-12 11:26:43.284	2026-01-27 15:59:00.854	{http://localhost:5000/uploads/1768217201817-848963933.jpg}	banh-gao-cha-bong-jinju-richy	186	4	3	0
7c879a78-4b81-4b57-b9da-6d3f4019e3ef	Bánh kem ốc quế vị sô cô la Pororo	SKU-E6FJMH	64000	Hộp 54g	t	cb8192f2-7ddb-4611-8cf6-6c22aae6a534	2026-01-12 11:27:36.027	2026-01-27 15:59:00.857	{http://localhost:5000/uploads/1768217255226-114193266.jpg}	banh-kem-oc-que-vi-so-co-la-pororo	179	3	3	0
6f3df853-178a-493c-8cad-e8a68e245ba9	Bánh gạo Hàn Quốc Richy	SKU-EL2Z0Y	41000	Gói 303g	t	cb8192f2-7ddb-4611-8cf6-6c22aae6a534	2026-01-12 11:24:16.762	2026-01-26 15:57:43.239	{http://localhost:5000/uploads/1768217055595-198380405.jpg}	banh-gao-han-quoc-richy	116	0	0	0
7d4097a8-4981-49ac-a61c-8836709ca8d7	Bánh gạo An vị tự nhiên Orion	SKU-D7SV1V	22500	Gói 151.2g	t	cb8192f2-7ddb-4611-8cf6-6c22aae6a534	2026-01-12 11:28:19.254	2026-01-27 04:16:59.538	{http://localhost:5000/uploads/1768217278721-360001158.jpg}	banh-gao-an-vi-tu-nhien-orion	189	4.3	3	0
8ece4d0d-6ca0-4d4c-b731-07387eedc8a9	Bánh Tiramisu	SKU-ZUQA3G	45500	Bánh ngọt lạnh	t	460b0ebd-98a8-4cdc-b995-75a86b321511	2026-01-12 03:30:34.375	2026-01-21 13:41:27.001	{http://localhost:5000/uploads/1768188632898-356659879.png}	banh-tiramisu-mau-1	99	0	0	0
0abf7597-6c23-481e-9f27-8f226906f61d	Bạc sỉu vị Vani	SKU-Z4LOO2	30000	(Có sẵn Thạch) Vị chua nhẹ tự nhiên của hạt Arabica Lạc Dương & Robusta Lâm Hà, hoà quyện cùng Vani Tự Nhiên, Thạch Xỉu Vani mềm mượt và Sữa Tươi Thanh Trùng đem đến hương vị đậm mượt đầy tinh tế.	t	7ca58ff4-6b27-44b8-a83d-4be20d95a1cd	2026-01-12 11:30:18.072	2026-01-23 05:15:11.129	{http://localhost:5000/uploads/1768217410171-921576460.jpg}	bac-siu-vi-vani	0	4	3	3
d3a3e4be-4b14-4041-a663-55b353aa7ef5	BAD F1 JERSEY	SKU-4DUC9W	420000	•Thiết kế: form oversize hiện đại, màu sắc phối hài hòa, phù hợp cho mọi outfit từ casual đến sporty.\n\nChất liệu: Vải mè cao cấp, thoáng khí, giúp bạn luôn thoải mái khi mặc.\n\nKỹ thuật: In lụa sắc nét kết hợp với patch thêu và ép cao thành, tạo hiệu ứng nổi bật và bền bỉ theo thời gian.	t	c529266e-7706-4809-b784-cfcb81596e20	2026-01-12 07:32:49.446	2026-01-24 17:14:12.996	{http://localhost:5000/uploads/1768203167251-334553119.jpg}	bad-f1-jersey	16	5	1	0
3d24a690-6ae8-4f35-9cbe-6e5cc69aa804	Bánh quy Petit Beurre Lu	SKU-DID84P	256000	Hộp 600g	t	cb8192f2-7ddb-4611-8cf6-6c22aae6a534	2026-01-12 11:16:08.506	2026-01-24 17:14:12.998	{http://localhost:5000/uploads/1768216563641-965468031.jpg}	banh-quy-petit-beurre-lu	95	0	0	0
c2847fe7-ff94-4b8a-b1b0-9de05d9d0cc9	SUPERTRAMP MULTI-POCKET SHORTS	SKU-VAVADN	550000	Được phát triển từ tinh thần outdoor trekking, thiết kế này tập trung vào tính ứng dụng cao, phom dáng gọn gàng và chất liệu bền bỉ. SUPERTRAMP MULTI-POCKET SHORTS là lựa chọn không thể thiếu trong hành trang của những kẻ nghiện dịch chuyển.\n\n- Form dáng: Oversize\n- Chất liệu: Dù 100% nylon\n- Kỹ thuật: Hệ thống túi chuyên dụng, hệ thống thoáng khí, patch logo kết hợp in cao thành	t	c529266e-7706-4809-b784-cfcb81596e20	2026-01-12 07:33:47.12	2026-01-26 16:01:21.328	{http://localhost:5000/uploads/1768203225384-731602653.jpg}	supertramp-multi-pocket-shorts	27	4.3	3	0
9c75a5b6-b8e7-4011-bec5-70c4fca2567c	Bánh quy yến mạch mix 3 vị Quaker	SKU-QGJXWD	109000	Hộp thiếc (3g)	t	cb8192f2-7ddb-4611-8cf6-6c22aae6a534	2026-01-12 11:13:56.658	2026-01-27 04:16:59.552	{http://localhost:5000/uploads/1768216434480-806957610.jpg}	banh-quy-yen-mach-mix-3-vi-quaker	94	0	0	0
a143eb0d-f88a-4714-8422-0fd64412e9b2	Bánh Choco Pie Orion	SKU-01K9DG	52000	Hộp 33g x 12 gói	t	cb8192f2-7ddb-4611-8cf6-6c22aae6a534	2026-01-12 11:15:12.712	2026-01-27 15:59:00.845	{http://localhost:5000/uploads/1768216511180-881893158.jpg}	banh-choco-pie-orion	95	0	0	0
368eca33-d24c-46fc-9109-6e8c24e2195a	Bắp hoa bò Úc cắt lát Freshfoco	SKU-2EBAME	99900	Khay 175g	t	488c4285-9071-4ddd-915a-7a46fac093b5	2026-01-19 04:40:46.945	2026-01-26 15:57:43.222	{http://localhost:5000/uploads/1768797644981-214166711.jpg}	bap-hoa-bo-uc-cat-lat-freshfoco	92	0	0	5
b97aae67-431a-4ca4-a59d-f42de7a5a78a	Bánh gạo cuộn vị phô mai Want Want	SKU-T6OA8R	29000	Gói 170g	t	cb8192f2-7ddb-4611-8cf6-6c22aae6a534	2026-01-12 11:21:14.804	2026-01-26 15:57:43.243	{http://localhost:5000/uploads/1768216847062-532398150.jpg}	banh-gao-cuon-vi-pho-mai-want-want	399	5	2	0
4e553107-51fd-4697-87f1-c8c17d33ac8e	Monster Energy Vị Nguyên Bản	SKU-8QIB10	29000	🧃 Monster Energy — Nước tăng lực năng lượng mạnh mẽ\n\nMonster Energy là một thương hiệu nước tăng lực carbonat được sản xuất bởi Monster Beverage Corporation (Mỹ), ra mắt lần đầu vào năm 2002.\n\n🔥 Mô tả chung\n\nĐây là một loại nước tăng lực có hàm lượng caffeine cao, được pha với nhiều thành phần khác nhằm tăng cường tỉnh táo và năng lượng cho cơ thể khi mệt mỏi hoặc cần tập trung.\n\nSản phẩm thường được đóng trong lon 500 ml (tại nhiều thị trường) với thiết kế đồ họa mạnh mẽ, nổi bật và cá tính.\n\n🌟 Thành phần chính\n\nNước có ga\n\nCaffeine — chất kích thích giúp tỉnh táo, giảm mệt mỏi\n\nTaurine, L-Carnitine, Glucuronolactone, Inositol — các hợp chất thường thấy trong nước tăng lực\n\nVitamin nhóm B (B2, B3, B6, B12) — hỗ trợ chuyển hóa năng lượng\n\nHương liệu tự nhiên / tổng hợp, đường hoặc không đường tùy loại\n(Ghi chú: thành phần có thể khác nhau theo từng dòng sản phẩm và từng thị trường).\n\n💥 Công dụng chính\n\nTăng cường năng lượng nhanh khi bạn cần tỉnh táo.\n\nHỗ trợ tập trung và giảm mệt mỏi trong học tập, làm việc, lái xe, chơi game hoặc trước buổi tập thể thao.\n\nDòng sản phẩm có cả phiên bản không đường (Zero Sugar / Ultra) phù hợp với người muốn giảm lượng calo.\n\n🍹 Các dòng phổ biến\n\nMonster không chỉ có một hương vị:\n\nMonster Original — vị đặc trưng ngọt-mặn nhẹ, tinh thần “Unleash the Beast!”.\n\nZero Sugar / Ultra — không đường, hương nhẹ dễ uống.\n\nJuice Monster — kết hợp hương trái cây (ví dụ: Mango Loco vị xoài).\n\nJava Monster — pha cà phê + năng lượng.\n…và nhiều hương vị khác trên toàn cầu.\n\n⚠️ Lưu ý khi sử dụng\n\nSản phẩm có hàm lượng caffeine cao, không nên dùng quá liều trong ngày.\n\nKhông khuyến nghị cho phụ nữ mang thai, trẻ em, người mẫn cảm với caffeine.\n\nNên uống lạnh để cảm nhận hương vị tốt nhất.	t	286631c0-b3b3-4055-8b3f-b8a3b0637648	2026-01-12 04:09:35.426	2026-01-26 16:01:21.331	{http://localhost:5000/uploads/1768190973801-170466901.png,http://localhost:5000/uploads/1768193416980-425570219.png}	monster-energy-vi-nguyen-ban	245	0	0	0
01a527db-a675-416d-9c1f-5f0ceb5bb08a	Thịt bò tơ Fohla	SKU-TRVCLX	89900	Khay 200g	t	488c4285-9071-4ddd-915a-7a46fac093b5	2026-01-19 04:41:39.018	2026-01-27 04:16:59.532	{http://localhost:5000/uploads/1768797697791-63118460.jpg}	thit-bo-to-fohla	187	0	0	3
44808874-2789-4e32-a215-7ea6ab3ec556	Bánh gạo Nhật vị shouyu mật ong Ichi	SKU-91BTB5	40000	Gói 180g	t	cb8192f2-7ddb-4611-8cf6-6c22aae6a534	2026-01-12 11:22:03.819	2026-01-26 15:57:43.241	{http://localhost:5000/uploads/1768216922909-332419801.jpg}	banh-gao-nhat-vi-shouyu-mat-ong-ichi	293	0	0	0
503bc40b-a82f-4c51-a7d2-a85738e2ea9a	Bánh quy Kenju rau củ Richy	SKU-7RRCX0	46000	Gói 192g	t	cb8192f2-7ddb-4611-8cf6-6c22aae6a534	2026-01-12 11:20:02.247	2026-01-27 14:28:55.447	{http://localhost:5000/uploads/1768216800820-728930129.jpg}	banh-quy-kenju-rau-cu-richy	497	5	1	0
3ad8ce5f-5226-4e41-b2ff-26418022a523	Bánh gạo An vị tảo biển Orion	SKU-ZY7Y7V	22500	Gói 111.3g	t	cb8192f2-7ddb-4611-8cf6-6c22aae6a534	2026-01-12 11:17:59.213	2026-01-27 15:59:00.85	{http://localhost:5000/uploads/1768216676541-314478669.jpg}	banh-gao-an-vi-tao-bien-orion	8	0	0	0
bb4270d7-0796-486c-9368-906b32d3438c	Bánh trứng muối Sheng Tian	SKU-NBFW1F	75000	Gói 180g	t	cb8192f2-7ddb-4611-8cf6-6c22aae6a534	2026-01-12 11:23:33.536	2026-01-27 15:59:00.852	{http://localhost:5000/uploads/1768217012537-77428079.jpg}	banh-trung-muoi-sheng-tian	93	0	0	0
27cc074c-8684-4b0e-843a-bf82fd542fc7	CROSS CUT POLO / Black-Grey Color	SKU-2E462F	165000	‼️LƯU Ý ▪️Khi giặt sản phẩm bằng tay: Vui lòng hoà tan kĩ nước giặt, bột giặt với nước sau đó mới cho sản phẩm vào. ▪️Khi giặt sản phẩm bằng máy giặt: Vui lòng đổ nước giặt, bột giặt vào khay của máy.\n\n 🚫TUYỆT ĐỐI KHÔNG đổ nước giặt, bột giặt trực tiếp vào sản phẩm. Như vậy sẽ ảnh hưởng đến màu sắc của sản phẩm và làm cho áo có tình trạng loang màu. Shop xin cảm ơn ạ🖤\n\n🔹 Chính sách đổi trả Shop.\n– Miễn phí đổi hàng cho khách mua ở Shop trong trường hợp bị lỗi từ nhà sản xuất, giao nhầm hàng, nhầm size.\n- Quay video mở sản phẩm khi nhận hàng, nếu không có video unbox, khi phát hiện lỗi phải báo ngay cho Shop trong 1 ngày tính từ ngày giao hàng thành công. Qua 1 ngày chúng mình không giải quyết khi không có video unbox.\n– Sản phẩm đổi trong thời gian 3 ngày kể từ ngày nhận hàng\n– Sản phẩm còn mới nguyên tem, tags, sản phẩm chưa giặt và không dơ bẩn, hư hỏng bởi những tác nhân bên ngoài cửa hàng sau khi mua hàng.\n👉 Đặc biệt:\n– Tất cả sản phẩm ver 3.0 sẽ được hỗ trợ trả hàng hoàn tiền trong vòng 05 ngày kể từ ngày nhận hàng nếu có trải nghiệm không tốt, không hài lòng về sản phẩm\n– Chấp nhận trả hàng hoàn tiền với sản phẩm đã qua sử dụng, không còn nguyên tag tuy nhiên sản phẩm phải còn nguyên vẹn, không bị rách, bung chỉ, bạc màu do quá trình sử dụng	t	c529266e-7706-4809-b784-cfcb81596e20	2026-01-12 07:25:16.36	2026-01-26 16:01:21.321	{http://localhost:5000/uploads/1768202715044-201063080.jpg,http://localhost:5000/uploads/1768230041491-77062467.jpg,http://localhost:5000/uploads/1768230041503-552863892.jpg}	cross-cut-polo-black-grey-color	99	0	0	0
\.


--
-- Data for Name: OrderItem; Type: TABLE DATA; Schema: public; Owner: postgresql
--

COPY public."OrderItem" (id, "orderId", "productId", quantity, price) FROM stdin;
aa026266-d534-49d6-bd5d-7d560af521aa	8f9c8caa-6402-4290-9405-c9b98709f25d	d9bd9a8c-5aed-4255-ac7a-36c7db86ad7f	2	30000
d7b0c155-0d68-4782-8dcd-bccd31856571	8f9c8caa-6402-4290-9405-c9b98709f25d	8ece4d0d-6ca0-4d4c-b731-07387eedc8a9	1	45500
cc8fe29c-6eb3-4fda-94f4-1b3de574161f	18b8c2ed-f902-40d5-8d31-16ab1868832f	7d4097a8-4981-49ac-a61c-8836709ca8d7	2	22500
fef1680a-ddbf-4899-a222-a04788927b74	18b8c2ed-f902-40d5-8d31-16ab1868832f	7c879a78-4b81-4b57-b9da-6d3f4019e3ef	3	64000
3a5f6f95-f26e-4fbe-bafa-e694d5227aaf	18b8c2ed-f902-40d5-8d31-16ab1868832f	830b506d-b5a3-4aa4-9246-c5a01d7f357d	3	39900
fa5438a6-525f-498b-875c-e3d2fc2c518b	18b8c2ed-f902-40d5-8d31-16ab1868832f	6c32938e-6ab2-4158-ac79-d8e55b4ba883	1	46000
15429d50-3d24-4b43-a4a9-975f080c3e1a	18b8c2ed-f902-40d5-8d31-16ab1868832f	6f3df853-178a-493c-8cad-e8a68e245ba9	1	41000
4c475209-33da-40fd-a93c-e414f88fb523	18b8c2ed-f902-40d5-8d31-16ab1868832f	bb4270d7-0796-486c-9368-906b32d3438c	2	75000
43cdbb4e-49b5-4320-81f2-f9e67e2869b8	18b8c2ed-f902-40d5-8d31-16ab1868832f	44808874-2789-4e32-a215-7ea6ab3ec556	1	40000
2cb56cb8-f608-43a4-93ef-48e78ba7ea04	18b8c2ed-f902-40d5-8d31-16ab1868832f	b97aae67-431a-4ca4-a59d-f42de7a5a78a	1	29000
ef5626ce-3da9-4078-8107-0617a22601be	18b8c2ed-f902-40d5-8d31-16ab1868832f	a143eb0d-f88a-4714-8422-0fd64412e9b2	2	52000
485bab79-cf55-481b-8dce-80734277ccd9	18b8c2ed-f902-40d5-8d31-16ab1868832f	9c75a5b6-b8e7-4011-bec5-70c4fca2567c	1	109000
b45d2aee-7345-4283-9a5a-b8799022b6d6	18b8c2ed-f902-40d5-8d31-16ab1868832f	fd2c00be-1600-403e-8602-05600d301a83	2	22000
7ce23265-d0c3-4df6-a042-347c5b24d72c	18b8c2ed-f902-40d5-8d31-16ab1868832f	8c4a6223-e86a-471f-aae5-0487c7d06bda	2	119000
c4e16a5d-851c-4012-ba6c-4c5a0266a2e2	18b8c2ed-f902-40d5-8d31-16ab1868832f	f5ce71be-353e-4933-89c0-6653d3e9f3d0	5	39000
c49d6114-d855-44df-a8ab-488a97456a7a	18b8c2ed-f902-40d5-8d31-16ab1868832f	503bc40b-a82f-4c51-a7d2-a85738e2ea9a	1	46000
2064c165-ebbd-407a-b730-16221d4d8d95	cd74b1a0-bd64-40b5-b67a-f753d2c29a81	7d4097a8-4981-49ac-a61c-8836709ca8d7	2	22500
09964c7c-830b-474a-ad2a-42f15dd0ff7c	cd74b1a0-bd64-40b5-b67a-f753d2c29a81	7c879a78-4b81-4b57-b9da-6d3f4019e3ef	2	64000
eb46f013-83c8-4127-8278-4d9ef0d64193	cd74b1a0-bd64-40b5-b67a-f753d2c29a81	830b506d-b5a3-4aa4-9246-c5a01d7f357d	2	39900
79a14647-7753-4629-b248-c9aecb9e5475	cd74b1a0-bd64-40b5-b67a-f753d2c29a81	bb4270d7-0796-486c-9368-906b32d3438c	2	75000
e72e1cfe-53f3-4a8d-8c02-8c7f78468af8	cd74b1a0-bd64-40b5-b67a-f753d2c29a81	44808874-2789-4e32-a215-7ea6ab3ec556	1	40000
c07f9164-0ff7-4a52-a0dc-78f8d604e7f3	cd74b1a0-bd64-40b5-b67a-f753d2c29a81	b97aae67-431a-4ca4-a59d-f42de7a5a78a	1	29000
69932b94-2008-4246-a375-f6f254d26a4d	cd74b1a0-bd64-40b5-b67a-f753d2c29a81	a143eb0d-f88a-4714-8422-0fd64412e9b2	2	52000
4026d62a-c3d4-497f-91a7-70c78b7048c0	cd74b1a0-bd64-40b5-b67a-f753d2c29a81	9c75a5b6-b8e7-4011-bec5-70c4fca2567c	1	109000
394ad594-32b6-4965-8d5e-7dc7ec25ccca	cd74b1a0-bd64-40b5-b67a-f753d2c29a81	fd2c00be-1600-403e-8602-05600d301a83	2	22000
63996105-2046-4752-a710-7a69938387a5	cd74b1a0-bd64-40b5-b67a-f753d2c29a81	8c4a6223-e86a-471f-aae5-0487c7d06bda	2	119000
4bc350be-181e-4cb5-81e5-1f8909eec2f5	cd396ea6-93c5-4593-82a3-91f0cf9f177f	27cc074c-8684-4b0e-843a-bf82fd542fc7	1	165000
21fc85be-d307-4acf-b0ed-a584c163f622	cd396ea6-93c5-4593-82a3-91f0cf9f177f	c2847fe7-ff94-4b8a-b1b0-9de05d9d0cc9	1	550000
5e471c14-6e61-4611-a740-6e8f44db391a	cd396ea6-93c5-4593-82a3-91f0cf9f177f	d3a3e4be-4b14-4041-a663-55b353aa7ef5	1	420000
e3adcb02-2164-4fe4-a420-6d07ed871906	eb586c8d-ec57-4a94-9921-2e9174a328a7	27cc074c-8684-4b0e-843a-bf82fd542fc7	1	165000
6349f756-b7a5-4b51-b7d3-a691b827fdd8	eb586c8d-ec57-4a94-9921-2e9174a328a7	c2847fe7-ff94-4b8a-b1b0-9de05d9d0cc9	1	550000
d352d667-ea62-4e77-8f0e-e5bc07210f8d	6eea9c08-f20c-45f5-bc55-4825d98f757e	00bcd6a5-cd01-45ab-8a84-1af5984d0e94	3	35550
8a0867db-d164-4d84-b470-2f02bef7ece4	6eea9c08-f20c-45f5-bc55-4825d98f757e	0abf7597-6c23-481e-9f27-8f226906f61d	2	30000
0e3e4032-6194-4ce6-98e4-5318b2b89775	6eea9c08-f20c-45f5-bc55-4825d98f757e	bb76bda1-0e80-4005-a5f6-1c49b68bce7a	1	25000
f40419fb-8172-4cae-b6a4-7a2c2502ad41	d50f5f92-b4e7-43b0-b09a-2c6eb7a62ed7	7c879a78-4b81-4b57-b9da-6d3f4019e3ef	3	64000
b66f6314-36f0-43ce-819a-6b04d27c895c	d50f5f92-b4e7-43b0-b09a-2c6eb7a62ed7	00bcd6a5-cd01-45ab-8a84-1af5984d0e94	3	35550
6db9cc74-be5e-48b8-8453-845e4ac026a6	d50f5f92-b4e7-43b0-b09a-2c6eb7a62ed7	4e553107-51fd-4697-87f1-c8c17d33ac8e	3	29000
152c0f0c-ab60-4ef2-a41f-5ced5607a014	bf9857e4-65b8-479c-89b7-bd1463c87efc	7c879a78-4b81-4b57-b9da-6d3f4019e3ef	3	64000
d78a3784-b7d4-4562-89c8-90cdfd8947e0	3ab0e81b-ef43-4102-9169-fe2f707669be	7c879a78-4b81-4b57-b9da-6d3f4019e3ef	3	64000
67c02125-7040-4975-8b77-3e9b3a9c72a1	371a1a87-3384-421e-8779-411206a589e0	27cc074c-8684-4b0e-843a-bf82fd542fc7	1	165000
c69639d2-fa65-4c77-b0ef-14fa04f917e3	371a1a87-3384-421e-8779-411206a589e0	c2847fe7-ff94-4b8a-b1b0-9de05d9d0cc9	1	550000
babc35ed-9ae6-4131-9080-ec33a2de018b	ef178d0d-e94f-4a21-a6d8-d7ebefa8de75	4e553107-51fd-4697-87f1-c8c17d33ac8e	3	29000
ad4ab61d-9565-4bf4-bf87-187558419459	b9664434-4ad1-4fd3-ac29-7dd418ed7a0f	7d4097a8-4981-49ac-a61c-8836709ca8d7	1	22500
77fac3f9-7906-4bce-977e-1d83e801974b	fe62891a-f6b6-41f8-8894-7c3dd9ab1a7f	4e553107-51fd-4697-87f1-c8c17d33ac8e	1	29000
680653e7-a0fd-465a-896c-23b0f0c537f5	fe62891a-f6b6-41f8-8894-7c3dd9ab1a7f	8ece4d0d-6ca0-4d4c-b731-07387eedc8a9	2	45500
1be587a2-d16c-44e7-bb6a-ef4787b52950	7475ae1e-aaac-4dda-b496-67d9de110a63	6c32938e-6ab2-4158-ac79-d8e55b4ba883	1	46000
ddb2c9f6-91a5-4a4e-898d-857e8354efd9	1a954978-34b0-4597-a9d0-38127b9117c0	44808874-2789-4e32-a215-7ea6ab3ec556	2	40000
4838e6a8-bbc1-4dd5-9a79-ebf7ef7d84a8	f53e608c-c095-49b6-9be9-db91b46245fb	8ece4d0d-6ca0-4d4c-b731-07387eedc8a9	3	45500
a2c34065-7ba8-4598-8c05-6ea8b0c98033	2b45e417-a496-4ba5-81f9-83fe4d24861e	00bcd6a5-cd01-45ab-8a84-1af5984d0e94	1	35550
c7ed7c71-b733-4a79-b093-46c429f05798	2b45e417-a496-4ba5-81f9-83fe4d24861e	bb76bda1-0e80-4005-a5f6-1c49b68bce7a	1	25000
46b80e54-4bf5-4e3a-bf2e-16ee96b8479e	2b45e417-a496-4ba5-81f9-83fe4d24861e	d9bd9a8c-5aed-4255-ac7a-36c7db86ad7f	1	30000
c9831820-b7d7-41b6-b209-1e0e8e514518	7c7f3d65-8fcc-4a7c-a1c2-c309ea5d038a	7c879a78-4b81-4b57-b9da-6d3f4019e3ef	1	64000
543a003c-bb33-47e4-a531-80996d280bac	22ce9930-b248-4b1e-a681-206f59bb1361	6c32938e-6ab2-4158-ac79-d8e55b4ba883	1	46000
e24ebc98-e38d-4c7a-a5e8-5caabcd662e8	d9040918-1380-482c-8aa9-18c8a29c25a1	d3a3e4be-4b14-4041-a663-55b353aa7ef5	1	420000
5a705176-30bf-42d9-b60b-1a22e8e5b17c	6f584aef-4432-445b-be95-7c0769141dae	6f3df853-178a-493c-8cad-e8a68e245ba9	1	41000
8ea8f518-1d25-4cb9-8898-ebfc30ec8814	957b67cf-2076-4647-a23f-11a155fb50f6	0abf7597-6c23-481e-9f27-8f226906f61d	1	30000
3ac5277d-72b7-4cdd-bfa1-16742c4fb750	c3a64c59-e206-4494-97af-b90c7578fd6e	830b506d-b5a3-4aa4-9246-c5a01d7f357d	1	39900
126a7bdc-30ff-400b-852b-4fe421ca2f0a	86cbf853-d932-4dbe-8b45-1721663529f9	0abf7597-6c23-481e-9f27-8f226906f61d	1	30000
499954f0-898b-4bb0-821b-128a5960ccc0	2cf688e4-c0f1-434a-b485-28785a3c0333	bb76bda1-0e80-4005-a5f6-1c49b68bce7a	1	25000
909e45cf-17a3-43ac-a3c3-e786e091cdf5	e09b2590-bee6-4e6f-92d2-366f9f956504	d9bd9a8c-5aed-4255-ac7a-36c7db86ad7f	1	30000
ce67994f-9fed-4d03-a0ba-9108af6f2315	0147b315-f2ca-4a0d-8601-6793f7142aa8	7d4097a8-4981-49ac-a61c-8836709ca8d7	1	22500
c36e916b-bfa1-4ba8-a434-3aa8705fc00d	0147b315-f2ca-4a0d-8601-6793f7142aa8	7c879a78-4b81-4b57-b9da-6d3f4019e3ef	3	64000
28cc7809-f36f-4810-b300-407d8b166795	0147b315-f2ca-4a0d-8601-6793f7142aa8	830b506d-b5a3-4aa4-9246-c5a01d7f357d	1	39900
9df136da-b99b-46ae-8714-dfe98c23373f	0147b315-f2ca-4a0d-8601-6793f7142aa8	bb4270d7-0796-486c-9368-906b32d3438c	1	75000
b5e4d14f-3a1e-47ec-8266-df49efd1eb6a	0147b315-f2ca-4a0d-8601-6793f7142aa8	3ad8ce5f-5226-4e41-b2ff-26418022a523	3	22500
d6b5846e-94a9-43c7-b89d-91a914e24b4c	afd6a717-3e43-40fa-a280-2f67ae4f7a65	830b506d-b5a3-4aa4-9246-c5a01d7f357d	1	39900
44ebcc6c-f2bf-451b-94ba-b44bf0497425	2fc15446-87d3-4ab9-affc-0935f69f6379	27cc074c-8684-4b0e-843a-bf82fd542fc7	3	165000
6f5f4e5d-5fcb-43fa-80f6-a23f53a0e915	41fcc634-920f-4c2f-b6a7-004f53e87c89	7d4097a8-4981-49ac-a61c-8836709ca8d7	1	22500
1012ea95-33e6-4786-8969-b98a73deaef1	0c834ba2-e959-4590-b975-fd23fffaed47	d3a3e4be-4b14-4041-a663-55b353aa7ef5	1	420000
43e60e7e-e78f-467a-93dd-5be3b53fdc26	0c834ba2-e959-4590-b975-fd23fffaed47	c2847fe7-ff94-4b8a-b1b0-9de05d9d0cc9	1	550000
ca606502-89db-458e-9014-a10ee82d99da	2422f1be-1eb7-4743-bec1-dea2a9af606a	8ece4d0d-6ca0-4d4c-b731-07387eedc8a9	3	45500
9cc6df63-01f4-49f2-95d9-841f6541e587	abca074b-a89d-46a4-b5f9-b961b02ec689	00bcd6a5-cd01-45ab-8a84-1af5984d0e94	10	35550
27ccaa9f-55ab-4e8c-9f36-8cff2ea9db26	abca074b-a89d-46a4-b5f9-b961b02ec689	0abf7597-6c23-481e-9f27-8f226906f61d	20	30000
ac924b0e-0ebd-4153-800d-d4b5be5fc2c2	cc63ae26-fc71-49af-862a-76a985677abc	6c32938e-6ab2-4158-ac79-d8e55b4ba883	3	46000
377e5d97-32db-4457-9b02-f12af33bf8ec	646489fd-32e6-42a3-877c-51f8bf58e27d	6f3df853-178a-493c-8cad-e8a68e245ba9	3	41000
bd4439d3-45e8-46c2-84d4-84949051881c	646489fd-32e6-42a3-877c-51f8bf58e27d	6c32938e-6ab2-4158-ac79-d8e55b4ba883	3	46000
e368ec06-813e-40c3-a01a-788d4a76f189	646489fd-32e6-42a3-877c-51f8bf58e27d	7d4097a8-4981-49ac-a61c-8836709ca8d7	5	22500
76161b59-5abe-4492-8baf-8ffd99909d46	646489fd-32e6-42a3-877c-51f8bf58e27d	830b506d-b5a3-4aa4-9246-c5a01d7f357d	3	39900
13707a15-dee9-4d98-b254-f501a204f56f	646489fd-32e6-42a3-877c-51f8bf58e27d	7c879a78-4b81-4b57-b9da-6d3f4019e3ef	2	64000
883ae575-cb30-4c16-ac33-3f09e015c3ee	646489fd-32e6-42a3-877c-51f8bf58e27d	bb4270d7-0796-486c-9368-906b32d3438c	3	75000
cb776790-a553-4b37-8b8e-f60667a87583	646489fd-32e6-42a3-877c-51f8bf58e27d	3ad8ce5f-5226-4e41-b2ff-26418022a523	4	22500
9e47337b-a146-4e83-a459-5edda9a8fa98	646489fd-32e6-42a3-877c-51f8bf58e27d	503bc40b-a82f-4c51-a7d2-a85738e2ea9a	3	46000
9d9d4fd2-9efe-4274-9c94-c92efa5f171b	646489fd-32e6-42a3-877c-51f8bf58e27d	c2847fe7-ff94-4b8a-b1b0-9de05d9d0cc9	2	550000
bff096ab-0346-470f-8a7f-3db5129b63b2	646489fd-32e6-42a3-877c-51f8bf58e27d	9c75a5b6-b8e7-4011-bec5-70c4fca2567c	3	109000
4579de35-6625-49b3-89f2-59a1b4757daf	308e5a79-bcb1-4b79-9b69-6602db581b18	0abf7597-6c23-481e-9f27-8f226906f61d	1	30000
df8f5e05-b01d-402c-b7af-98c96d9e5508	308e5a79-bcb1-4b79-9b69-6602db581b18	bb76bda1-0e80-4005-a5f6-1c49b68bce7a	1	25000
fd03aa6a-2fdb-49a8-b6c5-c4bb3fb1527f	308e5a79-bcb1-4b79-9b69-6602db581b18	d9bd9a8c-5aed-4255-ac7a-36c7db86ad7f	1	30000
e4146f80-50cb-4419-95ed-8a8e4000823e	308e5a79-bcb1-4b79-9b69-6602db581b18	00bcd6a5-cd01-45ab-8a84-1af5984d0e94	1	35550
aa09ca07-1210-4ed4-a348-1afa47ca74fc	308e5a79-bcb1-4b79-9b69-6602db581b18	8ece4d0d-6ca0-4d4c-b731-07387eedc8a9	1	45500
b7255de7-327f-4517-9cb5-73db696d55aa	f3330fb3-8ef5-44c7-be28-570958aec436	0abf7597-6c23-481e-9f27-8f226906f61d	3	30000
0947e01d-8a45-47fd-99ba-b88e53eb9ee9	efba1556-ded9-40c6-bf9a-c5333de33055	01a527db-a675-416d-9c1f-5f0ceb5bb08a	3	89900
1bcf9dbd-f978-4d01-a8d3-67d47508f259	efba1556-ded9-40c6-bf9a-c5333de33055	368eca33-d24c-46fc-9109-6e8c24e2195a	5	99900
9fd325cf-7afe-45cd-8bfc-c9e18df6b411	8b05142f-4473-4b38-b242-211302c52b75	01a527db-a675-416d-9c1f-5f0ceb5bb08a	6	89900
6ec6c505-9146-4499-a2c3-0a7d7415bee3	8b05142f-4473-4b38-b242-211302c52b75	7c879a78-4b81-4b57-b9da-6d3f4019e3ef	7	64000
9142b644-d9de-400f-9926-08b43196cdeb	8b05142f-4473-4b38-b242-211302c52b75	44808874-2789-4e32-a215-7ea6ab3ec556	6	40000
ed666d34-941d-4819-a094-376f523ece03	8b05142f-4473-4b38-b242-211302c52b75	3ad8ce5f-5226-4e41-b2ff-26418022a523	5	22500
dffa2a68-f29a-439d-b675-09cfcc8ccb6e	8b05142f-4473-4b38-b242-211302c52b75	d3a3e4be-4b14-4041-a663-55b353aa7ef5	4	420000
94e1da65-6b97-42e1-9a48-8c871efe9c97	8b05142f-4473-4b38-b242-211302c52b75	3d24a690-6ae8-4f35-9cbe-6e5cc69aa804	5	256000
1c23bc1f-94e3-4624-97b8-3b1745a612dd	e51d7a29-d1dc-4464-8409-0be07e2ea15e	01a527db-a675-416d-9c1f-5f0ceb5bb08a	3	89900
ad82a387-e50b-4b37-8c50-b9b524f1e996	e51d7a29-d1dc-4464-8409-0be07e2ea15e	368eca33-d24c-46fc-9109-6e8c24e2195a	3	99900
aeb1071e-877a-4eaa-b7dc-a8c5fe24bfb6	e51d7a29-d1dc-4464-8409-0be07e2ea15e	00bcd6a5-cd01-45ab-8a84-1af5984d0e94	1	35550
2f3d995f-eddb-44c7-ad63-0cb06df1e6be	e51d7a29-d1dc-4464-8409-0be07e2ea15e	7d4097a8-4981-49ac-a61c-8836709ca8d7	5	22500
05b3b929-f698-4b01-abd9-62a2e796717b	e51d7a29-d1dc-4464-8409-0be07e2ea15e	7c879a78-4b81-4b57-b9da-6d3f4019e3ef	4	64000
2ca36172-8223-40af-abf2-4c8b2634efee	e51d7a29-d1dc-4464-8409-0be07e2ea15e	830b506d-b5a3-4aa4-9246-c5a01d7f357d	1	39900
72854fca-5843-4d62-bca0-e98b0113c700	e51d7a29-d1dc-4464-8409-0be07e2ea15e	6c32938e-6ab2-4158-ac79-d8e55b4ba883	1	46000
f078285a-633a-482d-8886-b1c8642d4a56	e51d7a29-d1dc-4464-8409-0be07e2ea15e	6f3df853-178a-493c-8cad-e8a68e245ba9	1	41000
bd642136-cae3-43cd-b373-ce48d975c9a7	e51d7a29-d1dc-4464-8409-0be07e2ea15e	44808874-2789-4e32-a215-7ea6ab3ec556	1	40000
5168bc6c-0d0f-4d87-a3d6-59754b2386e2	e51d7a29-d1dc-4464-8409-0be07e2ea15e	b97aae67-431a-4ca4-a59d-f42de7a5a78a	1	29000
950a7f84-2e0a-4e56-a2b6-8b05c1639deb	cdf02c79-820b-4dd6-bee3-d21385cbecbc	27cc074c-8684-4b0e-843a-bf82fd542fc7	1	165000
c74ebe9b-315f-40a0-ac37-377fe4756716	cdf02c79-820b-4dd6-bee3-d21385cbecbc	c2847fe7-ff94-4b8a-b1b0-9de05d9d0cc9	1	550000
9451f86c-5534-453e-b8d1-2e54eb31a4ed	cdf02c79-820b-4dd6-bee3-d21385cbecbc	4e553107-51fd-4697-87f1-c8c17d33ac8e	5	29000
4d1c6f46-d18b-4a1e-a67a-d25528055b2f	0aece8c0-1b48-4c1d-bcde-fbd6cce6736e	01a527db-a675-416d-9c1f-5f0ceb5bb08a	1	89900
ede87836-642d-4709-93d0-f05255f2a171	0aece8c0-1b48-4c1d-bcde-fbd6cce6736e	7d4097a8-4981-49ac-a61c-8836709ca8d7	1	22500
9c579d7f-fe27-4cc1-bdd8-8673219c2644	0aece8c0-1b48-4c1d-bcde-fbd6cce6736e	7c879a78-4b81-4b57-b9da-6d3f4019e3ef	4	64000
c58794f0-a61d-412d-8474-6b900c4ce8c8	0aece8c0-1b48-4c1d-bcde-fbd6cce6736e	830b506d-b5a3-4aa4-9246-c5a01d7f357d	7	39900
00478102-9fa7-4bfa-a1ae-bca749837a17	0aece8c0-1b48-4c1d-bcde-fbd6cce6736e	6c32938e-6ab2-4158-ac79-d8e55b4ba883	3	46000
6237b5d3-8dda-449b-84fe-443ab641da6d	0aece8c0-1b48-4c1d-bcde-fbd6cce6736e	9c75a5b6-b8e7-4011-bec5-70c4fca2567c	3	109000
c8856d79-2d04-459b-b138-4ce39e206adf	0aece8c0-1b48-4c1d-bcde-fbd6cce6736e	fd2c00be-1600-403e-8602-05600d301a83	3	22000
4274a855-6cb1-4d51-94e6-377fb826f436	f18937d3-87d3-4e88-966d-ef7bc385f2be	a143eb0d-f88a-4714-8422-0fd64412e9b2	5	52000
c35ed0ae-52d6-4198-bf5f-6204a802a957	f18937d3-87d3-4e88-966d-ef7bc385f2be	3ad8ce5f-5226-4e41-b2ff-26418022a523	3	22500
29c98034-a269-4f49-93d5-f28ae8f86da8	f18937d3-87d3-4e88-966d-ef7bc385f2be	bb4270d7-0796-486c-9368-906b32d3438c	4	75000
1d15a6fb-fb18-42fb-bb5b-ad06d414e8ac	f18937d3-87d3-4e88-966d-ef7bc385f2be	830b506d-b5a3-4aa4-9246-c5a01d7f357d	3	39900
7668e654-f372-4932-a44e-d02f002d9343	f18937d3-87d3-4e88-966d-ef7bc385f2be	7c879a78-4b81-4b57-b9da-6d3f4019e3ef	4	64000
\.


--
-- Data for Name: Payment; Type: TABLE DATA; Schema: public; Owner: postgresql
--

COPY public."Payment" (id, "orderId", amount, method, "paidAt") FROM stdin;
426778ab-30ec-4824-9063-1ef7a19ee776	8f9c8caa-6402-4290-9405-c9b98709f25d	105500	VNPAY	2026-01-12 15:59:13.78
ca883d35-4944-41cb-9a81-ac851fbad5f5	18b8c2ed-f902-40d5-8d31-16ab1868832f	1398700	COD	2026-01-13 10:57:02.328
5e09a90d-c08c-4217-997c-fbd118f54e1c	cd74b1a0-bd64-40b5-b67a-f753d2c29a81	966800	COD	2026-01-13 11:25:54.242
a27c0aa2-9e59-4a65-b5e6-b8b69665ae96	cd396ea6-93c5-4593-82a3-91f0cf9f177f	1135000	COD	2026-01-13 11:28:52.706
aac01234-ecc0-4030-a804-237e195120e3	eb586c8d-ec57-4a94-9921-2e9174a328a7	715000	COD	2026-01-13 11:29:57.301
74a6fcb8-f078-49c8-85af-86353bfb8e34	6eea9c08-f20c-45f5-bc55-4825d98f757e	191650	COD	2026-01-13 11:32:05.875
3369d243-36ac-418d-92d3-e69954c5a61e	3ab0e81b-ef43-4102-9169-fe2f707669be	192000	VNPAY	2026-01-13 11:41:19.104
207f566c-e0d4-457e-9626-73afce99285e	371a1a87-3384-421e-8779-411206a589e0	715000	COD	2026-01-13 14:24:12.267
38031d98-bc00-4d5a-9696-67f44289af67	ef178d0d-e94f-4a21-a6d8-d7ebefa8de75	87000	COD	2026-01-13 14:26:24.335
33804101-7e8b-436b-8d14-5b380b1eeb2c	b9664434-4ad1-4fd3-ac29-7dd418ed7a0f	22500	COD	2026-01-13 14:27:01.59
2bfca800-de34-4544-ae7b-1bdcc05883c3	fe62891a-f6b6-41f8-8894-7c3dd9ab1a7f	120000	COD	2026-01-13 14:27:52.473
29b085fb-696c-4068-9cd4-b8ef16f682ad	7475ae1e-aaac-4dda-b496-67d9de110a63	46000	COD	2026-01-13 14:37:31.043
d453012a-be9a-4bfb-9377-0f363091f3b8	1a954978-34b0-4597-a9d0-38127b9117c0	80000	COD	2026-01-13 14:38:00.607
af8dca1b-4a19-4e7a-9773-56f12ad280d3	f53e608c-c095-49b6-9be9-db91b46245fb	136500	COD	2026-01-13 14:40:18.98
b9f181ba-c3dd-4416-9ec6-b1120e0b2a7c	2b45e417-a496-4ba5-81f9-83fe4d24861e	90550	COD	2026-01-13 14:40:44.98
9818ec3a-461a-40e3-ac26-b34c3d45e318	7c7f3d65-8fcc-4a7c-a1c2-c309ea5d038a	64000	COD	2026-01-13 14:41:13.976
b00d28e0-f9fa-4c5b-a92f-ef3bb839d9ff	22ce9930-b248-4b1e-a681-206f59bb1361	46000	COD	2026-01-13 14:42:25.091
9dd55a1a-8fc5-4c33-955e-f15cd78856a1	d9040918-1380-482c-8aa9-18c8a29c25a1	420000	COD	2026-01-13 14:43:04.531
0b9eeb70-5d0d-4e15-9e24-9dc7e8dd2897	6f584aef-4432-445b-be95-7c0769141dae	41000	COD	2026-01-13 14:43:55.894
95c882d8-6966-46a2-8e2a-2ce316f7844f	957b67cf-2076-4647-a23f-11a155fb50f6	30000	COD	2026-01-13 14:44:56.759
7c4324a9-1660-4765-9e50-b75821c4fff4	c3a64c59-e206-4494-97af-b90c7578fd6e	39900	COD	2026-01-13 14:46:44.235
c8b0083d-464a-4aa7-9d01-642e58be2d04	86cbf853-d932-4dbe-8b45-1721663529f9	30000	COD	2026-01-13 14:49:11.949
335786a0-a6e8-4ed3-ac60-08ad66f6a064	2cf688e4-c0f1-434a-b485-28785a3c0333	25000	VNPAY	2026-01-13 14:49:55.464
6a0727df-5113-4cdd-86fd-9ffc5dbc88a3	0147b315-f2ca-4a0d-8601-6793f7142aa8	396900	VNPAY	2026-01-14 04:49:02.225
fda12e68-15d7-4672-a865-effcb2366cee	afd6a717-3e43-40fa-a280-2f67ae4f7a65	39900	COD	2026-01-14 08:51:30.083
367d5c34-1ddf-4bfa-b8f9-a1e6fd27c9f5	2fc15446-87d3-4ab9-affc-0935f69f6379	495000	VNPAY	2026-01-14 09:15:43.377
a094e761-c0ec-4176-ba39-42821287b21b	41fcc634-920f-4c2f-b6a7-004f53e87c89	22500	COD	2026-01-14 10:13:02.074
d91c22dc-bcb5-4c91-b0dc-471c86b4efa7	0c834ba2-e959-4590-b975-fd23fffaed47	970000	COD	2026-01-14 13:11:29.666
1b962fc1-965a-4fb2-8e54-18a758e2e2c7	2422f1be-1eb7-4743-bec1-dea2a9af606a	136500	VNPAY	2026-01-14 14:24:00.278
2c32a127-b569-4138-ba43-98bae0d4cad3	abca074b-a89d-46a4-b5f9-b961b02ec689	955500	COD	2026-01-15 11:44:59.575
71c44524-d565-4562-80d9-024adb66bfb2	cc63ae26-fc71-49af-862a-76a985677abc	138000	COD	2026-01-21 04:02:14.698
edb5ac67-41e3-439e-8a94-2cb7e315ac26	308e5a79-bcb1-4b79-9b69-6602db581b18	166050	VNPAY	2026-01-21 13:42:03.591
cad0578c-03f2-4350-8943-24a441b3a26e	f3330fb3-8ef5-44c7-be28-570958aec436	90000	COD	2026-01-23 04:06:45.586
f24c60e2-42e0-46c2-8698-3a454571205b	efba1556-ded9-40c6-bf9a-c5333de33055	769200	COD	2026-01-23 04:15:36.414
3a1a5164-4e5a-42f3-a82e-09917a2578b5	8b05142f-4473-4b38-b242-211302c52b75	4299900	COD	2026-01-24 17:14:12.999
f44ba3c9-f42b-4976-bfaf-e20f865cfedf	646489fd-32e6-42a3-877c-51f8bf58e27d	2000000	COD	2026-01-21 04:03:11.594
61509b92-9d24-4346-b9c0-b567f08ce4ca	f18937d3-87d3-4e88-966d-ef7bc385f2be	1003200	VNPAY	2026-01-27 15:59:32.21
c8ff9f69-de5d-4eae-922a-67656917bb10	646489fd-32e6-42a3-877c-51f8bf58e27d	150000	VNPAY	2026-01-25 14:41:12.378
0f43d052-19a1-4ea1-a5de-121eb91091be	646489fd-32e6-42a3-877c-51f8bf58e27d	200000	VNPAY	2026-01-25 15:36:12.791
473eb9fe-2784-41bb-88ba-15e8c133ab03	e51d7a29-d1dc-4464-8409-0be07e2ea15e	400000	COD	2026-01-26 15:57:43.245
c1041f92-1230-4706-b09f-e6a58958884d	cdf02c79-820b-4dd6-bee3-d21385cbecbc	200000	COD	2026-01-26 16:01:21.333
aebad5ce-884d-4e85-9bf1-e64467d400de	e51d7a29-d1dc-4464-8409-0be07e2ea15e	400000	VNPAY	2026-01-26 16:01:52.273
807588ad-f3fb-4cab-82ae-619771c82975	0aece8c0-1b48-4c1d-bcde-fbd6cce6736e	500000	VNPAY	2026-01-27 04:16:59.559
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
7b8774da-1651-4515-9cb6-9e12b48223b9	3	giao nhầm sản phẩm	830b506d-b5a3-4aa4-9246-c5a01d7f357d	d14480c0-ed03-4e5d-86a1-53072605e78b	2026-01-22 15:07:05.998	2026-01-22 15:07:05.998	{}
376a4f0e-d880-4573-8579-c8f139b33b94	5	mẫu đẹp	c2847fe7-ff94-4b8a-b1b0-9de05d9d0cc9	d14480c0-ed03-4e5d-86a1-53072605e78b	2026-01-22 15:07:49.686	2026-01-22 15:07:49.686	{}
dc933e28-7d68-4dc5-86fc-b1991888b1c4	4	giao nhầm size	c2847fe7-ff94-4b8a-b1b0-9de05d9d0cc9	a3f1449b-c861-4637-9923-c3621e0e4b1f	2026-01-22 15:08:05.423	2026-01-22 15:08:05.423	{}
fc6fce79-2407-4587-b538-a1a7547d2dc5	4	giao thiếu quà tặng kèm	c2847fe7-ff94-4b8a-b1b0-9de05d9d0cc9	390cedfa-55cc-46ff-81e8-e735516e4ac7	2026-01-22 15:08:34.16	2026-01-22 15:08:34.16	{}
88019e1d-8075-4028-91c3-584157bb0b29	5	10 điểm	00bcd6a5-cd01-45ab-8a84-1af5984d0e94	390cedfa-55cc-46ff-81e8-e735516e4ac7	2026-01-22 15:31:11.001	2026-01-22 15:31:11.001	{}
3adbbd6f-e5f6-49ac-a9d8-528b8294987c	5	nên thử 1 lần vì 10 điểm	d9bd9a8c-5aed-4255-ac7a-36c7db86ad7f	d14480c0-ed03-4e5d-86a1-53072605e78b	2026-01-22 15:43:41.483	2026-01-22 15:43:41.483	{http://localhost:5000/uploads/1769096619329-344795627.jpg,http://localhost:5000/uploads/1769096619336-801517933.jpg}
d33388d6-35d7-44a5-88f9-b1245c990c72	5	Bánh chất lượng	b97aae67-431a-4ca4-a59d-f42de7a5a78a	d14480c0-ed03-4e5d-86a1-53072605e78b	2026-01-22 15:46:42.993	2026-01-22 15:46:42.993	{}
cab28b5b-8d87-4c50-9762-4bb445dc3759	5	bánh tuổi thơ	b97aae67-431a-4ca4-a59d-f42de7a5a78a	a3f1449b-c861-4637-9923-c3621e0e4b1f	2026-01-22 15:52:24.005	2026-01-22 15:52:24.005	{http://localhost:5000/uploads/1769097139500-115418379.jpg,http://localhost:5000/uploads/1769097139506-270522307.jpg}
e73dcf2f-e944-4e1a-81ee-9c6089cb6df8	5	sẽ ủng hộ tiếp :>	d3a3e4be-4b14-4041-a663-55b353aa7ef5	a3f1449b-c861-4637-9923-c3621e0e4b1f	2026-01-22 15:53:49.557	2026-01-22 15:53:49.557	{http://localhost:5000/uploads/1769097226167-71263892.png,http://localhost:5000/uploads/1769097228237-32625033.jpg}
dd5f0a09-e2ae-4cb9-bbf1-d158a6f68e52	5	Ngon lắm	7d4097a8-4981-49ac-a61c-8836709ca8d7	d14480c0-ed03-4e5d-86a1-53072605e78b	2026-01-23 03:59:48.693	2026-01-23 03:59:48.693	{}
f56f1fcf-1880-44fd-8bf7-74b0bf0e3297	4	10 điểm	7d4097a8-4981-49ac-a61c-8836709ca8d7	a3f1449b-c861-4637-9923-c3621e0e4b1f	2026-01-23 04:00:21.844	2026-01-23 04:00:21.844	{}
4d67b774-cf0a-4d73-9c2f-6d00d6ac20ab	4	sẽ tiếp tục ủng hộ	7d4097a8-4981-49ac-a61c-8836709ca8d7	390cedfa-55cc-46ff-81e8-e735516e4ac7	2026-01-23 04:01:27.894	2026-01-23 04:01:27.894	{}
4cac320b-ad25-4d87-b138-f580cdfceb7a	5	ngon lắm	503bc40b-a82f-4c51-a7d2-a85738e2ea9a	d14480c0-ed03-4e5d-86a1-53072605e78b	2026-01-27 14:28:55.435	2026-01-27 14:28:55.435	{}
\.


--
-- Data for Name: SearchKeyword; Type: TABLE DATA; Schema: public; Owner: postgresql
--

COPY public."SearchKeyword" (id, title, count, "createdAt") FROM stdin;
09d99247-962f-433a-acd1-831d893c2e24	nước ngọt	4	2026-01-27 10:49:14.091
f34f9fd7-1c4d-4e49-94b6-2241c081c6cc	áo thun	2	2026-01-27 11:09:58.823
9cd090e4-6177-4fb2-a207-762cd109f6ff	bánh	1	2026-01-27 11:10:19.92
df552893-5064-4784-9b46-8721e3d407fd	bánh quy	8	2026-01-27 10:48:55.986
b80943a4-2877-4a56-b3d5-45f2a5da5bd3	pizza	2	2026-01-27 11:35:16.431
d37b7cf4-4bf0-4e75-8097-a1e5210a3142	phô mai	2	2026-01-27 11:35:34.625
4d4eddf4-fe67-4f29-883b-9e1079b3ad16	bánh gạo	22	2026-01-27 10:48:18.316
fa5af54a-9fef-405c-ae52-63f134ab0db4	cà phê	16	2026-01-27 10:48:46.525
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
6160d213-90b0-46e6-8363-9aee894f12b3	Shopee	#fa5230	http://localhost:5000/uploads/1768752436982-207219776.png	t	2026-01-18 16:07:19.547	2026-01-28 08:31:12.949	{http://localhost:5000/uploads/1768896794793-327175953.jpg,http://localhost:5000/uploads/1768896794804-103175363.jpg,http://localhost:5000/uploads/1768896794814-697014807.png}	truccuong.ngo@gmail.com	© Copyright 2026 & built with ❤️ by minhtrifit	123456789
\.


--
-- Data for Name: WebsiteSection; Type: TABLE DATA; Schema: public; Owner: postgresql
--

COPY public."WebsiteSection" (id, "templateId", title, "position", "createdAt", "updatedAt") FROM stdin;
cfc8b509-cad3-4f43-985a-6a2639942f2b	6160d213-90b0-46e6-8363-9aee894f12b3	Cà phê	1	2026-01-26 05:07:31.985	2026-01-26 05:07:31.985
8fe1a9f9-6160-4dfe-b8e7-7eab681420d8	6160d213-90b0-46e6-8363-9aee894f12b3	Xả kho cuối năm	2	2026-01-26 05:07:31.993	2026-01-26 05:07:31.993
530e2578-10d2-4a6c-a635-df1b1d97663f	6160d213-90b0-46e6-8363-9aee894f12b3	Đồ ăn vặt mới	3	2026-01-26 05:07:31.997	2026-01-26 05:07:31.997
4b6c2378-f130-4472-838e-94f7793aca57	6160d213-90b0-46e6-8363-9aee894f12b3	Sản phẩm khuyến mãi	4	2026-01-26 05:07:32.002	2026-01-26 05:07:32.002
49be0806-c980-446a-8403-dcab467b72d7	d2553322-dd48-4147-9e67-375a0a217960	Bánh snack ăn vặt	1	2026-01-26 08:31:15.202	2026-01-26 08:31:15.202
6b0c0457-7a77-4003-ad79-e623b59be296	d2553322-dd48-4147-9e67-375a0a217960	Coffee snake & chill	2	2026-01-26 08:31:15.206	2026-01-26 08:31:15.206
41084149-a3d1-41c5-945e-974399fd85a6	42341e9b-234a-4d92-b43d-bbe18d8fe21e	Sản phẩm mới	1	2026-01-23 10:09:28.514	2026-01-23 10:09:28.514
67a11c71-e6e4-477a-a2e2-8ad69ffacdb7	42341e9b-234a-4d92-b43d-bbe18d8fe21e	Sản phẩm khuyến mãi	2	2026-01-23 10:09:28.517	2026-01-23 10:09:28.517
\.


--
-- Data for Name: WebsiteSectionItem; Type: TABLE DATA; Schema: public; Owner: postgresql
--

COPY public."WebsiteSectionItem" (id, "sectionId", "productId", "position") FROM stdin;
d75fcf15-ecb8-4bc6-8d22-c478ecff2b60	41084149-a3d1-41c5-945e-974399fd85a6	368eca33-d24c-46fc-9109-6e8c24e2195a	1
27ca07c5-d944-4ecc-9929-3653682f909f	41084149-a3d1-41c5-945e-974399fd85a6	01a527db-a675-416d-9c1f-5f0ceb5bb08a	2
ee0d4786-c852-460f-a7da-fd74b5bd0e9c	41084149-a3d1-41c5-945e-974399fd85a6	0abf7597-6c23-481e-9f27-8f226906f61d	3
2a3a877d-51ce-4cea-a450-3fe248e7c4d4	41084149-a3d1-41c5-945e-974399fd85a6	b97aae67-431a-4ca4-a59d-f42de7a5a78a	4
d672c336-a270-43b3-a5a4-b72aea683561	67a11c71-e6e4-477a-a2e2-8ad69ffacdb7	27cc074c-8684-4b0e-843a-bf82fd542fc7	1
594a448e-3130-4062-923e-3b66fc2184ca	67a11c71-e6e4-477a-a2e2-8ad69ffacdb7	d3a3e4be-4b14-4041-a663-55b353aa7ef5	2
b80aae5e-035b-4548-9d78-d2d82286332a	67a11c71-e6e4-477a-a2e2-8ad69ffacdb7	c2847fe7-ff94-4b8a-b1b0-9de05d9d0cc9	3
3f55af74-6c35-4c6a-a501-95669e76476d	67a11c71-e6e4-477a-a2e2-8ad69ffacdb7	4e553107-51fd-4697-87f1-c8c17d33ac8e	4
642a0c52-44be-4132-a0cf-925647e849e3	cfc8b509-cad3-4f43-985a-6a2639942f2b	bb76bda1-0e80-4005-a5f6-1c49b68bce7a	1
9314d032-0ef2-4896-9733-c2191e09f4f6	cfc8b509-cad3-4f43-985a-6a2639942f2b	0abf7597-6c23-481e-9f27-8f226906f61d	2
ec06d50d-1eff-429c-8a76-731a1aa64a1b	cfc8b509-cad3-4f43-985a-6a2639942f2b	00bcd6a5-cd01-45ab-8a84-1af5984d0e94	3
e84e472f-75e8-4dbc-849c-f5356af7de1c	cfc8b509-cad3-4f43-985a-6a2639942f2b	d9bd9a8c-5aed-4255-ac7a-36c7db86ad7f	4
5acba42b-93a0-4690-b5da-35af7d5b2ec7	8fe1a9f9-6160-4dfe-b8e7-7eab681420d8	a143eb0d-f88a-4714-8422-0fd64412e9b2	1
59a7d62c-f603-4cec-b58e-b83b83f1fe3c	8fe1a9f9-6160-4dfe-b8e7-7eab681420d8	3d24a690-6ae8-4f35-9cbe-6e5cc69aa804	2
81c6d9dc-9df0-4115-b0f8-79ac7b3b2d39	8fe1a9f9-6160-4dfe-b8e7-7eab681420d8	503bc40b-a82f-4c51-a7d2-a85738e2ea9a	3
da4f00cf-b103-4b32-bdbd-59f45d7813f3	8fe1a9f9-6160-4dfe-b8e7-7eab681420d8	9c75a5b6-b8e7-4011-bec5-70c4fca2567c	4
eb94a67b-179d-46da-b501-8f70b0396822	8fe1a9f9-6160-4dfe-b8e7-7eab681420d8	fd2c00be-1600-403e-8602-05600d301a83	5
24ef1b1e-eae8-40b8-947a-e1fdc4bbd141	530e2578-10d2-4a6c-a635-df1b1d97663f	830b506d-b5a3-4aa4-9246-c5a01d7f357d	1
09d5cf06-c65a-48e7-ab5c-b70dc274d46e	530e2578-10d2-4a6c-a635-df1b1d97663f	7d4097a8-4981-49ac-a61c-8836709ca8d7	2
fdededb9-4b2c-4b40-96d5-f540b9b4bc8f	530e2578-10d2-4a6c-a635-df1b1d97663f	6f3df853-178a-493c-8cad-e8a68e245ba9	3
61d0abda-33a1-4e28-83d1-f95b98d95ca4	530e2578-10d2-4a6c-a635-df1b1d97663f	7c879a78-4b81-4b57-b9da-6d3f4019e3ef	4
e9970e7f-5316-47e9-97bd-ca9ae4a5200e	530e2578-10d2-4a6c-a635-df1b1d97663f	6c32938e-6ab2-4158-ac79-d8e55b4ba883	5
91e9040f-d5b3-4daa-9d19-be9d6a73ffac	4b6c2378-f130-4472-838e-94f7793aca57	27cc074c-8684-4b0e-843a-bf82fd542fc7	1
4dabbe7c-7811-47d9-9b63-acac77ec5315	4b6c2378-f130-4472-838e-94f7793aca57	c2847fe7-ff94-4b8a-b1b0-9de05d9d0cc9	2
e84d05de-bc1f-4341-b554-470485888da5	4b6c2378-f130-4472-838e-94f7793aca57	8ece4d0d-6ca0-4d4c-b731-07387eedc8a9	3
7ff9f984-dcc7-4682-bbe9-24455b7fd08a	4b6c2378-f130-4472-838e-94f7793aca57	d3a3e4be-4b14-4041-a663-55b353aa7ef5	4
c26a9cf0-71d6-4429-929e-f3851775498c	4b6c2378-f130-4472-838e-94f7793aca57	4e553107-51fd-4697-87f1-c8c17d33ac8e	5
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
b9f2be30-39cb-4f93-85c1-d56145bff711	5640ec8b72350bf288377bb04eb36599d9c24fcee2dba6c26c3831fa0d66b493	2026-01-19 09:37:05.210681+00	20260119093705_update_websitetemplate	\N	\N	2026-01-19 09:37:05.188681+00	1
f008a184-8c81-4c4a-aca4-479463cef9c6	eab85acb429c2520d912f8c560afda1c41c6aef667c2fc5b28e3cfa00ed51140	2026-01-20 11:01:06.050444+00	20260120110106_add_websitetemplate_field	\N	\N	2026-01-20 11:01:06.044581+00	1
7f8c8c83-8871-4cb8-80a4-c4c79aa55e20	6050d15ec3fbc377ccf63c8b0f31f2666a73ee438609b68621985904b296de0e	2026-01-19 11:07:05.667024+00	20260119110705_update_websitesection	\N	\N	2026-01-19 11:07:05.650744+00	1
10994695-1493-4d28-b8ee-bf4d51cd1b32	ecdb1e8748232cd8df52d21ae0c355c1a91a974214e86dfc6b5d964949cb266d	2026-01-22 13:35:32.475698+00	20260122133532_update_product_rating	\N	\N	2026-01-22 13:35:32.469423+00	1
0dfaba85-d9a8-45d2-a53e-3d1b8fb86972	1527e28ca6984eb4164a536b0298dbb1a295e558cb4ddfc86bc436e7367d8696	2026-01-21 10:14:45.335961+00	20260121101445_update_user_avatar	\N	\N	2026-01-21 10:14:45.328595+00	1
1e4be53d-8b54-4ab7-ad88-447202826281	34ff5c07c270042687c31d1a8f0743a13e1ce7ebe5d73eeb82c860ec92528f1b	2026-01-22 13:09:32.096251+00	20260122130932_add_product_review	\N	\N	2026-01-22 13:09:32.075584+00	1
c68f4e1b-e62f-4341-9920-6f8850c8c272	2d41fb40488ce05c71e182ff2678932d8def5c048a134b68c14d732926393d9e	2026-01-23 03:23:04.323169+00	20260123032304_update_product_soldcount	\N	\N	2026-01-23 03:23:04.309123+00	1
8d441b2d-5e60-43c5-96a8-fb3ced1d85bd	a0f0ed741abf4c3ef52ea2411bce911bf21e791d295afb02bf39738017cceccb	2026-01-27 10:15:18.8537+00	20260127101518_add_search_keyword	\N	\N	2026-01-27 10:15:18.835738+00	1
\.


--
-- PostgreSQL database dump complete
--

\unrestrict LxIgF4GQZ0LCrSczvoTVjGdXHj37NGVGcShPokrRUNwmHjj3uZ6V6NnG1LGKwlt

