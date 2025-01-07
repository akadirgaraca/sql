-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Anamakine: 127.0.0.1
-- Üretim Zamanı: 21 Ara 2024, 10:39:10
-- Sunucu sürümü: 10.4.28-MariaDB
-- PHP Sürümü: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Veritabanı: `kado`
--

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `filmler`
--

CREATE TABLE `filmler` (
  `id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `description` text DEFAULT NULL,
  `releasedate` text NOT NULL,
  `image` varchar(255) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `puan` float DEFAULT 0,
  `oy_sayisi` int(11) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Tablo döküm verisi `filmler`
--

INSERT INTO `filmler` (`id`, `title`, `description`, `releasedate`, `image`, `created_at`, `puan`, `oy_sayisi`) VALUES
(3, 'Spiderman Across the Spider Serse', 'Spider-Man: Across the Spider-Verse ABD\'de 2 Haziran 2023\'te yayınlanması planlanıyor ve COVID-19 salgını nedeniyle ilk Nisan 2022 tarihinden ertelendi. İkinci Bölüm\'ün 2024\'te vizyona girmesi bekleniyor ve kadın odaklı bir spin-off filmi de geliştiriliyor.', '2023', 'Dial-M-Across-Spidey-cover.webp', '2024-12-18 23:03:39', 0, 0),
(4, 'Transformers: Canavarların Yükselişi', 'Transformers: Canavarların Yükselişi, Otobotlarla Decepticon\'lar arasındaki savaşa yeni dahil olan Predacon, Terrorconlar ve Maximal\'ın maceralarını konu ediyor. Brooklyn\'li kurnaz genç bir adam olan Noah ve gelecek vadeden arkeolog Elena, onları dünyanın dört bir yanına götürecek bir maceraya atılır.', '2023', 'unnamed.png', '2024-12-18 23:07:04', 0, 0),
(5, ' Adalet 3: Son', 'Bir hükümet suikastçısı olan Robert McCall, ezilenlerin yanında olup, adaleti sağlamaya çalışarak teselli bulur. Suikastçı olarak çalıştığı hayatından vazgeçen Robert, geçmişinde yaptığı korkunç şeylerin yükünü taşır ve kendisini affetmek için çabalar.', '2020', 'images.jpg', '2024-12-18 23:09:17', 0, 0),
(6, 'The punisher', 'Hikâyesi. Punisher\'ın gerçek adı Frank Castle\'dır. Punisher suçla savaş için, işkence, adam kaçırma, tehdit, öldürme gibi yöntemleri geçerli sayan bir karakterdir. Ailesi New York Central Park\' ta bir mafya cinayetine tanık olması ve mafyanın bunu fark etmesi üzerine öldürülmüştür.', '2021', 'images (1).jpg', '2024-12-18 23:10:29', 0, 0),
(7, ' The Batman', 'Robert Pattinson\'ın Kara Şövalye\'ye hayat verdiği The Batman, Gotham\'daki ucu kendi ailesine de uzanan yolsuzlukları temizleye çalışan Batman\'in, bir yandan Riddler isimli bir seri katille mücadelesini anlatıyor.', '2022', 'images (2).jpg', '2024-12-18 23:11:42', 0, 0),
(8, 'yüzüklerin efendisi 1 yüzük kardeşliği', 'Çok eski çağlarda Elf demircileri, güç yüzüklerini sihirli ustalıklarıyla yapmış ve Karanlıkların Efendisi Sauron, bu yüzükleri işleyip kendi gücüyle doldurmuştur. Daha sonra kendisinden çalınan, diğer tüm yüzüklere hükmeden, Tek Yüzüğü bütün gücüyle tüm Orta Dünya\'da aramasına rağmen bulamamıştır. Yüzük, Shire Bölgesi\'nde yaşayan Frodo Baggins adlı bir hobbitte bulunmaktadır. Ancak çok büyük bir güce sahip bu yüzüğü yok etmek gerekmektedir. Frodo ve arkadaşları, diğer ırklardan gelen arkadaşlarıyla birlikte yüzük kardeşliğini oluşturur ve hepsi bu yolculukta büyücü Gri Gandalf\'ı izler.', '2001', 'images (3).jpg', '2024-12-18 23:17:57', 0, 0);

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `film_puanlari`
--

CREATE TABLE `film_puanlari` (
  `id` int(11) NOT NULL,
  `film_id` int(11) NOT NULL,
  `kullanici_id` int(11) NOT NULL,
  `puan` tinyint(4) NOT NULL CHECK (`puan` between 1 and 5),
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `kullanicilar`
--

CREATE TABLE `kullanicilar` (
  `id` int(11) NOT NULL,
  `kullanici_adi` varchar(255) NOT NULL,
  `sifre` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `verification_code` varchar(6) NOT NULL,
  `is_verified` tinyint(1) DEFAULT 0,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `role` varchar(255) DEFAULT 'user',
  `reset_code` int(11) DEFAULT NULL,
  `reset_time` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Tablo döküm verisi `kullanicilar`
--

INSERT INTO `kullanicilar` (`id`, `kullanici_adi`, `sifre`, `email`, `verification_code`, `is_verified`, `created_at`, `role`, `reset_code`, `reset_time`) VALUES
(19, 'kadir', '$2y$10$4Vozq4HIXTxCyd0/EWgOIu0kkhDUo2QggKB/kv/0V5z76.wS1Qn0W', 'abdulladirgaraca@gmail.com', '743965', 1, '2024-12-16 15:36:00', 'mod', NULL, NULL),
(20, 'ercan', '$2y$10$fszockaM2IxXEFUAZZ/us.LHT0.Utb.Z.7c1eQJ1fe8794VzhmKTu', 'akayercan47@gmail.com', '127777', 1, '2024-12-18 21:50:44', 'user', NULL, NULL),
(21, 'mami', '$2y$10$v3GoHvXXNzARDOaVOoFth.Nikuug07tzK.b33vAjX78lbE/jJNOZ.', 'mng869964@gmail.com', '148306', 0, '2024-12-18 23:13:03', 'user', NULL, NULL),
(22, 'muhammed', '$2y$10$FvHvulvdmX7vJ1Je4FyiKeqpw1kG47JWghpgCic2E1fdWc.5qBYEe', 'aknnkoray@gmail.com', '459865', 1, '2024-12-18 23:14:04', 'user', NULL, NULL),
(23, 'ercan1', '$2y$10$bdM7cv9WepchC.8fN242yOlyOwosPXPPO/kCUbx/RQVlmiA2H8Qxa', 'kemalserer444@gmail.com', '507971', 1, '2024-12-18 23:36:32', 'user', NULL, NULL),
(24, 'emirhan', '$2y$10$ZDeAZ6h31SXm7UnAJTyfC.Sxo5ej41pCGiedQIZDPePC6u6aNgRg.', 'merhabaemo123@gmail.com', '275796', 1, '2024-12-19 08:00:23', 'user', NULL, NULL);

--
-- Dökümü yapılmış tablolar için indeksler
--

--
-- Tablo için indeksler `filmler`
--
ALTER TABLE `filmler`
  ADD PRIMARY KEY (`id`);

--
-- Tablo için indeksler `film_puanlari`
--
ALTER TABLE `film_puanlari`
  ADD PRIMARY KEY (`id`);

--
-- Tablo için indeksler `kullanicilar`
--
ALTER TABLE `kullanicilar`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `kullanici_adi` (`kullanici_adi`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Dökümü yapılmış tablolar için AUTO_INCREMENT değeri
--

--
-- Tablo için AUTO_INCREMENT değeri `filmler`
--
ALTER TABLE `filmler`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- Tablo için AUTO_INCREMENT değeri `film_puanlari`
--
ALTER TABLE `film_puanlari`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Tablo için AUTO_INCREMENT değeri `kullanicilar`
--
ALTER TABLE `kullanicilar`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
