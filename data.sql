--
-- PostgreSQL database dump
--

\restrict lS7LcaFaZ3ph8fb1GQf95bAYevqmIbhcGdsDbA0AfVbmIxJmP5SFEvU59APdM9m

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
286631c0-b3b3-4055-8b3f-b8a3b0637648	Nước tăng lực	http://localhost:5000/uploads/1768127331258-656330177.jpg	2026-01-06 14:40:15.252	2026-01-11 13:21:48.901	t	nuoc-tang-luc
460b0ebd-98a8-4cdc-b995-75a86b321511	Đồ ăn & thực phẩm	http://localhost:5000/uploads/1768188991985-273369358.png	2026-01-06 14:40:15.252	2026-01-12 03:36:33.26	t	do-an-thuc-pham
cb8192f2-7ddb-4611-8cf6-6c22aae6a534	Bánh snack	http://localhost:5000/uploads/1768215597655-439490529.png	2026-01-06 14:40:15.252	2026-01-12 10:59:59.584	t	banh-snack
7ca58ff4-6b27-44b8-a83d-4be20d95a1cd	Đồ uống giải khát	http://localhost:5000/uploads/1768215682805-659006868.png	2026-01-06 14:40:15.252	2026-01-12 11:01:23.679	t	do-uong-giai-khat
8c59ec6b-d565-41e5-a0e1-9685ab4b44a0	Trái cây	http://localhost:5000/uploads/1768215745029-756686103.png	2026-01-11 10:40:49.767	2026-01-12 11:02:30.231	t	trai-cay
d3824cc8-1f29-4e4f-ab72-4a4ad94fa79d	Sữa, bơ & phô mai	http://localhost:5000/uploads/1768215818315-611113424.png	2026-01-06 14:40:15.252	2026-01-12 11:03:39.226	t	sua-bo-va-pho-mai
488c4285-9071-4ddd-915a-7a46fac093b5	Thịt, cá, trứng	http://localhost:5000/uploads/1768215922293-865410864.png	2026-01-11 10:49:50.224	2026-01-12 11:05:23.17	t	thit-ca-trung
3e6d3914-1914-4a13-b85f-c72b2d8ab156	Rau củ quả	http://localhost:5000/uploads/1768216006193-707283134.png	2026-01-11 10:44:02.146	2026-01-12 11:06:47.127	t	rau-cu-qua
c529266e-7706-4809-b784-cfcb81596e20	Quần áo	http://localhost:5000/uploads/1768216170274-55640973.jpeg	2026-01-06 14:40:15.252	2026-01-12 11:09:31.331	t	quan-ao
af4b4680-6565-4c91-b8d1-f41f4eba1256	Dầu ăn, gia vị	http://localhost:5000/uploads/1768216286651-814714218.png	2026-01-06 14:40:15.252	2026-01-12 11:11:27.553	t	giau-an-gia-vi
\.


--
-- Data for Name: Customer; Type: TABLE DATA; Schema: public; Owner: postgresql
--

COPY public."Customer" (id, phone, email, address, "createdAt", "updatedAt", "fullName") FROM stdin;
1753f078-2f04-4a4a-a599-c8c97f316042	123456788	minhtri.fit@gmail.com	HCM	2026-01-10 04:38:01.029	2026-01-10 04:42:28.118	Lê Minh Trí
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

