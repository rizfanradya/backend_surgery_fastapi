-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: mysql
-- Generation Time: Dec 01, 2024 at 04:21 PM
-- Server version: 9.0.1
-- PHP Version: 8.2.26

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `hctm_surgery`
--

-- --------------------------------------------------------

--
-- Table structure for table `alembic_version`
--

CREATE TABLE `alembic_version` (
  `version_num` varchar(32) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `alembic_version`
--

INSERT INTO `alembic_version` (`version_num`) VALUES
('a002132ce4e9');

-- --------------------------------------------------------

--
-- Table structure for table `blocked_day`
--

CREATE TABLE `blocked_day` (
  `id` int NOT NULL,
  `day_id` int NOT NULL,
  `unit_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `blocked_ot`
--

CREATE TABLE `blocked_ot` (
  `id` int NOT NULL,
  `ot_id` int NOT NULL,
  `unit_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `clashing_groups`
--

CREATE TABLE `clashing_groups` (
  `id` int NOT NULL,
  `description` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `day`
--

CREATE TABLE `day` (
  `id` int NOT NULL,
  `name` varchar(255) NOT NULL,
  `week_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `day`
--

INSERT INTO `day` (`id`, `name`, `week_id`) VALUES
(1, 'Mon', 1),
(2, 'Tue', 1),
(3, 'Wed', 1),
(4, 'Thu', 1),
(5, 'Fri', 1);

-- --------------------------------------------------------

--
-- Table structure for table `equipment`
--

CREATE TABLE `equipment` (
  `id` int NOT NULL,
  `name` varchar(255) NOT NULL,
  `quantity` int NOT NULL,
  `sub_specialty_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `equipment`
--

INSERT INTO `equipment` (`id`, `name`, `quantity`, `sub_specialty_id`) VALUES
(1, 'Argon Plasma Coagulator', 0, 23),
(2, 'Arthroscopy monitor set', 0, 8),
(3, 'CONSTELLATION MACHINE', 1, 9),
(4, 'CRYO MESIN', 1, 9),
(5, 'Dermatom', 0, 8),
(6, 'Doopler', 0, 1),
(7, 'Drill', 0, 12),
(8, 'ECP MESIN', 1, 9),
(9, 'Elecrosurgical Unit', 0, 6),
(10, 'Endoscopy System', 0, 15),
(11, 'Flexible Reamer', 0, 6),
(12, 'High speed drill', 0, 8),
(13, 'II Machine', 0, 8),
(14, 'Lap Instrument Set', 0, 15),
(15, 'Laparoscopic System', 0, 15),
(16, 'Liver Retractor', 0, 23),
(17, 'MESIN LASER', 1, 9),
(18, 'Mesin RF', 0, 8),
(19, 'Microscope', 0, 6),
(20, 'Microscope (OPHTHALMOLOGY)', 0, 9),
(21, 'Monitor Mobile System', 0, 23),
(22, 'Nerve Monitoring', 0, 23),
(23, 'OR 1', 4, 23),
(24, 'PHACO HANDPIECE', 6, 9),
(25, 'PHACO MACHINE', 3, 9),
(26, 'RFA machine', 0, 1),
(27, 'SCD EXPRESS', 2, 23),
(28, 'Saw', 0, 8),
(29, 'Sholder Traction', 0, 8),
(30, 'TABLE OT', 18, 9),
(31, 'Telescope', 0, 23),
(32, 'Tourniquet', 0, 6),
(33, 'Traction table', 0, 6),
(34, 'Ultaround', 0, 3),
(35, 'Ultarsound', 0, 15),
(36, 'Ultrasonic Machine', 0, 15),
(37, 'Ultrasonic machine', 0, 2),
(38, 'Ultrasound', 0, 12),
(39, 'Utrasound machine', 0, 1);

-- --------------------------------------------------------

--
-- Table structure for table `equipment_msp`
--

CREATE TABLE `equipment_msp` (
  `id` int NOT NULL,
  `name` varchar(255) NOT NULL,
  `quantity` int NOT NULL,
  `status_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `equipment_msp`
--

INSERT INTO `equipment_msp` (`id`, `name`, `quantity`, `status_id`) VALUES
(1, 'Argon Plasma Coagulator', 1, 1),
(2, 'Arthroscopy Monitor Set', 3, 1),
(3, 'Constellation Machine', 1, 1),
(4, 'Cryo Mesin', 1, 1),
(5, 'Dermatom', 1, 1),
(6, 'Doppler', 1, 1),
(7, 'Drill', 3, 1),
(8, 'ECP Mesin', 1, 1),
(9, 'Electrosurgical Unit (ESU)', 16, 1),
(10, 'Flexible Reamer', 2, 1),
(11, 'High Speed Drill', 3, 1),
(12, 'II Machine', 4, 1),
(13, 'Lap Instrument Set', 5, 1),
(14, 'Laparoscopic System (Mobile)', 2, 1),
(15, 'Laser', 1, 1),
(16, 'Mesin RF', 1, 1),
(17, 'Microscope', 4, 1),
(18, 'Microscope (OPHTHALMOLOGY)', 2, 1),
(19, 'Nerve Monitoring', 1, 1),
(20, 'OR 1', 4, 1),
(21, 'Phaco Handpiece', 6, 1),
(22, 'Phaco Machine', 3, 1),
(23, 'SCD Express', 2, 1),
(24, 'Shoulder Traction', 2, 1),
(25, 'Table OT', 18, 1),
(26, 'Telescope', 4, 1),
(27, 'Torniquet', 4, 1),
(28, 'Traction Table', 1, 1),
(29, 'Ultrasonic Machine', 1, 1),
(30, 'Ultrasound', 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `equipment_requirement`
--

CREATE TABLE `equipment_requirement` (
  `id` int NOT NULL,
  `unit_id` int NOT NULL,
  `equipment_id` int NOT NULL,
  `equipment_requirement_status_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `equipment_requirement_status`
--

CREATE TABLE `equipment_requirement_status` (
  `id` int NOT NULL,
  `description` varchar(255) NOT NULL,
  `penalty_value` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `equipment_requirement_status`
--

INSERT INTO `equipment_requirement_status` (`id`, `description`, `penalty_value`) VALUES
(1, 'Used by All Surgeries', 3),
(2, 'Used by Most Surgeries', 2),
(3, 'Used by Some Surgeries', 1);

-- --------------------------------------------------------

--
-- Table structure for table `fixed_ot`
--

CREATE TABLE `fixed_ot` (
  `id` int NOT NULL,
  `ot_id` int NOT NULL,
  `unit_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `masterplan`
--

CREATE TABLE `masterplan` (
  `id` int NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `objective_value` decimal(10,2) NOT NULL,
  `created_at` datetime NOT NULL,
  `uploaded_file` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `objectives`
--

CREATE TABLE `objectives` (
  `id` int NOT NULL,
  `objectives` varchar(255) NOT NULL,
  `weight` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `objectives`
--

INSERT INTO `objectives` (`id`, `objectives`, `weight`) VALUES
(1, 'Preferred Slots Reward', 10.00),
(2, 'Shared Equipment Penalty', 20.00),
(3, 'Extra Equipment Quantity Reward', 30.00),
(4, 'Same OT Reward', 40.00),
(5, 'Consecutive Days Reward', 50.00),
(6, 'Same Weekly Slot Reward', 60.00),
(7, 'Clashing Subspecialties Penalty', 70.00),
(8, 'Exceed Parallel Slot Penalty', 80.00),
(9, 'Exceed Parallel Heavy Slot Penalty', 90.00),
(10, 'Reserve Ultra Clean OT Reward', 100.00);

-- --------------------------------------------------------

--
-- Table structure for table `ot`
--

CREATE TABLE `ot` (
  `id` int NOT NULL,
  `name` varchar(255) NOT NULL,
  `ot_type_id` int NOT NULL,
  `status_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `ot`
--

INSERT INTO `ot` (`id`, `name`, `ot_type_id`, `status_id`) VALUES
(1, '1', 1, 1),
(2, '2', 1, 1),
(3, '3', 1, 1),
(4, '4', 1, 1),
(5, '5', 1, 1),
(6, '9', 1, 1),
(7, '10', 1, 1),
(8, '11', 1, 1),
(9, '12', 3, 1),
(10, '13', 3, 1),
(11, '6', 2, 1),
(12, '7', 2, 1),
(13, '8', 2, 1);

-- --------------------------------------------------------

--
-- Table structure for table `ot_assignment`
--

CREATE TABLE `ot_assignment` (
  `id` int NOT NULL,
  `mssp_id` int NOT NULL,
  `week_id` int NOT NULL,
  `ot_id` int NOT NULL,
  `unit_id` int NOT NULL,
  `day_id` int NOT NULL,
  `is_require_anaes` tinyint(1) NOT NULL,
  `opening_time` time NOT NULL,
  `closing_time` time NOT NULL,
  `mrn` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ot_type`
--

CREATE TABLE `ot_type` (
  `id` int NOT NULL,
  `description` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `ot_type`
--

INSERT INTO `ot_type` (`id`, `description`) VALUES
(1, 'General'),
(2, 'UltraClean'),
(3, 'Fixed');

-- --------------------------------------------------------

--
-- Table structure for table `preferred_ot`
--

CREATE TABLE `preferred_ot` (
  `id` int NOT NULL,
  `ot_id` int NOT NULL,
  `unit_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `procedure_name`
--

CREATE TABLE `procedure_name` (
  `id` int NOT NULL,
  `name` varchar(255) NOT NULL,
  `sub_specialty_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `procedure_name`
--

INSERT INTO `procedure_name` (`id`, `name`, `sub_specialty_id`) VALUES
(1, 'PROCEDURE - ADVANCE TRAUMA', 1),
(2, 'PROCEDURE - ARTHOPLASTY', 2),
(3, 'PROCEDURE - BREAST', 3),
(4, 'PROCEDURE - BREAST & ENDOCRINE', 4),
(5, 'PROCEDURE - CARDIOTHORASIC', 5),
(6, 'PROCEDURE - COLORECTAL', 6),
(7, 'PROCEDURE - HANDS & MICROSURGERY', 7),
(8, 'PROCEDURE - HEPATOBILIARY', 8),
(9, 'PROCEDURE - MAXILOFACIAL', 9),
(10, 'PROCEDURE - NEUROSURGERY', 10),
(11, 'PROCEDURE - OPHTHALMOLOGY', 11),
(12, 'PROCEDURE - ORTHO-ONCOLOGY', 12),
(13, 'PROCEDURE - ORTHOPEDIC', 13),
(14, 'PROCEDURE - OTORHINOLARINGOLOGY', 14),
(15, 'PROCEDURE - PAEDIATRIC ORTHOPEDIC', 15),
(16, 'PROCEDURE - PAEDIATRIC SURGERY', 16),
(17, 'PROCEDURE - PLASTIC', 17),
(18, 'PROCEDURE - SPINAL', 18),
(19, 'PROCEDURE - SPORT', 19),
(20, 'PROCEDURE - SURGERY', 20),
(21, 'PROCEDURE - TRAUMA', 21),
(22, 'PROCEDURE - UKMSC', 22),
(23, 'PROCEDURE - UPPER GI MINIMALLY INVASIVE', 23),
(24, 'PROCEDURE - UROLOGY', 24),
(25, 'PROCEDURE - VASCULAR', 25);

-- --------------------------------------------------------

--
-- Table structure for table `role`
--

CREATE TABLE `role` (
  `id` int NOT NULL,
  `role` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `role`
--

INSERT INTO `role` (`id`, `role`) VALUES
(1, 'admin'),
(2, 'user');

-- --------------------------------------------------------

--
-- Table structure for table `schedule_results`
--

CREATE TABLE `schedule_results` (
  `id` int NOT NULL,
  `run_id` varchar(255) NOT NULL,
  `mrn` text NOT NULL,
  `age` int NOT NULL,
  `week_id` int NOT NULL,
  `week_day` varchar(255) NOT NULL,
  `surgery_date` date NOT NULL,
  `type_of_surgery` text NOT NULL,
  `sub_specialty_desc` text NOT NULL,
  `specialty_id` text NOT NULL,
  `procedure_name` text NOT NULL,
  `surgery_duration` int NOT NULL,
  `phu_id` int NOT NULL,
  `phu_start_time` time NOT NULL,
  `phu_end_time` time NOT NULL,
  `ot_id` int NOT NULL,
  `ot_start_time` time NOT NULL,
  `ot_end_time` time NOT NULL,
  `surgeon_name` text NOT NULL,
  `post_op_id` int NOT NULL,
  `post_op_start_time` time NOT NULL,
  `post_op_end_time` time NOT NULL,
  `pacu_id` int NOT NULL,
  `pacu_start_time` time NOT NULL,
  `pacu_end_time` time NOT NULL,
  `icu_id` int NOT NULL,
  `icu_start_time` time NOT NULL,
  `icu_end_time` time NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `specialty`
--

CREATE TABLE `specialty` (
  `id` int NOT NULL,
  `name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `specialty`
--

INSERT INTO `specialty` (`id`, `name`) VALUES
(1, 'JENT'),
(2, 'JMAX'),
(3, 'JOFT'),
(4, 'JORT'),
(5, 'JSUR'),
(6, 'UKMSC');

-- --------------------------------------------------------

--
-- Table structure for table `status`
--

CREATE TABLE `status` (
  `id` int NOT NULL,
  `description` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `status`
--

INSERT INTO `status` (`id`, `description`) VALUES
(1, 'Available'),
(2, 'Unavailable');

-- --------------------------------------------------------

--
-- Table structure for table `sub_specialties_clashing_groups`
--

CREATE TABLE `sub_specialties_clashing_groups` (
  `id` int NOT NULL,
  `clashing_group_id` int NOT NULL,
  `sub_specialty_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sub_specialties_ot_types`
--

CREATE TABLE `sub_specialties_ot_types` (
  `id` int NOT NULL,
  `sub_specialty_id` int NOT NULL,
  `ot_type_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `sub_specialties_ot_types`
--

INSERT INTO `sub_specialties_ot_types` (`id`, `sub_specialty_id`, `ot_type_id`) VALUES
(1, 1, 2),
(2, 2, 1),
(3, 3, 1),
(4, 4, 1),
(5, 5, 1),
(6, 6, 1),
(7, 7, 1),
(8, 8, 1),
(9, 9, 1),
(10, 10, 1),
(11, 11, 1),
(12, 11, 1),
(13, 12, 1),
(14, 13, 1),
(15, 14, 1),
(16, 14, 1),
(17, 15, 1),
(18, 16, 1),
(19, 16, 1),
(20, 17, 1),
(21, 17, 1),
(22, 18, 1),
(23, 19, 1),
(24, 20, 1),
(25, 21, 1),
(26, 22, 1),
(27, 23, 1),
(28, 24, 1),
(29, 24, 1),
(30, 25, 1);

-- --------------------------------------------------------

--
-- Table structure for table `sub_specialty`
--

CREATE TABLE `sub_specialty` (
  `id` int NOT NULL,
  `description` varchar(255) NOT NULL,
  `specialty_id` int NOT NULL,
  `color_hex` varchar(7) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `sub_specialty`
--

INSERT INTO `sub_specialty` (`id`, `description`, `specialty_id`, `color_hex`) VALUES
(1, 'ADVANCE TRAUMA', 4, '#FF0000'),
(2, 'ARTHOPLASTY', 4, '#0000FF'),
(3, 'BREAST', 5, '#FFC0CB'),
(4, 'BREAST & ENDOCRINE', 5, '#FFB6C1'),
(5, 'CARDIOTHORASIC', 5, '#8B0000'),
(6, 'COLORECTAL', 5, '#008000'),
(7, 'HANDS & MICROSURGERY', 4, '#90EE90'),
(8, 'HEPATOBILIARY', 5, '#FFFF00'),
(9, 'MAXILOFACIAL', 2, '#FFA500'),
(10, 'NEUROSURGERY', 5, '#800080'),
(11, 'OPHTHALMOLOGY', 3, '#ADD8E6'),
(12, 'ORTHO-ONCOLOGY', 4, '#00008B'),
(13, 'ORTHOPEDIC', 4, '#006400'),
(14, 'OTORHINOLARINGOLOGY', 1, '#A52A2A'),
(15, 'PAEDIATRIC ORTHOPEDIC', 4, '#FFFFE0'),
(16, 'PAEDIATRIC SURGERY', 5, '#D8BFD8'),
(17, 'PLASTIC', 5, '#00FFFF'),
(18, 'SPINAL', 4, '#E0FFFF'),
(19, 'SPORT', 4, '#FF00FF'),
(20, 'SURGERY', 5, '#D3D3D3'),
(21, 'TRAUMA', 4, '#A9A9A9'),
(22, 'UKMSC', 6, '#D2B48C'),
(23, 'UPPER GI MINIMALLY INVASIVE', 5, '#808000'),
(24, 'UROLOGY', 5, '#008080'),
(25, 'VASCULAR', 5, '#000080');

-- --------------------------------------------------------

--
-- Table structure for table `surgery`
--

CREATE TABLE `surgery` (
  `id` int NOT NULL,
  `mrn` varchar(255) NOT NULL,
  `unit_id` int NOT NULL,
  `booking_date` date NOT NULL,
  `estimated_duration` int NOT NULL,
  `procedure_name_id` int NOT NULL,
  `age` int NOT NULL,
  `gender_code` enum('P','L') NOT NULL,
  `surgeon` varchar(255) NOT NULL,
  `mssp_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `unit`
--

CREATE TABLE `unit` (
  `id` int NOT NULL,
  `name` varchar(255) NOT NULL,
  `is_require_anaes` tinyint(1) NOT NULL,
  `max_slot_limit` int NOT NULL,
  `no_of_slots` int NOT NULL,
  `resource_requirement_id` int NOT NULL,
  `color_hex` varchar(7) NOT NULL,
  `sub_specialty_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `unit`
--

INSERT INTO `unit` (`id`, `name`, `is_require_anaes`, `max_slot_limit`, `no_of_slots`, `resource_requirement_id`, `color_hex`, `sub_specialty_id`) VALUES
(1, 'ADVANCE TRAUMA', 1, 4, 4, 1, '#2F4F4F', 1),
(2, 'ARTHOPLASTY', 1, 2, 2, 1, '#00CED1', 2),
(3, 'BREAST', 1, 2, 0, 1, '#FFC0CB', 3),
(4, 'BREAST & ENDOCRINE', 1, 2, 0, 1, '#FF69B4', 4),
(5, 'CARDIOTHORASIC', 1, 2, 0, 1, '#DC143C', 5),
(6, 'COLORECTAL', 1, 2, 0, 1, '#FFD700', 6),
(7, 'HANDS & MICROSURGERY', 1, 2, 0, 1, '#8A2BE2', 7),
(8, 'HEPATOBILIARY', 1, 2, 0, 1, '#A52A2A', 8),
(9, 'MAXILOFACIAL', 1, 2, 0, 1, '#5F9EA0', 9),
(10, 'NEUROSURGERY', 1, 2, 0, 1, '#7FFF00', 10),
(11, 'OPHTHALMOLOGY (LA)', 0, 2, 0, 2, '#D2691E', 11),
(12, 'OPHTHALMOLOGY (GA)', 1, 2, 0, 1, '#FF7F50', 11),
(13, 'ORTHO-ONCOLOGY', 1, 2, 0, 1, '#6495ED', 12),
(14, 'ORTHOPEDIC', 1, 2, 0, 1, '#FFF8DC', 13),
(15, 'OTORHINOLARINGOLOGY', 1, 2, 0, 1, '#DC143C', 14),
(16, 'DC OTORHINOLARINGOLOGY (LA)', 0, 2, 0, 2, '#00FFFF', 14),
(17, 'PAEDIATRIC ORTHOPEDIC', 1, 2, 0, 1, '#00008B', 15),
(18, 'PAEDIATRIC SURGERY', 1, 2, 0, 1, '#008B8B', 16),
(19, 'DC PAEDIATRIC SURGERY (LA)', 0, 2, 0, 2, '#B8860B', 16),
(20, 'PLASTIC', 1, 1, 0, 1, '#A9A9A9', 17),
(21, 'DC PLASTIC (LA)', 0, 1, 0, 2, '#006400', 17),
(22, 'SPINAL', 1, 2, 0, 1, '#BDB76B', 18),
(23, 'SPORT', 1, 2, 0, 1, '#8B008B', 19),
(24, 'SURGERY', 1, 2, 0, 1, '#556B2F', 20),
(25, 'TRAUMA', 1, 2, 0, 1, '#FF8C00', 21),
(26, 'UKMSC', 1, 1, 0, 1, '#9932CC', 22),
(27, 'UPPER GI MINIMALLY INVASIVE', 1, 2, 0, 1, '#8B0000', 23),
(28, 'UROLOGY', 1, 2, 0, 1, '#E9967A', 24),
(29, 'DC UROLOGY (LA)', 0, 2, 0, 2, '#8FBC8F', 24),
(30, 'VASCULAR', 1, 1, 0, 1, '#483D8B', 25);

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id` int NOT NULL,
  `email` varchar(300) NOT NULL,
  `password` varchar(300) NOT NULL,
  `first_name` varchar(255) NOT NULL,
  `last_name` varchar(255) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `role_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `email`, `password`, `first_name`, `last_name`, `is_active`, `role_id`) VALUES
(1, 'admin@gmail.com', '$2b$12$jjQ0fdOrlcSJYu22N1fqku1EiNNtuGBV.jt1tlXbeRmaot4WyP026', 'admin', '01', 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `week`
--

CREATE TABLE `week` (
  `id` int NOT NULL,
  `name` varchar(255) NOT NULL,
  `status_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `week`
--

INSERT INTO `week` (`id`, `name`, `status_id`) VALUES
(1, 'Week 1', 1),
(2, 'Week 2', 2);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `alembic_version`
--
ALTER TABLE `alembic_version`
  ADD PRIMARY KEY (`version_num`);

--
-- Indexes for table `blocked_day`
--
ALTER TABLE `blocked_day`
  ADD PRIMARY KEY (`id`),
  ADD KEY `day_id` (`day_id`),
  ADD KEY `unit_id` (`unit_id`),
  ADD KEY `ix_blocked_day_id` (`id`);

--
-- Indexes for table `blocked_ot`
--
ALTER TABLE `blocked_ot`
  ADD PRIMARY KEY (`id`),
  ADD KEY `ot_id` (`ot_id`),
  ADD KEY `unit_id` (`unit_id`),
  ADD KEY `ix_blocked_ot_id` (`id`);

--
-- Indexes for table `clashing_groups`
--
ALTER TABLE `clashing_groups`
  ADD PRIMARY KEY (`id`),
  ADD KEY `ix_clashing_groups_id` (`id`);

--
-- Indexes for table `day`
--
ALTER TABLE `day`
  ADD PRIMARY KEY (`id`),
  ADD KEY `ix_day_id` (`id`),
  ADD KEY `week_id` (`week_id`);

--
-- Indexes for table `equipment`
--
ALTER TABLE `equipment`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sub_specialty_id` (`sub_specialty_id`),
  ADD KEY `ix_equipment_id` (`id`);

--
-- Indexes for table `equipment_msp`
--
ALTER TABLE `equipment_msp`
  ADD PRIMARY KEY (`id`),
  ADD KEY `status_id` (`status_id`),
  ADD KEY `ix_equipment_msp_id` (`id`);

--
-- Indexes for table `equipment_requirement`
--
ALTER TABLE `equipment_requirement`
  ADD PRIMARY KEY (`id`),
  ADD KEY `equipment_id` (`equipment_id`),
  ADD KEY `equipment_requirement_status_id` (`equipment_requirement_status_id`),
  ADD KEY `unit_id` (`unit_id`),
  ADD KEY `ix_equipment_requirement_id` (`id`);

--
-- Indexes for table `equipment_requirement_status`
--
ALTER TABLE `equipment_requirement_status`
  ADD PRIMARY KEY (`id`),
  ADD KEY `ix_equipment_requirement_status_id` (`id`);

--
-- Indexes for table `fixed_ot`
--
ALTER TABLE `fixed_ot`
  ADD PRIMARY KEY (`id`),
  ADD KEY `ot_id` (`ot_id`),
  ADD KEY `unit_id` (`unit_id`),
  ADD KEY `ix_fixed_ot_id` (`id`);

--
-- Indexes for table `masterplan`
--
ALTER TABLE `masterplan`
  ADD PRIMARY KEY (`id`),
  ADD KEY `ix_masterplan_id` (`id`);

--
-- Indexes for table `objectives`
--
ALTER TABLE `objectives`
  ADD PRIMARY KEY (`id`),
  ADD KEY `ix_objectives_id` (`id`);

--
-- Indexes for table `ot`
--
ALTER TABLE `ot`
  ADD PRIMARY KEY (`id`),
  ADD KEY `ix_ot_id` (`id`),
  ADD KEY `ot_type_id` (`ot_type_id`),
  ADD KEY `status_id` (`status_id`);

--
-- Indexes for table `ot_assignment`
--
ALTER TABLE `ot_assignment`
  ADD PRIMARY KEY (`id`),
  ADD KEY `ix_ot_assignment_id` (`id`),
  ADD KEY `week_id` (`week_id`),
  ADD KEY `mssp_id` (`mssp_id`),
  ADD KEY `day_id` (`day_id`),
  ADD KEY `unit_id` (`unit_id`),
  ADD KEY `ot_id` (`ot_id`);

--
-- Indexes for table `ot_type`
--
ALTER TABLE `ot_type`
  ADD PRIMARY KEY (`id`),
  ADD KEY `ix_ot_type_id` (`id`);

--
-- Indexes for table `preferred_ot`
--
ALTER TABLE `preferred_ot`
  ADD PRIMARY KEY (`id`),
  ADD KEY `ot_id` (`ot_id`),
  ADD KEY `unit_id` (`unit_id`),
  ADD KEY `ix_preferred_ot_id` (`id`);

--
-- Indexes for table `procedure_name`
--
ALTER TABLE `procedure_name`
  ADD PRIMARY KEY (`id`),
  ADD KEY `ix_procedure_name_id` (`id`),
  ADD KEY `sub_specialty_id` (`sub_specialty_id`);

--
-- Indexes for table `role`
--
ALTER TABLE `role`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `role` (`role`),
  ADD KEY `ix_role_id` (`id`);

--
-- Indexes for table `schedule_results`
--
ALTER TABLE `schedule_results`
  ADD PRIMARY KEY (`id`),
  ADD KEY `ix_schedule_results_id` (`id`);

--
-- Indexes for table `specialty`
--
ALTER TABLE `specialty`
  ADD PRIMARY KEY (`id`),
  ADD KEY `ix_specialty_id` (`id`);

--
-- Indexes for table `status`
--
ALTER TABLE `status`
  ADD PRIMARY KEY (`id`),
  ADD KEY `ix_status_id` (`id`);

--
-- Indexes for table `sub_specialties_clashing_groups`
--
ALTER TABLE `sub_specialties_clashing_groups`
  ADD PRIMARY KEY (`id`),
  ADD KEY `clashing_group_id` (`clashing_group_id`),
  ADD KEY `sub_specialty_id` (`sub_specialty_id`),
  ADD KEY `ix_sub_specialties_clashing_groups_id` (`id`);

--
-- Indexes for table `sub_specialties_ot_types`
--
ALTER TABLE `sub_specialties_ot_types`
  ADD PRIMARY KEY (`id`),
  ADD KEY `ot_type_id` (`ot_type_id`),
  ADD KEY `sub_specialty_id` (`sub_specialty_id`),
  ADD KEY `ix_sub_specialties_ot_types_id` (`id`);

--
-- Indexes for table `sub_specialty`
--
ALTER TABLE `sub_specialty`
  ADD PRIMARY KEY (`id`),
  ADD KEY `ix_sub_specialty_id` (`id`),
  ADD KEY `specialty_id` (`specialty_id`);

--
-- Indexes for table `surgery`
--
ALTER TABLE `surgery`
  ADD PRIMARY KEY (`id`),
  ADD KEY `procedure_name_id` (`procedure_name_id`),
  ADD KEY `unit_id` (`unit_id`),
  ADD KEY `ix_surgery_id` (`id`),
  ADD KEY `mssp_id` (`mssp_id`);

--
-- Indexes for table `unit`
--
ALTER TABLE `unit`
  ADD PRIMARY KEY (`id`),
  ADD KEY `ix_unit_id` (`id`),
  ADD KEY `sub_specialty_id` (`sub_specialty_id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`),
  ADD KEY `role_id` (`role_id`),
  ADD KEY `ix_user_id` (`id`);

--
-- Indexes for table `week`
--
ALTER TABLE `week`
  ADD PRIMARY KEY (`id`),
  ADD KEY `ix_week_id` (`id`),
  ADD KEY `status_id` (`status_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `blocked_day`
--
ALTER TABLE `blocked_day`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `blocked_ot`
--
ALTER TABLE `blocked_ot`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `clashing_groups`
--
ALTER TABLE `clashing_groups`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `day`
--
ALTER TABLE `day`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `equipment`
--
ALTER TABLE `equipment`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=40;

--
-- AUTO_INCREMENT for table `equipment_msp`
--
ALTER TABLE `equipment_msp`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;

--
-- AUTO_INCREMENT for table `equipment_requirement`
--
ALTER TABLE `equipment_requirement`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `equipment_requirement_status`
--
ALTER TABLE `equipment_requirement_status`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `fixed_ot`
--
ALTER TABLE `fixed_ot`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `masterplan`
--
ALTER TABLE `masterplan`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `objectives`
--
ALTER TABLE `objectives`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `ot`
--
ALTER TABLE `ot`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `ot_assignment`
--
ALTER TABLE `ot_assignment`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ot_type`
--
ALTER TABLE `ot_type`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `preferred_ot`
--
ALTER TABLE `preferred_ot`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `procedure_name`
--
ALTER TABLE `procedure_name`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT for table `role`
--
ALTER TABLE `role`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `schedule_results`
--
ALTER TABLE `schedule_results`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `specialty`
--
ALTER TABLE `specialty`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `status`
--
ALTER TABLE `status`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `sub_specialties_clashing_groups`
--
ALTER TABLE `sub_specialties_clashing_groups`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sub_specialties_ot_types`
--
ALTER TABLE `sub_specialties_ot_types`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT for table `sub_specialty`
--
ALTER TABLE `sub_specialty`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34;

--
-- AUTO_INCREMENT for table `surgery`
--
ALTER TABLE `surgery`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `unit`
--
ALTER TABLE `unit`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `week`
--
ALTER TABLE `week`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `blocked_day`
--
ALTER TABLE `blocked_day`
  ADD CONSTRAINT `blocked_day_ibfk_1` FOREIGN KEY (`day_id`) REFERENCES `day` (`id`),
  ADD CONSTRAINT `blocked_day_ibfk_2` FOREIGN KEY (`unit_id`) REFERENCES `unit` (`id`);

--
-- Constraints for table `blocked_ot`
--
ALTER TABLE `blocked_ot`
  ADD CONSTRAINT `blocked_ot_ibfk_1` FOREIGN KEY (`unit_id`) REFERENCES `unit` (`id`),
  ADD CONSTRAINT `blocked_ot_ibfk_2` FOREIGN KEY (`ot_id`) REFERENCES `ot` (`id`);

--
-- Constraints for table `day`
--
ALTER TABLE `day`
  ADD CONSTRAINT `day_ibfk_1` FOREIGN KEY (`week_id`) REFERENCES `week` (`id`);

--
-- Constraints for table `equipment`
--
ALTER TABLE `equipment`
  ADD CONSTRAINT `equipment_ibfk_1` FOREIGN KEY (`sub_specialty_id`) REFERENCES `sub_specialty` (`id`);

--
-- Constraints for table `equipment_msp`
--
ALTER TABLE `equipment_msp`
  ADD CONSTRAINT `equipment_msp_ibfk_1` FOREIGN KEY (`status_id`) REFERENCES `status` (`id`);

--
-- Constraints for table `equipment_requirement`
--
ALTER TABLE `equipment_requirement`
  ADD CONSTRAINT `equipment_requirement_ibfk_1` FOREIGN KEY (`unit_id`) REFERENCES `unit` (`id`),
  ADD CONSTRAINT `equipment_requirement_ibfk_2` FOREIGN KEY (`equipment_requirement_status_id`) REFERENCES `equipment_requirement_status` (`id`),
  ADD CONSTRAINT `equipment_requirement_ibfk_3` FOREIGN KEY (`equipment_id`) REFERENCES `equipment` (`id`);

--
-- Constraints for table `fixed_ot`
--
ALTER TABLE `fixed_ot`
  ADD CONSTRAINT `fixed_ot_ibfk_1` FOREIGN KEY (`unit_id`) REFERENCES `unit` (`id`),
  ADD CONSTRAINT `fixed_ot_ibfk_2` FOREIGN KEY (`ot_id`) REFERENCES `ot` (`id`);

--
-- Constraints for table `ot`
--
ALTER TABLE `ot`
  ADD CONSTRAINT `ot_ibfk_1` FOREIGN KEY (`ot_type_id`) REFERENCES `ot_type` (`id`),
  ADD CONSTRAINT `ot_ibfk_2` FOREIGN KEY (`status_id`) REFERENCES `status` (`id`);

--
-- Constraints for table `ot_assignment`
--
ALTER TABLE `ot_assignment`
  ADD CONSTRAINT `ot_assignment_ibfk_1` FOREIGN KEY (`day_id`) REFERENCES `day` (`id`),
  ADD CONSTRAINT `ot_assignment_ibfk_2` FOREIGN KEY (`mssp_id`) REFERENCES `masterplan` (`id`),
  ADD CONSTRAINT `ot_assignment_ibfk_3` FOREIGN KEY (`week_id`) REFERENCES `week` (`id`),
  ADD CONSTRAINT `ot_assignment_ibfk_4` FOREIGN KEY (`unit_id`) REFERENCES `unit` (`id`),
  ADD CONSTRAINT `ot_assignment_ibfk_5` FOREIGN KEY (`ot_id`) REFERENCES `ot` (`id`);

--
-- Constraints for table `preferred_ot`
--
ALTER TABLE `preferred_ot`
  ADD CONSTRAINT `preferred_ot_ibfk_1` FOREIGN KEY (`ot_id`) REFERENCES `ot` (`id`),
  ADD CONSTRAINT `preferred_ot_ibfk_2` FOREIGN KEY (`unit_id`) REFERENCES `unit` (`id`);

--
-- Constraints for table `procedure_name`
--
ALTER TABLE `procedure_name`
  ADD CONSTRAINT `procedure_name_ibfk_1` FOREIGN KEY (`sub_specialty_id`) REFERENCES `sub_specialty` (`id`);

--
-- Constraints for table `sub_specialties_clashing_groups`
--
ALTER TABLE `sub_specialties_clashing_groups`
  ADD CONSTRAINT `sub_specialties_clashing_groups_ibfk_1` FOREIGN KEY (`clashing_group_id`) REFERENCES `clashing_groups` (`id`),
  ADD CONSTRAINT `sub_specialties_clashing_groups_ibfk_2` FOREIGN KEY (`sub_specialty_id`) REFERENCES `sub_specialty` (`id`);

--
-- Constraints for table `sub_specialties_ot_types`
--
ALTER TABLE `sub_specialties_ot_types`
  ADD CONSTRAINT `sub_specialties_ot_types_ibfk_1` FOREIGN KEY (`ot_type_id`) REFERENCES `ot_type` (`id`),
  ADD CONSTRAINT `sub_specialties_ot_types_ibfk_2` FOREIGN KEY (`sub_specialty_id`) REFERENCES `sub_specialty` (`id`);

--
-- Constraints for table `sub_specialty`
--
ALTER TABLE `sub_specialty`
  ADD CONSTRAINT `sub_specialty_ibfk_1` FOREIGN KEY (`specialty_id`) REFERENCES `specialty` (`id`);

--
-- Constraints for table `surgery`
--
ALTER TABLE `surgery`
  ADD CONSTRAINT `surgery_ibfk_1` FOREIGN KEY (`unit_id`) REFERENCES `unit` (`id`),
  ADD CONSTRAINT `surgery_ibfk_2` FOREIGN KEY (`procedure_name_id`) REFERENCES `procedure_name` (`id`),
  ADD CONSTRAINT `surgery_ibfk_3` FOREIGN KEY (`mssp_id`) REFERENCES `masterplan` (`id`);

--
-- Constraints for table `unit`
--
ALTER TABLE `unit`
  ADD CONSTRAINT `unit_ibfk_1` FOREIGN KEY (`sub_specialty_id`) REFERENCES `sub_specialty` (`id`);

--
-- Constraints for table `user`
--
ALTER TABLE `user`
  ADD CONSTRAINT `user_ibfk_1` FOREIGN KEY (`role_id`) REFERENCES `role` (`id`);

--
-- Constraints for table `week`
--
ALTER TABLE `week`
  ADD CONSTRAINT `week_ibfk_1` FOREIGN KEY (`status_id`) REFERENCES `status` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
