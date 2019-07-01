-- phpMyAdmin SQL Dump
-- version 4.9.0.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jul 01, 2019 at 02:34 PM
-- Server version: 10.3.15-MariaDB
-- PHP Version: 7.3.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `cms`
--

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `cat_id` int(3) NOT NULL,
  `cat_title` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`cat_id`, `cat_title`) VALUES
(1, 'Bootstrap'),
(2, 'JavaScript'),
(3, 'PHP'),
(4, 'JAVA'),
(6, 'AngularJS');

-- --------------------------------------------------------

--
-- Table structure for table `comments`
--

CREATE TABLE `comments` (
  `comment_id` int(3) NOT NULL,
  `comment_post_id` int(3) NOT NULL,
  `comment_author` varchar(255) NOT NULL,
  `comment_email` varchar(255) NOT NULL,
  `comment_content` text NOT NULL,
  `comment_status` varchar(255) NOT NULL,
  `comment_date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `comments`
--

INSERT INTO `comments` (`comment_id`, `comment_post_id`, `comment_author`, `comment_email`, `comment_content`, `comment_status`, `comment_date`) VALUES
(4, 1, 'asd', 'asd@gmail.com', 'asdasd', 'approved', '2019-01-15'),
(5, 1, 'Pera', 'pera@gmail.com', 'pera pera', 'unapproved', '2019-01-26'),
(9, 16, 'asd', 'asda@gmail.com', 'asdaasd', 'unapproved', '2019-01-31');

-- --------------------------------------------------------

--
-- Table structure for table `likes`
--

CREATE TABLE `likes` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `post_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `likes`
--

INSERT INTO `likes` (`id`, `user_id`, `post_id`) VALUES
(14, 3, 5),
(19, 3, 1);

-- --------------------------------------------------------

--
-- Table structure for table `posts`
--

CREATE TABLE `posts` (
  `post_id` int(3) NOT NULL,
  `post_category_id` int(3) NOT NULL,
  `post_title` varchar(255) NOT NULL,
  `post_author` varchar(255) NOT NULL,
  `post_user` varchar(255) NOT NULL,
  `post_date` date NOT NULL,
  `post_image` text NOT NULL,
  `post_content` text NOT NULL,
  `post_tags` varchar(255) NOT NULL,
  `post_comment_count` int(11) NOT NULL,
  `post_status` varchar(255) NOT NULL DEFAULT 'draft',
  `post_views_count` int(11) NOT NULL,
  `likes` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `posts`
--

INSERT INTO `posts` (`post_id`, `post_category_id`, `post_title`, `post_author`, `post_user`, `post_date`, `post_image`, `post_content`, `post_tags`, `post_comment_count`, `post_status`, `post_views_count`, `likes`) VALUES
(28, 3, '', '', 'pperic', '2019-02-10', 'steam.jpg', '<p>asdadasdasdasd</p><p>asd</p><p>asd</p><p>asd</p><p>dsa</p><p>&nbsp;</p>', 'asd', 0, 'published', 62, 1),
(29, 1, 'New Post', '', 'ric', '2019-07-01', 'image_3.jpg', '<p>&nbsp;</p>', 'Bootstrap', 0, 'draft', 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `user_id` int(3) NOT NULL,
  `username` varchar(255) NOT NULL,
  `user_password` varchar(255) NOT NULL,
  `user_firstname` varchar(255) NOT NULL,
  `user_lastname` varchar(255) NOT NULL,
  `user_email` varchar(255) NOT NULL,
  `user_image` text NOT NULL,
  `user_role` varchar(255) NOT NULL,
  `randSalt` varchar(255) NOT NULL DEFAULT '$2y$10$Iusesomecrazystrings22',
  `token` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`user_id`, `username`, `user_password`, `user_firstname`, `user_lastname`, `user_email`, `user_image`, `user_role`, `randSalt`, `token`) VALUES
(1, 'ric', '$2y$12$4llNzi4TKKHg6RDrkQPcdu58J4HcuslZ/XR2CxFKBedub2K1g4kdK', 'Rico', 'Sanchez', 'rsanchez@gmail.com', '', 'admin', '', ''),
(3, 'pperic', '$2y$12$HGdj8ZULmOV5qHyMdqKlouQGt.VHCCdPWH7AJpi2XqHAvW3g5GJhy', 'Pera', 'Peric', 'pperic@gmail.com', '', 'admin', '', '08d62f336293269e2dba57265a3793ff4760ed08cb68ddee7e545203b33738184c7e275d2bc901226f18302d0bb60f27ea9c'),
(6, 'zzikic', '$2y$12$HGdj8ZULmOV5qHyMdqKlouQGt.VHCCdPWH7AJpi2XqHAvW3g5GJhy', 'Zika', 'Zikic', 'zzikic@gmail.com', '', 'subscriber', '', ''),
(7, 'llazic', '$2y$12$HGdj8ZULmOV5qHyMdqKlouQGt.VHCCdPWH7AJpi2XqHAvW3g5GJhy', 'Laza', 'Lazic', 'llazic@gmail.com', '', 'admin', '$2y$10$Iusesomecrazystrings22', ''),
(8, 'pera', '$2y$12$HGdj8ZULmOV5qHyMdqKlouQGt.VHCCdPWH7AJpi2XqHAvW3g5GJhy', '', '', 'peralazic@gmail.com', '', 'admin', '$2y$10$Iusesomecrazystrings22', ''),
(9, 'mmarkovic', '$2y$12$HGdj8ZULmOV5qHyMdqKlouQGt.VHCCdPWH7AJpi2XqHAvW3g5GJhy', '', '', 'markomarkovic@gmail.com', '', 'subscriber', '$2y$10$Iusesomecrazystrings22', ''),
(10, 'asd', '$2y$12$HGdj8ZULmOV5qHyMdqKlouQGt.VHCCdPWH7AJpi2XqHAvW3g5GJhy', '', '', 'asd@asd.asd', '', 'subscriber', '$2y$10$Iusesomecrazystrings22', ''),
(11, 'new_user', '$2y$12$HGdj8ZULmOV5qHyMdqKlouQGt.VHCCdPWH7AJpi2XqHAvW3g5GJhy', '', '', 'new@user.com', '', 'subscriber', '$2y$10$Iusesomecrazystrings22', ''),
(12, 'peteee', '$2y$12$Ldtao4XU1xTvYiMcVNVIV.Bd1rctBHTl1FgPDk8ITxaVZIxNyW7v.', 'Pete', 'William', 'pete@gmail.com', '', 'admin', '$2y$10$Iusesomecrazystrings22', ''),
(14, 'asdasdsd', '$2y$12$nzA.5uqo.qjqxkanEG.bKeqFpLr4wz2Olhh6SulXxhkybF0ZTwh56', '', '', 'asd@asd.com', '', 'subscriber', '$2y$10$Iusesomecrazystrings22', ''),
(15, '1234', '$2y$12$EmWd42peuZqMqAR9P9zoaOcCjO9qS9nKSTI7nAIcloaPOYcdrr3cq', '', '', 'marko.miseljic.14@gmail.com', '', 'subscriber', '$2y$10$Iusesomecrazystrings22', ''),
(16, 'jovan', '$2y$12$EF1GDyPZqiCcG82QUhix9eGzk4qfOgIZrstun0dI4YRHOx69F707e', '', '', 'jovan@jovan.com', '', 'subscriber', '$2y$10$Iusesomecrazystrings22', ''),
(17, 'zikici', '$2y$12$pnUYT0VhavN5MuxshuUFw.bn.b1K6QxfRr9HkWu4FJkM6utrqfr1m', '', '', 'zikici@gmail.com', '', 'subscriber', '$2y$10$Iusesomecrazystrings22', ''),
(18, 'perici', '$2y$12$U3kNRaCnzayuTBA//c7w3.0/8UZS4YuHnuuq8huPE.rMPTNruMHUq', '', '', 'perici@gmail.com', '', 'subscriber', '$2y$10$Iusesomecrazystrings22', ''),
(19, 'zzikici', '$2y$12$ks08frroycOWTB78BFK.ReFUBuX2WGlQDEOgfmXcUdayAQ.NFHHgq', '', '', 'zzikici@gmail.com', '', 'subscriber', '$2y$10$Iusesomecrazystrings22', ''),
(20, 'opaggg', '$2y$12$x4j6S45W1fnY6EjY5DqpyOPZynpnriFd5pihVu/4p6xQ6s7B65e32', '', '', 'opaggg@gmail.com', '', 'subscriber', '$2y$10$Iusesomecrazystrings22', ''),
(21, 'markovic', '$2y$12$7q8Iv5b7pAhp/JuHjldPveUWlbW/Q3ocd.VgiKIJytou4MZIPnIdq', '', '', 'mmarkovic@gmail.com', '', 'subscriber', '$2y$10$Iusesomecrazystrings22', '');

-- --------------------------------------------------------

--
-- Table structure for table `users_online`
--

CREATE TABLE `users_online` (
  `id` int(11) NOT NULL,
  `session` varchar(255) NOT NULL,
  `time` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `users_online`
--

INSERT INTO `users_online` (`id`, `session`, `time`) VALUES
(1, '60akr1od67g4njfqs45b1c7158', 1548961934),
(2, 'rfsvn5ic9hhs8hvl2tdc0ta0jt', 1548960866),
(3, 'ofr9172tisdiebn1ghghe38hl7', 1548961506),
(4, 'uol91q1qjt1s9rhsuus4s2i55o', 1548974537),
(5, 'i76pps6dn375uaj3hco59oq82k', 1548965186),
(6, '22c4q34i779f9hebb53g7cnddc', 1548965178),
(7, '8s5ec06ve94u977s2lung9878f', 1549194439),
(8, '1bneg0dt232t46ch9e4n41uvmf', 1549199131),
(9, '1e0cqhd6dj2hrec3t4rkprtfic', 1549231873),
(10, 'fcelmfnqpuenglkuo5isa724ud', 1549278245),
(11, 'ecr2n3q4q0umgmet63980kdfav', 1549289550),
(12, 'fl27ih34lllfnq4rufbbhj18ms', 1549303121),
(13, 'gjic19ikmf9jpdjtij7o0hjpd7', 1549314768),
(14, 'l8rsu5mibj4gena87ai85c1vq1', 1549451204),
(15, 'ojgt9ov7jf46gjgekplvil6hae', 1549493902),
(16, 'pcrjm1hat9blft91fnusprtc36', 1549624341),
(17, 'r439l0ped0p2fpneb1bt849pb4', 1549622026),
(18, 'j7k0ajp80caqqo85ropt206prs', 1549622116),
(19, 'ohic4fljlv0vr8n4rajjs19gd9', 1549622706),
(20, '6140atgv58gffvd7ntum87ferg', 1549624332),
(21, 'crtfhguohh5v414d0g9qlb3kif', 1549801766),
(22, 'a3mr9modo4bdtcfhkivma5i17m', 1549824334),
(23, '64gs0515kthef8gbkca0qua7uk', 1549823173),
(24, 'ukb8jr9hksiu9vt828a8aeqtmh', 1549980344),
(25, 'bjtopnu5t22mkjj2mnamhbh0p6', 1561984466);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`cat_id`);

--
-- Indexes for table `comments`
--
ALTER TABLE `comments`
  ADD PRIMARY KEY (`comment_id`);

--
-- Indexes for table `likes`
--
ALTER TABLE `likes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `posts`
--
ALTER TABLE `posts`
  ADD PRIMARY KEY (`post_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`user_id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- Indexes for table `users_online`
--
ALTER TABLE `users_online`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `cat_id` int(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `comments`
--
ALTER TABLE `comments`
  MODIFY `comment_id` int(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `likes`
--
ALTER TABLE `likes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `posts`
--
ALTER TABLE `posts`
  MODIFY `post_id` int(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `user_id` int(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `users_online`
--
ALTER TABLE `users_online`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