COPY public."User" (id, email, password, "fullName", role, "isActive", "createdAt", "updatedAt", address, phone) FROM stdin;
5560efbf-0bd5-4055-b41f-f56d6c307f59	admin@gmail.com	$2b$10$UdHxFNw78vBZUco7Qd7w8eoJtPGR8Ek3Y0JEgNQdIt45e9tDcziG.	Admin	ADMIN	t	2026-01-07 04:06:44.962	2026-01-07 04:06:44.962	\N	\N
d14480c0-ed03-4e5d-86a1-53072605e78b	truccuong.ngo@gmail.com	$2b$10$UdHxFNw78vBZUco7Qd7w8eoJtPGR8Ek3Y0JEgNQdIt45e9tDcziG.	Ngô Trúc Cương	USER	f	2026-01-07 04:06:44.962	2026-01-07 04:06:44.962	8958 Minh Tú Fork	\N
390cedfa-55cc-46ff-81e8-e735516e4ac7	7kucphong.hoang@gmail.com	$2b$10$UdHxFNw78vBZUco7Qd7w8eoJtPGR8Ek3Y0JEgNQdIt45e9tDcziG.	Hoàng Đức Phong	USER	t	2026-01-07 04:06:44.962	2026-01-07 04:06:44.962	53068 Trung Nhân Ways	0109078579
a3f1449b-c861-4637-9923-c3621e0e4b1f	huelan_le47@gmail.com	$2b$10$UdHxFNw78vBZUco7Qd7w8eoJtPGR8Ek3Y0JEgNQdIt45e9tDcziG.	Lê Huệ Lan	USER	t	2026-01-07 04:06:44.962	2026-01-07 04:06:44.962	6737 Quế Lâm Falls	\N
05e1b59f-2e97-46cd-a68e-2d41f3c693e8	thanhhien.trinh@gmail.com	$2b$10$UdHxFNw78vBZUco7Qd7w8eoJtPGR8Ek3Y0JEgNQdIt45e9tDcziG.	Trịnh Thanh Hiền	USER	t	2026-01-07 04:06:44.962	2026-01-07 04:06:44.962	36222 Trương Dam	0154608952
77ec2f95-3813-443d-b569-d32051f57aca	thuongkhang_ho@gmail.com	$2b$10$UdHxFNw78vBZUco7Qd7w8eoJtPGR8Ek3Y0JEgNQdIt45e9tDcziG.	Hồ Thượng Khang	USER	f	2026-01-07 04:06:44.962	2026-01-07 04:06:44.962	13851 Gia Huy Lake	0760484516
23d656be-6ef8-424e-bc61-5b85229e169e	7kuctam_7koan85@gmail.com	$2b$10$UdHxFNw78vBZUco7Qd7w8eoJtPGR8Ek3Y0JEgNQdIt45e9tDcziG.	Đoàn Đức Tâm	USER	t	2026-01-07 04:06:44.962	2026-01-07 04:06:44.962	\N	\N
aa3b640c-6acd-4777-b9b3-b7d3f08ad122	thienha_7kinh@gmail.com	$2b$10$UdHxFNw78vBZUco7Qd7w8eoJtPGR8Ek3Y0JEgNQdIt45e9tDcziG.	Đinh Thiên Hà	USER	f	2026-01-07 04:06:44.962	2026-01-07 04:06:44.962	411 Minh Sơn Plains	0630151133
47ac046b-ba8f-48ce-8ffc-4af020608f3b	hungdung.mai78@gmail.com	$2b$10$UdHxFNw78vBZUco7Qd7w8eoJtPGR8Ek3Y0JEgNQdIt45e9tDcziG.	Mai Hùng Dũng	USER	t	2026-01-07 04:06:44.962	2026-01-07 04:06:44.962	\N	\N
d67b18a4-4c67-4562-b334-1c50aca385c1	7kinhngan_duong31@gmail.com	$2b$10$UdHxFNw78vBZUco7Qd7w8eoJtPGR8Ek3Y0JEgNQdIt45e9tDcziG.	Dương Đình Ngân	USER	t	2026-01-07 04:06:44.962	2026-01-07 04:06:44.962	52112 Dương Ports	0310520671
df3d23c0-3bf6-42f7-9f8c-af501551f1ad	xuanphuc.bui@gmail.com	$2b$10$UdHxFNw78vBZUco7Qd7w8eoJtPGR8Ek3Y0JEgNQdIt45e9tDcziG.	Bùi Xuân Phúc	USER	t	2026-01-07 04:06:44.962	2026-01-07 04:06:44.962	\N	\N
ea2eb6e1-0363-4a3c-a2c5-b093277c8a9a	vanchi.duong@gmail.com	$2b$10$UdHxFNw78vBZUco7Qd7w8eoJtPGR8Ek3Y0JEgNQdIt45e9tDcziG.	Dương Vân Chi	USER	t	2026-01-07 04:06:44.962	2026-01-07 04:06:44.962	445 Nguyệt Lan Streets	\N
1933234c-c68a-45b6-817b-d5a42ce734b6	huehong.bui@gmail.com	$2b$10$UdHxFNw78vBZUco7Qd7w8eoJtPGR8Ek3Y0JEgNQdIt45e9tDcziG.	Bùi Huệ Hồng	USER	f	2026-01-07 04:06:44.962	2026-01-07 04:06:44.962	\N	\N
79d06455-9835-4127-9413-f5aabb014bd8	trungnguyen.mai@gmail.com	$2b$10$UdHxFNw78vBZUco7Qd7w8eoJtPGR8Ek3Y0JEgNQdIt45e9tDcziG.	Mai Trung Nguyên	USER	t	2026-01-07 04:06:44.962	2026-01-07 04:06:44.962	\N	0123376729
9ee7ec15-bc4e-4d01-904d-d14f48e4d2a3	hongminh_7ko@gmail.com	$2b$10$UdHxFNw78vBZUco7Qd7w8eoJtPGR8Ek3Y0JEgNQdIt45e9tDcziG.	Đỗ Hồng Minh	USER	t	2026-01-07 04:06:44.962	2026-01-07 04:06:44.962	\N	0192513348
30beadcb-b92d-4e0c-97d0-1edc9ac687a1	anhmai_to@gmail.com	$2b$10$UdHxFNw78vBZUco7Qd7w8eoJtPGR8Ek3Y0JEgNQdIt45e9tDcziG.	Tô Anh Mai	USER	f	2026-01-07 04:06:44.962	2026-01-07 04:06:44.962	\N	\N
5136b4a8-072e-4cd9-8446-aaad66e82008	thanhson_7kinh@gmail.com	$2b$10$UdHxFNw78vBZUco7Qd7w8eoJtPGR8Ek3Y0JEgNQdIt45e9tDcziG.	Đinh Thanh Sơn	USER	f	2026-01-07 04:06:44.962	2026-01-07 04:06:44.962	\N	\N
63bc0a50-c936-4693-aeaa-b15fbaec0324	vinhluan.truong@gmail.com	$2b$10$UdHxFNw78vBZUco7Qd7w8eoJtPGR8Ek3Y0JEgNQdIt45e9tDcziG.	Trương Vĩnh Luân	USER	f	2026-01-07 04:06:44.962	2026-01-07 04:06:44.962	5434 Diễm Thư Overpass	0129191381
bf1d1ebf-1c3e-4bd4-85f4-f4f0f78b87b7	duyenhong.trinh42@gmail.com	$2b$10$UdHxFNw78vBZUco7Qd7w8eoJtPGR8Ek3Y0JEgNQdIt45e9tDcziG.	Trịnh Duyên Hồng	USER	f	2026-01-07 04:06:44.962	2026-01-07 04:06:44.962	\N	0658630082
b81cd923-8936-4e01-b72a-1e0b20c71046	7kuchai.to20@gmail.com	$2b$10$UdHxFNw78vBZUco7Qd7w8eoJtPGR8Ek3Y0JEgNQdIt45e9tDcziG.	Tô Đức Hải	USER	f	2026-01-07 04:06:44.962	2026-01-07 04:06:44.962	\N	0660493443
92f35961-eb44-4779-ab47-a58fa3185252	trieuman.trinh1@gmail.com	$2b$10$UdHxFNw78vBZUco7Qd7w8eoJtPGR8Ek3Y0JEgNQdIt45e9tDcziG.	Trịnh Triệu Mẫn	USER	t	2026-01-07 04:06:44.962	2026-01-07 04:06:44.962	\N	0808516898
d27fc351-7bf9-424a-9170-7f720d2440a9	xuanmai_tran@gmail.com	$2b$10$UdHxFNw78vBZUco7Qd7w8eoJtPGR8Ek3Y0JEgNQdIt45e9tDcziG.	Trần Xuân Mai	USER	t	2026-01-07 04:06:44.962	2026-01-07 04:06:44.962	\N	0437118250
a02f8e7e-55b5-4019-b31a-59abec974d49	xuantrang_7kao@gmail.com	$2b$10$UdHxFNw78vBZUco7Qd7w8eoJtPGR8Ek3Y0JEgNQdIt45e9tDcziG.	Đào Xuân Trang	USER	f	2026-01-07 04:06:44.962	2026-01-07 04:06:44.962	\N	0444306776
71876d7b-be24-4f4d-aa71-f1d3de4a36da	hongphuong_vuong@gmail.com	$2b$10$UdHxFNw78vBZUco7Qd7w8eoJtPGR8Ek3Y0JEgNQdIt45e9tDcziG.	Vương Hồng Phương	USER	t	2026-01-07 04:06:44.962	2026-01-07 04:06:44.962	\N	\N
8bb99979-903d-409e-975e-55f4479e3465	thuyquynh.7kao@gmail.com	$2b$10$UdHxFNw78vBZUco7Qd7w8eoJtPGR8Ek3Y0JEgNQdIt45e9tDcziG.	Đào Thúy Quỳnh	USER	t	2026-01-07 04:06:44.962	2026-01-07 04:06:44.962	\N	0707160377
e1930a27-1c7a-44d0-8913-b472f8a93554	lamoanh_lam@gmail.com	$2b$10$UdHxFNw78vBZUco7Qd7w8eoJtPGR8Ek3Y0JEgNQdIt45e9tDcziG.	Lâm Lâm Oanh	USER	t	2026-01-07 04:06:44.962	2026-01-07 04:06:44.962	74787 Nhật Minh Dale	\N
663241c8-aea5-4445-8ae4-93ffef5b6b6d	yenson_tran79@gmail.com	$2b$10$UdHxFNw78vBZUco7Qd7w8eoJtPGR8Ek3Y0JEgNQdIt45e9tDcziG.	Trần Yên Sơn	USER	f	2026-01-07 04:06:44.962	2026-01-07 04:06:44.962	\N	\N
a0214f6e-5af6-4602-b2f2-80d5465c8f6f	lam7kong_7kao@gmail.com	$2b$10$UdHxFNw78vBZUco7Qd7w8eoJtPGR8Ek3Y0JEgNQdIt45e9tDcziG.	Đào Lâm Đồng	USER	f	2026-01-07 04:06:44.962	2026-01-07 04:06:44.962	12273 Thụy Vân Viaduct	\N
90d896f9-20c8-4d0e-be35-17c4839cafab	7kinhduong.7kao@gmail.com	$2b$10$UdHxFNw78vBZUco7Qd7w8eoJtPGR8Ek3Y0JEgNQdIt45e9tDcziG.	Đào Đình Dương	USER	t	2026-01-07 04:06:44.962	2026-01-07 04:06:44.962	\N	\N
f86dde75-dea4-4848-b2c2-6d17f1a53d73	yennhi_tran43@gmail.com	$2b$10$UdHxFNw78vBZUco7Qd7w8eoJtPGR8Ek3Y0JEgNQdIt45e9tDcziG.	Trần Yến Nhi	USER	t	2026-01-07 04:06:44.962	2026-01-07 04:06:44.962	1858 Phùng Mills	\N
ba19596c-a4f4-4124-be5a-513b12a5c274	7kuctue.ly55@gmail.com	$2b$10$UdHxFNw78vBZUco7Qd7w8eoJtPGR8Ek3Y0JEgNQdIt45e9tDcziG.	Lý Đức Tuệ	USER	t	2026-01-07 04:06:44.962	2026-01-07 04:06:44.962	\N	0449587641
2d5a77bf-a719-4d14-b204-1fcbecbca660	tonhi.7ko@gmail.com	$2b$10$UdHxFNw78vBZUco7Qd7w8eoJtPGR8Ek3Y0JEgNQdIt45e9tDcziG.	Đỗ Tố Nhi	USER	t	2026-01-07 04:06:44.962	2026-01-07 04:06:44.962	76906 Đỗ Lane	0665735641
fd7ce833-0624-4c07-be3f-0aa61137657a	7kongquan.ly42@gmail.com	$2b$10$UdHxFNw78vBZUco7Qd7w8eoJtPGR8Ek3Y0JEgNQdIt45e9tDcziG.	Lý Đông Quân	USER	t	2026-01-07 04:06:44.962	2026-01-07 04:06:44.962	\N	\N
8b4f1e2b-646d-4ba3-8e11-d813389f8d75	huonglan.to@gmail.com	$2b$10$UdHxFNw78vBZUco7Qd7w8eoJtPGR8Ek3Y0JEgNQdIt45e9tDcziG.	Tô Hương Lan	USER	f	2026-01-07 04:06:44.962	2026-01-07 04:06:44.962	91438 Đỗ Pine	\N
a7048ec2-9a93-402f-89ba-f15d6a480be3	thuydung.le@gmail.com	$2b$10$UdHxFNw78vBZUco7Qd7w8eoJtPGR8Ek3Y0JEgNQdIt45e9tDcziG.	Lê Thùy Dung	USER	f	2026-01-07 04:06:44.962	2026-01-07 04:06:44.962	207 Dương Branch	\N
ae424680-4f29-4606-bb23-b6c346bc132f	thanhtuyet_7ko49@gmail.com	$2b$10$UdHxFNw78vBZUco7Qd7w8eoJtPGR8Ek3Y0JEgNQdIt45e9tDcziG.	Đỗ Thanh Tuyết	USER	t	2026-01-07 04:06:44.962	2026-01-07 04:06:44.962	668 Lê Ports	\N
1f5adad4-e84c-41ab-87c6-38114e9ef609	duythang.ha24@gmail.com	$2b$10$UdHxFNw78vBZUco7Qd7w8eoJtPGR8Ek3Y0JEgNQdIt45e9tDcziG.	Hà Duy Thắng	USER	f	2026-01-07 04:06:44.962	2026-01-07 04:06:44.962	97677 Thiện Tâm Fords	\N
ada9ede4-328e-46fc-bd40-4f9384674d46	ngockhanh_nguyen38@gmail.com	$2b$10$UdHxFNw78vBZUco7Qd7w8eoJtPGR8Ek3Y0JEgNQdIt45e9tDcziG.	Nguyễn Ngọc Khánh	USER	t	2026-01-07 04:06:44.962	2026-01-07 04:06:44.962	62758 Đỗ Prairie	\N
0cbaab79-3e88-4a6f-8662-d3ec44fcac08	thienlac_mai@gmail.com	$2b$10$UdHxFNw78vBZUco7Qd7w8eoJtPGR8Ek3Y0JEgNQdIt45e9tDcziG.	Mai Thiên Lạc	USER	t	2026-01-07 04:06:44.962	2026-01-07 04:06:44.962	58427 Bùi Alley	0812377029
b873fe64-219f-45e6-a995-bf15ea7f76bb	minhtam_truong@gmail.com	$2b$10$UdHxFNw78vBZUco7Qd7w8eoJtPGR8Ek3Y0JEgNQdIt45e9tDcziG.	Trương Minh Tâm	USER	f	2026-01-07 04:06:44.962	2026-01-07 04:06:44.962	\N	\N
4d198ca0-6418-46d1-a37e-7fd36f048db9	minhnghia.ngo90@gmail.com	$2b$10$UdHxFNw78vBZUco7Qd7w8eoJtPGR8Ek3Y0JEgNQdIt45e9tDcziG.	Ngô Minh Nghĩa	USER	f	2026-01-07 04:06:44.962	2026-01-07 04:06:44.962	476 Quang Thiên Circle	0917780981
d362febe-a28b-4a86-b11c-358497aecab4	bichtram.7koan@gmail.com	$2b$10$UdHxFNw78vBZUco7Qd7w8eoJtPGR8Ek3Y0JEgNQdIt45e9tDcziG.	Đoàn Bích Trâm	USER	t	2026-01-07 04:06:44.962	2026-01-07 04:06:44.962	\N	0609498034
9554fbe5-ca77-468c-a86c-56ec57a04a4e	hong7kuc.ly41@gmail.com	$2b$10$UdHxFNw78vBZUco7Qd7w8eoJtPGR8Ek3Y0JEgNQdIt45e9tDcziG.	Lý Hồng Đức	USER	t	2026-01-07 04:06:44.962	2026-01-07 04:06:44.962	\N	\N
7254c291-33a6-4052-8854-930446e5bdc7	7kinhnguyen.to@gmail.com	$2b$10$UdHxFNw78vBZUco7Qd7w8eoJtPGR8Ek3Y0JEgNQdIt45e9tDcziG.	Tô Đình Nguyên	USER	f	2026-01-07 04:06:44.962	2026-01-07 04:06:44.962	\N	0232042542
2630db90-4906-41c3-aa58-a1e3ad86005c	tuyetlam_vu@gmail.com	$2b$10$UdHxFNw78vBZUco7Qd7w8eoJtPGR8Ek3Y0JEgNQdIt45e9tDcziG.	Vũ Tuyết Lâm	USER	t	2026-01-07 04:06:44.962	2026-01-07 04:06:44.962	8009 Diễm Quyên Street	0437280925
ea45eb1d-8b2f-4629-8630-c15b79f0441c	tuantai.le@gmail.com	$2b$10$UdHxFNw78vBZUco7Qd7w8eoJtPGR8Ek3Y0JEgNQdIt45e9tDcziG.	Lê Tuấn Tài	USER	t	2026-01-07 04:06:44.962	2026-01-07 04:06:44.962	\N	0482468853
987c386e-f28d-4dd1-8ee6-fa23f8da522c	phucnguyen.phung29@gmail.com	$2b$10$UdHxFNw78vBZUco7Qd7w8eoJtPGR8Ek3Y0JEgNQdIt45e9tDcziG.	Phùng Phúc Nguyên	USER	t	2026-01-07 04:06:44.962	2026-01-07 04:06:44.962	\N	0385567218
d20a4f67-ae4f-426e-8605-332d6b357411	huuthien.trinh22@gmail.com	$2b$10$UdHxFNw78vBZUco7Qd7w8eoJtPGR8Ek3Y0JEgNQdIt45e9tDcziG.	Trịnh Hữu Thiện	USER	f	2026-01-07 04:06:44.962	2026-01-07 04:06:44.962	\N	\N
b298933a-8af2-471e-9745-d257e291eefe	xuandung.hoang57@gmail.com	$2b$10$UdHxFNw78vBZUco7Qd7w8eoJtPGR8Ek3Y0JEgNQdIt45e9tDcziG.	Hoàng Xuân Dung	USER	f	2026-01-07 04:06:44.962	2026-01-07 04:06:44.962	\N	0716677728
c6dbda8d-73fb-445b-81b6-72c6d36fff1d	kietvo.7kinh@gmail.com	$2b$10$UdHxFNw78vBZUco7Qd7w8eoJtPGR8Ek3Y0JEgNQdIt45e9tDcziG.	Đinh Kiệt Võ	USER	f	2026-01-07 04:06:44.962	2026-01-07 04:06:44.962	9107 Trần Ridge	\N
0407759c-62a8-4fae-81c8-346433ffc26a	diemtrang.mai@gmail.com	$2b$10$UdHxFNw78vBZUco7Qd7w8eoJtPGR8Ek3Y0JEgNQdIt45e9tDcziG.	Mai Diễm Trang	USER	t	2026-01-07 04:06:44.962	2026-01-07 04:06:44.962	\N	\N
2f875ac4-27a9-4bcc-91ed-43512399afe4	thachthao_nguyen85@gmail.com	$2b$10$UdHxFNw78vBZUco7Qd7w8eoJtPGR8Ek3Y0JEgNQdIt45e9tDcziG.	Nguyễn Thạch Thảo	USER	f	2026-01-07 04:06:44.962	2026-01-07 04:06:44.962	\N	0338183440
9b8733f9-71f9-44a6-b8ea-64f801e54723	monghoa_mai25@gmail.com	$2b$10$UdHxFNw78vBZUco7Qd7w8eoJtPGR8Ek3Y0JEgNQdIt45e9tDcziG.	Mai Mộng Hoa	USER	f	2026-01-07 04:06:44.962	2026-01-07 04:06:44.962	14576 Ý Bình Cove	\N
36482050-48cc-45a5-8632-78badf3a4d07	chikhiem.pham@gmail.com	$2b$10$UdHxFNw78vBZUco7Qd7w8eoJtPGR8Ek3Y0JEgNQdIt45e9tDcziG.	Phạm Chí Khiêm	USER	t	2026-01-07 04:06:44.962	2026-01-07 04:06:44.962	356 Oanh Vũ Groves	0688609729
2eae043e-df1d-4480-9b9a-4b4609eff02f	khuetrung_lam63@gmail.com	$2b$10$UdHxFNw78vBZUco7Qd7w8eoJtPGR8Ek3Y0JEgNQdIt45e9tDcziG.	Lâm Khuê Trung	USER	f	2026-01-07 04:06:44.962	2026-01-07 04:06:44.962	91511 Ngọc Liên Manor	0580153942
4a4ae607-6930-44b2-b93a-e393485bb3f6	ngocminh.ly78@gmail.com	$2b$10$UdHxFNw78vBZUco7Qd7w8eoJtPGR8Ek3Y0JEgNQdIt45e9tDcziG.	Lý Ngọc Minh	USER	f	2026-01-07 04:06:44.962	2026-01-07 04:06:44.962	\N	0448908939
bbb2973d-411e-4710-9c32-78b630772dbe	kimthanh_tran@gmail.com	$2b$10$UdHxFNw78vBZUco7Qd7w8eoJtPGR8Ek3Y0JEgNQdIt45e9tDcziG.	Trần Kim Thanh	USER	f	2026-01-07 04:06:44.962	2026-01-07 04:06:44.962	\N	\N
9ebe27ce-60bd-40a6-976d-fa010189e7ca	maichau_hoang87@gmail.com	$2b$10$UdHxFNw78vBZUco7Qd7w8eoJtPGR8Ek3Y0JEgNQdIt45e9tDcziG.	Hoàng Mai Châu	USER	f	2026-01-07 04:06:44.962	2026-01-07 04:06:44.962	\N	0972220813
b6945782-6f3e-41cb-aa2b-16ae2120bf36	7kuclong_7kang3@gmail.com	$2b$10$UdHxFNw78vBZUco7Qd7w8eoJtPGR8Ek3Y0JEgNQdIt45e9tDcziG.	Đặng Đức Long	USER	t	2026-01-07 04:06:44.962	2026-01-07 04:06:44.962	\N	0898402523
5d2179fe-2552-4ed1-b13b-f4629597d286	huethuong.7kinh72@gmail.com	$2b$10$UdHxFNw78vBZUco7Qd7w8eoJtPGR8Ek3Y0JEgNQdIt45e9tDcziG.	Đinh Huệ Thương	USER	f	2026-01-07 04:06:44.962	2026-01-07 04:06:44.962	1341 Hữu Hùng Courts	0706229176
d9405959-37b1-438e-a0b2-c03a3462d55c	hongphat.nguyen80@gmail.com	$2b$10$UdHxFNw78vBZUco7Qd7w8eoJtPGR8Ek3Y0JEgNQdIt45e9tDcziG.	Nguyễn Hồng Phát	USER	f	2026-01-07 04:06:44.962	2026-01-07 04:06:44.962	\N	\N
76ffc976-674a-430b-aa52-850316098709	hieuhoc.phung79@gmail.com	$2b$10$UdHxFNw78vBZUco7Qd7w8eoJtPGR8Ek3Y0JEgNQdIt45e9tDcziG.	Phùng Hiếu Học	USER	f	2026-01-07 04:06:44.962	2026-01-07 04:06:44.962	\N	0608839107
7b09a51b-634c-48ef-a8d6-7911068e3796	monghoa.vuong@gmail.com	$2b$10$UdHxFNw78vBZUco7Qd7w8eoJtPGR8Ek3Y0JEgNQdIt45e9tDcziG.	Vương Mộng Hoa	USER	f	2026-01-07 04:06:44.962	2026-01-07 04:06:44.962	\N	\N
0fa24c7c-d2f6-48aa-9342-326add35010d	huean_phung@gmail.com	$2b$10$UdHxFNw78vBZUco7Qd7w8eoJtPGR8Ek3Y0JEgNQdIt45e9tDcziG.	Phùng Huệ Ân	USER	f	2026-01-07 04:06:44.962	2026-01-07 04:06:44.962	\N	0097155789
29ea56fd-234b-4f8d-8a19-d95ccdddca21	nhattan.truong@gmail.com	$2b$10$UdHxFNw78vBZUco7Qd7w8eoJtPGR8Ek3Y0JEgNQdIt45e9tDcziG.	Trương Nhật Tấn	USER	t	2026-01-07 04:06:44.962	2026-01-07 04:06:44.962	\N	0721314718
163a8adf-29c2-4966-923c-4f693350026c	danhvan.tran93@gmail.com	$2b$10$UdHxFNw78vBZUco7Qd7w8eoJtPGR8Ek3Y0JEgNQdIt45e9tDcziG.	Trần Danh Văn	USER	f	2026-01-07 04:06:44.962	2026-01-07 04:06:44.962	\N	0491896149
961e98d2-c1a9-4902-8328-c9c1c3323fa6	lapnghiep_tran@gmail.com	$2b$10$UdHxFNw78vBZUco7Qd7w8eoJtPGR8Ek3Y0JEgNQdIt45e9tDcziG.	Trần Lập Nghiệp	USER	t	2026-01-07 04:06:44.962	2026-01-07 04:06:44.962	\N	0514078371
f1cc43be-9146-464d-ac86-8702917c666b	monggiac_ho@gmail.com	$2b$10$UdHxFNw78vBZUco7Qd7w8eoJtPGR8Ek3Y0JEgNQdIt45e9tDcziG.	Hồ Mộng Giác	USER	t	2026-01-07 04:06:44.962	2026-01-07 04:06:44.962	\N	\N
0e997977-0ace-40c5-935b-983dbfbb9065	thuongthuong.nguyen@gmail.com	$2b$10$UdHxFNw78vBZUco7Qd7w8eoJtPGR8Ek3Y0JEgNQdIt45e9tDcziG.	Nguyễn Thương Thương	USER	f	2026-01-07 04:06:44.962	2026-01-07 04:06:44.962	\N	0901809410
d4d7a734-c499-4ecc-9de6-6c02d02fbe62	bichty.mai@gmail.com	$2b$10$UdHxFNw78vBZUco7Qd7w8eoJtPGR8Ek3Y0JEgNQdIt45e9tDcziG.	Mai Bích Ty	USER	f	2026-01-07 04:06:44.962	2026-01-07 04:06:44.962	\N	\N
9b07e751-0ba9-4938-ade1-a4cb64203e17	diemphuong_trinh@gmail.com	$2b$10$UdHxFNw78vBZUco7Qd7w8eoJtPGR8Ek3Y0JEgNQdIt45e9tDcziG.	Trịnh Diễm Phượng	USER	t	2026-01-07 04:06:44.962	2026-01-07 04:06:44.962	\N	0351151134
cdbb47ae-5e0c-49d8-b7b8-9b8bb5bf37f6	hienhoa_bui18@gmail.com	$2b$10$UdHxFNw78vBZUco7Qd7w8eoJtPGR8Ek3Y0JEgNQdIt45e9tDcziG.	Bùi Hiền Hòa	USER	f	2026-01-07 04:06:44.962	2026-01-07 04:06:44.962	5350 Bùi Course	\N
1fc2685e-7a0a-4936-becf-dd9d29cc5aef	annhan_7kinh@gmail.com	$2b$10$UdHxFNw78vBZUco7Qd7w8eoJtPGR8Ek3Y0JEgNQdIt45e9tDcziG.	Đinh An Nhàn	USER	f	2026-01-07 04:06:44.962	2026-01-07 04:06:44.962	9557 Đỗ Glens	\N
d5f8c973-7fc2-4394-a3f4-e6839a13a318	duyhoang_ly80@gmail.com	$2b$10$UdHxFNw78vBZUco7Qd7w8eoJtPGR8Ek3Y0JEgNQdIt45e9tDcziG.	Lý Duy Hoàng	USER	f	2026-01-07 04:06:44.962	2026-01-07 04:06:44.962	\N	0395049890
7f03683e-f49c-4356-bb7e-cd34199ef91c	viethuy_tang23@gmail.com	$2b$10$UdHxFNw78vBZUco7Qd7w8eoJtPGR8Ek3Y0JEgNQdIt45e9tDcziG.	Tăng Việt Huy	USER	t	2026-01-07 04:06:44.962	2026-01-07 04:06:44.962	6963 Dương Rue	\N
4467827c-8c0e-47db-b6c6-f9dade8ef5dc	thuoanh_ngo36@gmail.com	$2b$10$UdHxFNw78vBZUco7Qd7w8eoJtPGR8Ek3Y0JEgNQdIt45e9tDcziG.	Ngô Thu Oanh	USER	f	2026-01-07 04:06:44.962	2026-01-07 04:06:44.962	986 Thiếu Anh Cliffs	0680351658
42a4a14c-760f-4410-9e27-8578722fc429	vinhtho.le10@gmail.com	$2b$10$UdHxFNw78vBZUco7Qd7w8eoJtPGR8Ek3Y0JEgNQdIt45e9tDcziG.	Lê Vĩnh Thọ	USER	t	2026-01-07 04:06:44.962	2026-01-07 04:06:44.962	916 Trương Points	\N
c9285c95-27ac-4cea-8c25-1dded1e8bc2f	mynhan.bui@gmail.com	$2b$10$UdHxFNw78vBZUco7Qd7w8eoJtPGR8Ek3Y0JEgNQdIt45e9tDcziG.	Bùi Mỹ Nhân	USER	t	2026-01-07 04:06:44.962	2026-01-07 04:06:44.962	\N	0071140885
511c46ed-b1e9-4f75-afa5-c3107f1c4b86	kiencuong_tran95@gmail.com	$2b$10$UdHxFNw78vBZUco7Qd7w8eoJtPGR8Ek3Y0JEgNQdIt45e9tDcziG.	Trần Kiên Cường	USER	t	2026-01-07 04:06:44.962	2026-01-07 04:06:44.962	\N	0645684589
0c29d5db-487c-4894-8134-5c3c347c70eb	7kinhthien.lam29@gmail.com	$2b$10$UdHxFNw78vBZUco7Qd7w8eoJtPGR8Ek3Y0JEgNQdIt45e9tDcziG.	Lâm Đình Thiện	USER	f	2026-01-07 04:06:44.962	2026-01-07 04:06:44.962	\N	\N
c8f58d71-c696-4d8a-b785-e302527d42d1	bachcuc_phung14@gmail.com	$2b$10$UdHxFNw78vBZUco7Qd7w8eoJtPGR8Ek3Y0JEgNQdIt45e9tDcziG.	Phùng Bạch Cúc	USER	t	2026-01-07 04:06:44.962	2026-01-07 04:06:44.962	615 Sơn Hà Estate	0481135674
3eeb506c-28c7-4744-918b-378e11672141	huuthuc.hoang55@gmail.com	$2b$10$UdHxFNw78vBZUco7Qd7w8eoJtPGR8Ek3Y0JEgNQdIt45e9tDcziG.	Hoàng Hữu Thực	USER	f	2026-01-07 04:06:44.962	2026-01-07 04:06:44.962	\N	\N
c8957e1a-1730-48fa-8cdd-4ef31d233745	thuy7kao_7kinh@gmail.com	$2b$10$UdHxFNw78vBZUco7Qd7w8eoJtPGR8Ek3Y0JEgNQdIt45e9tDcziG.	Đinh Thụy Đào	USER	t	2026-01-07 04:06:44.962	2026-01-07 04:06:44.962	2646 Mai Row	\N
505efdd1-efe9-4980-b6c2-6a854176f3b0	7kucnhan.7kang@gmail.com	$2b$10$UdHxFNw78vBZUco7Qd7w8eoJtPGR8Ek3Y0JEgNQdIt45e9tDcziG.	Đặng Đức Nhân	USER	f	2026-01-07 04:06:44.962	2026-01-07 04:06:44.962	738 Vũ Road	0302423457
297db9a6-5d17-41e6-b32c-456f313d87bf	huuvinh_tang@gmail.com	$2b$10$UdHxFNw78vBZUco7Qd7w8eoJtPGR8Ek3Y0JEgNQdIt45e9tDcziG.	Tăng Hữu Vĩnh	USER	f	2026-01-07 04:06:44.962	2026-01-07 04:06:44.962	67523 Hồng Thụy Station	\N
cc7b0c4e-35ac-41b3-be33-5d39860ad12c	7kuckhai_tran@gmail.com	$2b$10$UdHxFNw78vBZUco7Qd7w8eoJtPGR8Ek3Y0JEgNQdIt45e9tDcziG.	Trần Đức Khải	USER	t	2026-01-07 04:06:44.962	2026-01-07 04:06:44.962	28749 Vương Triều Rest	\N
fd0272d7-5cb5-4854-8170-7f9edc8b60af	xuanmai.ngo@gmail.com	$2b$10$UdHxFNw78vBZUco7Qd7w8eoJtPGR8Ek3Y0JEgNQdIt45e9tDcziG.	Ngô Xuân Mai	USER	t	2026-01-07 04:06:44.962	2026-01-07 04:06:44.962	\N	\N
ef3f2d97-6ae1-408c-9498-6e9d8a8acc0a	giahung.vu53@gmail.com	$2b$10$UdHxFNw78vBZUco7Qd7w8eoJtPGR8Ek3Y0JEgNQdIt45e9tDcziG.	Vũ Gia Hùng	USER	t	2026-01-07 04:06:44.962	2026-01-07 04:06:44.962	\N	\N
7daaa864-cfeb-4ea7-8530-f99d2c809855	trung7kuc.7kao@gmail.com	$2b$10$UdHxFNw78vBZUco7Qd7w8eoJtPGR8Ek3Y0JEgNQdIt45e9tDcziG.	Đào Trung Đức	USER	t	2026-01-07 04:06:44.962	2026-01-07 04:06:44.962	\N	0691931711
39c8a16b-9220-43cd-83b6-63d2f34c5973	tuantai.7kao78@gmail.com	$2b$10$UdHxFNw78vBZUco7Qd7w8eoJtPGR8Ek3Y0JEgNQdIt45e9tDcziG.	Đào Tuấn Tài	USER	t	2026-01-07 04:06:44.962	2026-01-07 04:06:44.962	\N	\N
af2dfc52-0e5e-400e-ae65-a9ffe58fbea5	diepanh.nguyen@gmail.com	$2b$10$UdHxFNw78vBZUco7Qd7w8eoJtPGR8Ek3Y0JEgNQdIt45e9tDcziG.	Nguyễn Diệp Anh	USER	t	2026-01-07 04:06:44.962	2026-01-07 04:06:44.962	8192 Đào Stream	0645876618
24f15538-1063-4eb3-89cd-a95ff5be9408	phihoang.7kao@gmail.com	$2b$10$UdHxFNw78vBZUco7Qd7w8eoJtPGR8Ek3Y0JEgNQdIt45e9tDcziG.	Đào Phi Hoàng	USER	f	2026-01-07 04:06:44.962	2026-01-07 04:06:44.962	\N	\N
08e4b7ee-549f-4548-b923-da1ad0b3f062	tuyetnhung.bui@gmail.com	$2b$10$UdHxFNw78vBZUco7Qd7w8eoJtPGR8Ek3Y0JEgNQdIt45e9tDcziG.	Bùi Tuyết Nhung	USER	t	2026-01-07 04:06:44.962	2026-01-07 04:06:44.962	\N	\N
b7afb9d1-a5bd-4ff9-9db6-1638c6d5b1c0	caonhan_le@gmail.com	$2b$10$UdHxFNw78vBZUco7Qd7w8eoJtPGR8Ek3Y0JEgNQdIt45e9tDcziG.	Lê Cao Nhân	USER	f	2026-01-07 04:06:44.962	2026-01-07 04:06:44.962	239 Đỗ Oval	\N
4a9f2db8-ea65-4056-a00c-5d60fa6c6afd	ngocngan.tang2@gmail.com	$2b$10$UdHxFNw78vBZUco7Qd7w8eoJtPGR8Ek3Y0JEgNQdIt45e9tDcziG.	Tăng Ngọc Ngạn	USER	t	2026-01-07 04:06:44.962	2026-01-07 04:06:44.962	\N	0790471023
b3f4d3a3-4a58-4c8d-b838-e079d8e91d49	tuansy.trinh82@gmail.com	$2b$10$UdHxFNw78vBZUco7Qd7w8eoJtPGR8Ek3Y0JEgNQdIt45e9tDcziG.	Trịnh Tuấn Sỹ	USER	f	2026-01-07 04:06:44.962	2026-01-07 04:06:44.962	\N	\N
f2947181-ddcb-404c-a0f3-0cd6e119f086	thuyhuong.ha@gmail.com	$2b$10$UdHxFNw78vBZUco7Qd7w8eoJtPGR8Ek3Y0JEgNQdIt45e9tDcziG.	Hà Thúy Hương	USER	f	2026-01-07 04:06:44.962	2026-01-07 04:06:44.962	791 Trịnh Cliff	0353301059
add80722-95bd-4ac1-8329-76e4dce01b6d	thuongxuan_mai18@gmail.com	$2b$10$UdHxFNw78vBZUco7Qd7w8eoJtPGR8Ek3Y0JEgNQdIt45e9tDcziG.	Mai Thường Xuân	USER	f	2026-01-07 04:06:44.962	2026-01-07 04:06:44.962	5135 Lục Bình Loop	\N
5a7e30c8-afba-4e82-afb6-8c9999e5c45e	huongtien_ly16@gmail.com	$2b$10$UdHxFNw78vBZUco7Qd7w8eoJtPGR8Ek3Y0JEgNQdIt45e9tDcziG.	Lý Hương Tiên	USER	f	2026-01-07 04:06:44.962	2026-01-07 04:06:44.962	9949 Trịnh Vista	0939185457
2b2ca2ed-70a6-4c20-b794-b2a1b3a229c3	dahuong_phan@gmail.com	$2b$10$UdHxFNw78vBZUco7Qd7w8eoJtPGR8Ek3Y0JEgNQdIt45e9tDcziG.	Phan Dạ Hương	USER	f	2026-01-07 04:06:44.962	2026-01-07 04:06:44.962	\N	0038254436
69a58920-9d2a-4499-9bbe-7c9dd25b4df3	thongtue_trinh@gmail.com	$2b$10$UdHxFNw78vBZUco7Qd7w8eoJtPGR8Ek3Y0JEgNQdIt45e9tDcziG.	Trịnh Thông Tuệ	USER	f	2026-01-07 04:06:44.962	2026-01-07 04:06:44.962	\N	0354462290
72711264-3baf-4ab4-a93a-98daed24e9be	minhtri.fit@gmail.com	$2b$10$T15DNfS.6dqMMo7xfCGvkOnGNxTyHrnQ6wBXX2kOnI.Iro1fZsRVm	Lê Minh Trí	USER	t	2026-01-10 16:12:34.08	2026-01-10 16:12:34.08	542/12 Nguyễn Kiệm	0932791043
\.


--
-- Data for Name: Order; Type: TABLE DATA; Schema: public; Owner: postgresql
--

COPY public."Order" (id, "orderCode", "totalAmount", status, "customerId", "createdAt", "updatedAt", "userId", note, "deliveryStatus", "deliveryAddress") FROM stdin;
\.


--
-- Data for Name: Product; Type: TABLE DATA; Schema: public; Owner: postgresql
--

COPY public."Product" (id, name, sku, price, description, "isActive", "categoryId", "createdAt", "updatedAt", "imagesUrl", slug, stock) FROM stdin;
d9bd9a8c-5aed-4255-ac7a-36c7db86ad7f	Cà phê đen	SKU-R1MMYP	30000	Cà phê đen không đường	t	7ca58ff4-6b27-44b8-a83d-4be20d95a1cd	2026-01-12 03:34:34.451	2026-01-12 04:03:52.698	{http://localhost:5000/uploads/1768188872730-487161490.jpg}	ca-phe-den-mau-1	100
8ece4d0d-6ca0-4d4c-b731-07387eedc8a9	Bánh Tiramisu	SKU-ZUQA3G	45500	Bánh ngọt lạnh	t	460b0ebd-98a8-4cdc-b995-75a86b321511	2026-01-12 03:30:34.375	2026-01-12 04:03:56.727	{http://localhost:5000/uploads/1768188632898-356659879.png}	banh-tiramisu-mau-1	100
bb76bda1-0e80-4005-a5f6-1c49b68bce7a	Cà phê nâu đặc biệt	SKU-LS00FY	25000	Vị nguyên bản của cà phê	t	7ca58ff4-6b27-44b8-a83d-4be20d95a1cd	2026-01-12 03:56:53.115	2026-01-12 04:43:10.299	{http://localhost:5000/uploads/1768190209359-825797487.jpg}	ca-phe-nau-dac-biet	50
f5ce71be-353e-4933-89c0-6653d3e9f3d0	Bánh chuối hạt dinh dưỡng	SKU-UDQWFJ	39000	Bánh chuối vị Socola	t	cb8192f2-7ddb-4611-8cf6-6c22aae6a534	2026-01-12 04:06:12.821	2026-01-12 04:43:18.665	{http://localhost:5000/uploads/1768190771809-978727161.png}	banh-chuoi-hat-dinh-duong	10
4e553107-51fd-4697-87f1-c8c17d33ac8e	Monster Energy Vị Nguyên Bản	SKU-8QIB10	29000	Vị nguyên bản size lớn	t	286631c0-b3b3-4055-8b3f-b8a3b0637648	2026-01-12 04:09:35.426	2026-01-12 05:08:16.213	{http://localhost:5000/uploads/1768190973801-170466901.png,http://localhost:5000/uploads/1768193416980-425570219.png}	monster-energy-vi-nguyen-ban	250
8c4a6223-e86a-471f-aae5-0487c7d06bda	Khô bò xé Hải Châu	SKU-RQDCEV	119000	Hũ 100g	t	cb8192f2-7ddb-4611-8cf6-6c22aae6a534	2026-01-12 07:20:18.561	2026-01-12 07:20:18.561	{http://localhost:5000/uploads/1768202383486-941420044.jpg}	kho-bo-xe-hai-chau	40
fd2c00be-1600-403e-8602-05600d301a83	Bánh tráng khô bò Vi	SKU-1ST7SQ	22000	Gói 55g	t	cb8192f2-7ddb-4611-8cf6-6c22aae6a534	2026-01-12 07:21:37.808	2026-01-12 07:21:37.808	{http://localhost:5000/uploads/1768202496783-617604854.jpg}	banh-trang-kho-bo-vi	120
00bcd6a5-cd01-45ab-8a84-1af5984d0e94	Cà phê Đà Lạt	SKU-97W6N3	35550	Cà phê Arabica Đà Lạt đậm đà hoà quyện cùng kem whipping thơm ngậy.	t	7ca58ff4-6b27-44b8-a83d-4be20d95a1cd	2026-01-12 11:31:32.549	2026-01-12 11:31:32.549	{http://localhost:5000/uploads/1768217491522-405899145.jpg}	ca-phe-da-lat	100
27cc074c-8684-4b0e-843a-bf82fd542fc7	CROSS CUT POLO / Black-Grey Color	SKU-2E462F	165000	‼️LƯU Ý ▪️Khi giặt sản phẩm bằng tay: Vui lòng hoà tan kĩ nước giặt, bột giặt với nước sau đó mới cho sản phẩm vào. ▪️Khi giặt sản phẩm bằng máy giặt: Vui lòng đổ nước giặt, bột giặt vào khay của máy.\n\n 🚫TUYỆT ĐỐI KHÔNG đổ nước giặt, bột giặt trực tiếp vào sản phẩm. Như vậy sẽ ảnh hưởng đến màu sắc của sản phẩm và làm cho áo có tình trạng loang màu. Shop xin cảm ơn ạ🖤\n\n🔹 Chính sách đổi trả Shop.\n– Miễn phí đổi hàng cho khách mua ở Shop trong trường hợp bị lỗi từ nhà sản xuất, giao nhầm hàng, nhầm size.\n- Quay video mở sản phẩm khi nhận hàng, nếu không có video unbox, khi phát hiện lỗi phải báo ngay cho Shop trong 1 ngày tính từ ngày giao hàng thành công. Qua 1 ngày chúng mình không giải quyết khi không có video unbox.\n– Sản phẩm đổi trong thời gian 3 ngày kể từ ngày nhận hàng\n– Sản phẩm còn mới nguyên tem, tags, sản phẩm chưa giặt và không dơ bẩn, hư hỏng bởi những tác nhân bên ngoài cửa hàng sau khi mua hàng.\n👉 Đặc biệt:\n– Tất cả sản phẩm ver 3.0 sẽ được hỗ trợ trả hàng hoàn tiền trong vòng 05 ngày kể từ ngày nhận hàng nếu có trải nghiệm không tốt, không hài lòng về sản phẩm\n– Chấp nhận trả hàng hoàn tiền với sản phẩm đã qua sử dụng, không còn nguyên tag tuy nhiên sản phẩm phải còn nguyên vẹn, không bị rách, bung chỉ, bạc màu do quá trình sử dụng	t	c529266e-7706-4809-b784-cfcb81596e20	2026-01-12 07:25:16.36	2026-01-12 07:28:35.572	{http://localhost:5000/uploads/1768202715044-201063080.jpg}	cross-cut-polo-black-grey-color	100
d3a3e4be-4b14-4041-a663-55b353aa7ef5	BAD F1 JERSEY	SKU-4DUC9W	420000	•Thiết kế: form oversize hiện đại, màu sắc phối hài hòa, phù hợp cho mọi outfit từ casual đến sporty.\n\nChất liệu: Vải mè cao cấp, thoáng khí, giúp bạn luôn thoải mái khi mặc.\n\nKỹ thuật: In lụa sắc nét kết hợp với patch thêu và ép cao thành, tạo hiệu ứng nổi bật và bền bỉ theo thời gian.	t	c529266e-7706-4809-b784-cfcb81596e20	2026-01-12 07:32:49.446	2026-01-12 07:32:49.446	{http://localhost:5000/uploads/1768203167251-334553119.jpg}	bad-f1-jersey	20
c2847fe7-ff94-4b8a-b1b0-9de05d9d0cc9	SUPERTRAMP MULTI-POCKET SHORTS	SKU-VAVADN	550000	Được phát triển từ tinh thần outdoor trekking, thiết kế này tập trung vào tính ứng dụng cao, phom dáng gọn gàng và chất liệu bền bỉ. SUPERTRAMP MULTI-POCKET SHORTS là lựa chọn không thể thiếu trong hành trang của những kẻ nghiện dịch chuyển.\n\n- Form dáng: Oversize\n- Chất liệu: Dù 100% nylon\n- Kỹ thuật: Hệ thống túi chuyên dụng, hệ thống thoáng khí, patch logo kết hợp in cao thành	t	c529266e-7706-4809-b784-cfcb81596e20	2026-01-12 07:33:47.12	2026-01-12 07:33:47.12	{http://localhost:5000/uploads/1768203225384-731602653.jpg}	supertramp-multi-pocket-shorts	30
9c75a5b6-b8e7-4011-bec5-70c4fca2567c	Bánh quy yến mạch mix 3 vị Quaker	SKU-QGJXWD	109000	Hộp thiếc (3g)	t	cb8192f2-7ddb-4611-8cf6-6c22aae6a534	2026-01-12 11:13:56.658	2026-01-12 11:13:56.658	{http://localhost:5000/uploads/1768216434480-806957610.jpg}	banh-quy-yen-mach-mix-3-vi-quaker	100
a143eb0d-f88a-4714-8422-0fd64412e9b2	Bánh Choco Pie Orion	SKU-01K9DG	52000	Hộp 33g x 12 gói	t	cb8192f2-7ddb-4611-8cf6-6c22aae6a534	2026-01-12 11:15:12.712	2026-01-12 11:15:12.712	{http://localhost:5000/uploads/1768216511180-881893158.jpg}	banh-choco-pie-orion	100
3d24a690-6ae8-4f35-9cbe-6e5cc69aa804	Bánh quy Petit Beurre Lu	SKU-DID84P	256000	Hộp 600g	t	cb8192f2-7ddb-4611-8cf6-6c22aae6a534	2026-01-12 11:16:08.506	2026-01-12 11:16:08.506	{http://localhost:5000/uploads/1768216563641-965468031.jpg}	banh-quy-petit-beurre-lu	100
3ad8ce5f-5226-4e41-b2ff-26418022a523	Bánh gạo An vị tảo biển Orion	SKU-ZY7Y7V	22500	Gói 111.3g	t	cb8192f2-7ddb-4611-8cf6-6c22aae6a534	2026-01-12 11:17:59.213	2026-01-12 11:17:59.213	{http://localhost:5000/uploads/1768216676541-314478669.jpg}	banh-gao-an-vi-tao-bien-orion	20
503bc40b-a82f-4c51-a7d2-a85738e2ea9a	Bánh quy Kenju rau củ Richy	SKU-7RRCX0	46000	Gói 192g	t	cb8192f2-7ddb-4611-8cf6-6c22aae6a534	2026-01-12 11:20:02.247	2026-01-12 11:20:02.247	{http://localhost:5000/uploads/1768216800820-728930129.jpg}	banh-quy-kenju-rau-cu-richy	500
b97aae67-431a-4ca4-a59d-f42de7a5a78a	Bánh gạo cuộn vị phô mai Want Want	SKU-T6OA8R	29000	Gói 170g	t	cb8192f2-7ddb-4611-8cf6-6c22aae6a534	2026-01-12 11:21:14.804	2026-01-12 11:21:14.804	{http://localhost:5000/uploads/1768216847062-532398150.jpg}	banh-gao-cuon-vi-pho-mai-want-want	400
44808874-2789-4e32-a215-7ea6ab3ec556	Bánh gạo Nhật vị shouyu mật ong Ichi	SKU-91BTB5	40000	Gói 180g	t	cb8192f2-7ddb-4611-8cf6-6c22aae6a534	2026-01-12 11:22:03.819	2026-01-12 11:22:03.819	{http://localhost:5000/uploads/1768216922909-332419801.jpg}	banh-gao-nhat-vi-shouyu-mat-ong-ichi	300
bb4270d7-0796-486c-9368-906b32d3438c	Bánh trứng muối Sheng Tian	SKU-NBFW1F	75000	Gói 180g	t	cb8192f2-7ddb-4611-8cf6-6c22aae6a534	2026-01-12 11:23:33.536	2026-01-12 11:23:33.536	{http://localhost:5000/uploads/1768217012537-77428079.jpg}	banh-trung-muoi-sheng-tian	100
6f3df853-178a-493c-8cad-e8a68e245ba9	Bánh gạo Hàn Quốc Richy	SKU-EL2Z0Y	41000	Gói 303g	t	cb8192f2-7ddb-4611-8cf6-6c22aae6a534	2026-01-12 11:24:16.762	2026-01-12 11:24:16.762	{http://localhost:5000/uploads/1768217055595-198380405.jpg}	banh-gao-han-quoc-richy	120
6c32938e-6ab2-4158-ac79-d8e55b4ba883	Bánh quy nougat kem sữa Richy Kenju	SKU-SEJI3E	46000	Gói 186g	t	cb8192f2-7ddb-4611-8cf6-6c22aae6a534	2026-01-12 11:25:55.314	2026-01-12 11:25:55.314	{http://localhost:5000/uploads/1768217153671-309965900.jpg}	banh-quy-nougat-kem-sua-richy-kenju	100
830b506d-b5a3-4aa4-9246-c5a01d7f357d	Bánh gạo chà bông JinJu Richy	SKU-OL4N9Q	39900	Gói 168g	t	cb8192f2-7ddb-4611-8cf6-6c22aae6a534	2026-01-12 11:26:43.284	2026-01-12 11:26:43.284	{http://localhost:5000/uploads/1768217201817-848963933.jpg}	banh-gao-cha-bong-jinju-richy	200
7c879a78-4b81-4b57-b9da-6d3f4019e3ef	Bánh kem ốc quế vị sô cô la Pororo	SKU-E6FJMH	64000	Hộp 54g	t	cb8192f2-7ddb-4611-8cf6-6c22aae6a534	2026-01-12 11:27:36.027	2026-01-12 11:27:36.027	{http://localhost:5000/uploads/1768217255226-114193266.jpg}	banh-kem-oc-que-vi-so-co-la-pororo	200
7d4097a8-4981-49ac-a61c-8836709ca8d7	Bánh gạo An vị tự nhiên Orion	SKU-D7SV1V	22500	Gói 151.2g	t	cb8192f2-7ddb-4611-8cf6-6c22aae6a534	2026-01-12 11:28:19.254	2026-01-12 11:28:19.254	{http://localhost:5000/uploads/1768217278721-360001158.jpg}	banh-gao-an-vi-tu-nhien-orion	200
0abf7597-6c23-481e-9f27-8f226906f61d	Bạc sỉu vị Vani	SKU-Z4LOO2	30000	(Có sẵn Thạch) Vị chua nhẹ tự nhiên của hạt Arabica Lạc Dương & Robusta Lâm Hà, hoà quyện cùng Vani Tự Nhiên, Thạch Xỉu Vani mềm mượt và Sữa Tươi Thanh Trùng đem đến hương vị đậm mượt đầy tinh tế.	t	7ca58ff4-6b27-44b8-a83d-4be20d95a1cd	2026-01-12 11:30:18.072	2026-01-12 11:30:18.072	{http://localhost:5000/uploads/1768217410171-921576460.jpg}	bac-siu-vi-vani	100
\.


--
-- Data for Name: OrderItem; Type: TABLE DATA; Schema: public; Owner: postgresql
--

COPY public."OrderItem" (id, "orderId", "productId", quantity, price) FROM stdin;
\.


--
-- Data for Name: Payment; Type: TABLE DATA; Schema: public; Owner: postgresql
--

COPY public."Payment" (id, "orderId", amount, method, "paidAt") FROM stdin;
\.


--
-- Data for Name: _prisma_migrations; Type: TABLE DATA; Schema: public; Owner: postgresql
--

COPY public._prisma_migrations (id, checksum, finished_at, migration_name, logs, rolled_back_at, started_at, applied_steps_count) FROM stdin;
792499f5-8ced-4468-a193-8bc290f52765	d53adad52e0ea4d362393fd5ec102a0fa81408cb6cc93db42cd29530f94975ff	2026-01-06 10:13:14.37638+00	20260104110523_init_user	\N	\N	2026-01-06 10:13:14.366626+00	1
6e0e79a9-ebd5-425a-bd9d-2ee866257169	67fe523861c3df66b978dd40b31a5090e100fc804ae8a0fd9ba8284bf6dd9879	2026-01-07 10:50:40.65035+00	20260107105040_update_product_sku_validate	\N	\N	2026-01-07 10:50:40.638671+00	1
df46c35d-64a3-430b-b14d-b0824a8c918c	735dbf532ee8d2a05e35cb295851cf6f89b3c9900b9162b24b2c1e17941bb973	2026-01-06 10:13:23.515657+00	20260106101323_init_schema	\N	\N	2026-01-06 10:13:23.487938+00	1
b75f79ff-2341-4299-88ef-a50b4533b56e	e1be3c413d94a88dc356f45a326dfc98c83e105eb1b2cdb267977e1ead3dc13e	2026-01-06 11:06:10.558177+00	20260106110610_update_id_type	\N	\N	2026-01-06 11:06:10.522583+00	1
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
6cb696cb-eec8-4b4b-aa09-007e8df08203	72c52e8efa698953b59c7b146af7c665dcdd7d95ce9fb7311104b635a9e93528	2026-01-07 10:36:49.777374+00	20260107103649_update_product_slug	\N	\N	2026-01-07 10:36:49.763664+00	1
da6e7966-ef3a-4db8-9874-af7a36d963e1	e6e1da2bd8954026923ba16627e6645a36291e08daee8c6a4206516f7424b391	2026-01-11 13:08:08.884537+00	20260111130808_update_product_stock	\N	\N	2026-01-11 13:08:08.714007+00	1
\.


--
-- PostgreSQL database dump complete
--

\unrestrict lS7LcaFaZ3ph8fb1GQf95bAYevqmIbhcGdsDbA0AfVbmIxJmP5SFEvU59APdM9m

