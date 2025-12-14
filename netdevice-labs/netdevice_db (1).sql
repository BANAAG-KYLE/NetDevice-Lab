-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 10, 2025 at 11:01 AM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `netdevice_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `active_sessions`
--

CREATE TABLE `active_sessions` (
  `session_id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `login_time` timestamp NOT NULL DEFAULT current_timestamp(),
  `last_activity` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `network_devices_lib`
--

CREATE TABLE `network_devices_lib` (
  `device_id` int(11) NOT NULL,
  `device_name` varchar(100) NOT NULL,
  `description` text DEFAULT NULL,
  `image_url` varchar(255) DEFAULT NULL,
  `use_cases` text DEFAULT NULL,
  `specifications` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `network_topologies`
--

CREATE TABLE `network_topologies` (
  `topology_id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `topology_name` varchar(100) DEFAULT NULL,
  `device_data` longtext DEFAULT NULL,
  `connection_data` longtext DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `network_topologies`
--

INSERT INTO `network_topologies` (`topology_id`, `user_id`, `topology_name`, `device_data`, `connection_data`, `created_at`) VALUES
(1, 2, 'first try', '[{\"id\":1764055002801.0444,\"type\":\"pc\",\"x\":225,\"y\":173.8000030517578,\"width\":70,\"height\":70,\"name\":\"PC_1\",\"ip\":\"\",\"color\":\"#3498db\",\"icon\":\"\\ud83d\\udcbb\"},{\"id\":1764055005227.2485,\"type\":\"router\",\"x\":461,\"y\":177.8000030517578,\"width\":70,\"height\":70,\"name\":\"ROUTER_2\",\"ip\":\"\",\"color\":\"#e74c3c\",\"icon\":\"\\ud83d\\udd00\"},{\"id\":1764055007083.6177,\"type\":\"server\",\"x\":696,\"y\":181.8000030517578,\"width\":70,\"height\":70,\"name\":\"SERVER_3\",\"ip\":\"\",\"color\":\"#2ecc71\",\"icon\":\"\\ud83d\\udda5\\ufe0f\"}]', '[{\"id\":1764055010661.1328,\"from\":1764055002801.0444,\"to\":1764055005227.2485,\"label\":\"Cable_1\"},{\"id\":1764055012655.079,\"from\":1764055007083.6177,\"to\":1764055005227.2485,\"label\":\"Cable_2\"}]', '2025-11-25 07:17:04'),
(2, 2, 'yes', '[{\"id\":1764055160272.6165,\"type\":\"pc\",\"x\":143,\"y\":130.8000030517578,\"width\":70,\"height\":70,\"name\":\"PC_1\",\"ip\":\"192.168.10.2\",\"color\":\"#3498db\",\"icon\":\"\\ud83d\\udcbb\"},{\"id\":1764055163176.487,\"type\":\"router\",\"x\":423,\"y\":136.8000030517578,\"width\":70,\"height\":70,\"name\":\"ROUTER_2\",\"ip\":\"\",\"color\":\"#e74c3c\",\"icon\":\"\\ud83d\\udd00\"},{\"id\":1764055164854.4036,\"type\":\"server\",\"x\":730,\"y\":130.8000030517578,\"width\":70,\"height\":70,\"name\":\"SERVER_3\",\"ip\":\"\",\"color\":\"#2ecc71\",\"icon\":\"\\ud83d\\udda5\\ufe0f\"}]', '[{\"id\":1764055167322.5762,\"from\":1764055160272.6165,\"to\":1764055163176.487,\"label\":\"Cable_1\"},{\"id\":1764055168671.386,\"from\":1764055163176.487,\"to\":1764055164854.4036,\"label\":\"Cable_2\"}]', '2025-11-25 07:20:18'),
(3, 4, 'cvbnm,', '[{\"id\":1764057328417.9487,\"type\":\"pc\",\"x\":220,\"y\":198,\"width\":70,\"height\":70,\"name\":\"PC_1\",\"ip\":\"\",\"color\":\"#3498db\",\"icon\":\"\\ud83d\\udcbb\"},{\"id\":1764057333180.2788,\"type\":\"pc\",\"x\":214,\"y\":353,\"width\":70,\"height\":70,\"name\":\"PC_2\",\"ip\":\"\",\"color\":\"#3498db\",\"icon\":\"\\ud83d\\udcbb\"},{\"id\":1764057334098.3904,\"type\":\"pc\",\"x\":208,\"y\":47,\"width\":70,\"height\":70,\"name\":\"PC_3\",\"ip\":\"192.168.10.2\",\"color\":\"#3498db\",\"icon\":\"\\ud83d\\udcbb\"},{\"id\":1764057336798.1704,\"type\":\"router\",\"x\":495,\"y\":192,\"width\":70,\"height\":70,\"name\":\"ROUTER_4\",\"ip\":\"\",\"color\":\"#e74c3c\",\"icon\":\"\\ud83d\\udd00\"},{\"id\":1764057339929.3787,\"type\":\"server\",\"x\":753,\"y\":180,\"width\":70,\"height\":70,\"name\":\"SERVER_5\",\"ip\":\"\",\"color\":\"#2ecc71\",\"icon\":\"\\ud83d\\udda5\\ufe0f\"}]', '[{\"id\":1764057371345.744,\"from\":1764057334098.3904,\"to\":1764057336798.1704,\"label\":\"Cable_1\"},{\"id\":1764057373596.8325,\"from\":1764057328417.9487,\"to\":1764057336798.1704,\"label\":\"Cable_2\"},{\"id\":1764057375001.2654,\"from\":1764057333180.2788,\"to\":1764057336798.1704,\"label\":\"Cable_3\"},{\"id\":1764057376764.7332,\"from\":1764057339929.3787,\"to\":1764057336798.1704,\"label\":\"Cable_4\"}]', '2025-11-25 07:56:50'),
(4, 4, 'zxcfgbhjkl', '[{\"id\":1764057519701.6294,\"type\":\"pc\",\"x\":188,\"y\":214.8000030517578,\"width\":70,\"height\":70,\"name\":\"PC_1\",\"ip\":\"\",\"color\":\"#3498db\",\"icon\":\"\\ud83d\\udcbb\"},{\"id\":1764057523482.8884,\"type\":\"pc\",\"x\":314,\"y\":381.8000030517578,\"width\":70,\"height\":70,\"name\":\"PC_2\",\"ip\":\"\",\"color\":\"#3498db\",\"icon\":\"\\ud83d\\udcbb\"},{\"id\":1764057524413.9622,\"type\":\"pc\",\"x\":225,\"y\":27.800003051757812,\"width\":70,\"height\":70,\"name\":\"PC_3\",\"ip\":\"192.168.10.2\",\"color\":\"#3498db\",\"icon\":\"\\ud83d\\udcbb\"},{\"id\":1764057526804.436,\"type\":\"router\",\"x\":565,\"y\":206.8000030517578,\"width\":70,\"height\":70,\"name\":\"ROUTER_4\",\"ip\":\"\",\"color\":\"#e74c3c\",\"icon\":\"\\ud83d\\udd00\"},{\"id\":1764057528770.7437,\"type\":\"server\",\"x\":870,\"y\":205.8000030517578,\"width\":70,\"height\":70,\"name\":\"SERVER_5\",\"ip\":\"\",\"color\":\"#2ecc71\",\"icon\":\"\\ud83d\\udda5\\ufe0f\"}]', '[{\"id\":1764057538722.388,\"from\":1764057524413.9622,\"to\":1764057526804.436,\"label\":\"Cable_1\"},{\"id\":1764057540289.8657,\"from\":1764057519701.6294,\"to\":1764057526804.436,\"label\":\"Cable_2\"},{\"id\":1764057541664.8535,\"from\":1764057523482.8884,\"to\":1764057526804.436,\"label\":\"Cable_3\"},{\"id\":1764057542947.4653,\"from\":1764057526804.436,\"to\":1764057528770.7437,\"label\":\"Cable_4\"}]', '2025-11-25 08:00:32'),
(6, 5, 'zxdfghjkl', '[{\"id\":1764080855682.6204,\"type\":\"pc\",\"x\":188,\"y\":253,\"width\":70,\"height\":70,\"name\":\"PC_1\",\"ip\":\"\",\"color\":\"#3498db\",\"icon\":\"\\ud83d\\udcbb\"},{\"id\":1764080860503.2449,\"type\":\"pc\",\"x\":223,\"y\":75,\"width\":70,\"height\":70,\"name\":\"PC_2\",\"ip\":\"192.168.10.2\",\"color\":\"#3498db\",\"icon\":\"\\ud83d\\udcbb\"},{\"id\":1764080861627.7102,\"type\":\"pc\",\"x\":240,\"y\":405,\"width\":70,\"height\":70,\"name\":\"PC_3\",\"ip\":\"\",\"color\":\"#3498db\",\"icon\":\"\\ud83d\\udcbb\"},{\"id\":1764080864004.0168,\"type\":\"router\",\"x\":489,\"y\":241,\"width\":70,\"height\":70,\"name\":\"ROUTER_4\",\"ip\":\"\",\"color\":\"#e74c3c\",\"icon\":\"\\ud83d\\udd00\"},{\"id\":1764080866353.5334,\"type\":\"server\",\"x\":796,\"y\":249,\"width\":70,\"height\":70,\"name\":\"SERVER_5\",\"ip\":\"\",\"color\":\"#2ecc71\",\"icon\":\"\\ud83d\\udda5\\ufe0f\"}]', '[{\"id\":1764080869607.841,\"from\":1764080860503.2449,\"to\":1764080864004.0168,\"label\":\"Cable_1\"},{\"id\":1764080871658.478,\"from\":1764080855682.6204,\"to\":1764080864004.0168,\"label\":\"Cable_2\"},{\"id\":1764080873302.3413,\"from\":1764080861627.7102,\"to\":1764080864004.0168,\"label\":\"Cable_3\"},{\"id\":1764080875275.4937,\"from\":1764080866353.5334,\"to\":1764080864004.0168,\"label\":\"Cable_4\"}]', '2025-11-25 14:28:25'),
(7, 7, 'try', '[{\"id\":1764986897723.718,\"type\":\"pc\",\"x\":176,\"y\":85.80000305175781,\"width\":70,\"height\":70,\"name\":\"PC_1\",\"ip\":\"\",\"color\":\"#3498db\",\"icon\":\"\\ud83d\\udcbb\"},{\"id\":1764986898470.724,\"type\":\"pc\",\"x\":161,\"y\":245,\"width\":70,\"height\":70,\"name\":\"PC_2\",\"ip\":\"\",\"color\":\"#3498db\",\"icon\":\"\\ud83d\\udcbb\"},{\"id\":1764986899313.7717,\"type\":\"pc\",\"x\":164,\"y\":405,\"width\":70,\"height\":70,\"name\":\"PC_3\",\"ip\":\"\",\"color\":\"#3498db\",\"icon\":\"\\ud83d\\udcbb\"},{\"id\":1764986900926.939,\"type\":\"router\",\"x\":416,\"y\":249,\"width\":70,\"height\":70,\"name\":\"ROUTER_4\",\"ip\":\"\",\"color\":\"#e74c3c\",\"icon\":\"\\ud83d\\udd00\"},{\"id\":1764986903202.1516,\"type\":\"server\",\"x\":653,\"y\":249,\"width\":70,\"height\":70,\"name\":\"SERVER_5\",\"ip\":\"\",\"color\":\"#2ecc71\",\"icon\":\"\\ud83d\\udda5\\ufe0f\"}]', '[{\"id\":1764986905815.9841,\"from\":1764986897723.718,\"to\":1764986900926.939,\"label\":\"Cable_1\"},{\"id\":1764986908416.6821,\"from\":1764986898470.724,\"to\":1764986900926.939,\"label\":\"Cable_2\"},{\"id\":1764986909926.802,\"from\":1764986899313.7717,\"to\":1764986900926.939,\"label\":\"Cable_3\"},{\"id\":1764986911506.1057,\"from\":1764986903202.1516,\"to\":1764986900926.939,\"label\":\"Cable_4\"}]', '2025-12-06 02:09:13'),
(8, 7, 'Try01', '[{\"id\":1764993419500.3213,\"type\":\"pc\",\"x\":184,\"y\":76,\"width\":70,\"height\":70,\"name\":\"PC_1\",\"ip\":\"192.168.10.2\",\"color\":\"#3498db\",\"icon\":\"\\ud83d\\udcbb\"},{\"id\":1764993420402.5142,\"type\":\"pc\",\"x\":180,\"y\":227,\"width\":70,\"height\":70,\"name\":\"PC_2\",\"ip\":\"\",\"color\":\"#3498db\",\"icon\":\"\\ud83d\\udcbb\"},{\"id\":1764993421109.6628,\"type\":\"pc\",\"x\":180,\"y\":378,\"width\":70,\"height\":70,\"name\":\"PC_3\",\"ip\":\"\",\"color\":\"#3498db\",\"icon\":\"\\ud83d\\udcbb\"},{\"id\":1764993423010.7021,\"type\":\"router\",\"x\":480,\"y\":232,\"width\":70,\"height\":70,\"name\":\"ROUTER_4\",\"ip\":\"\",\"color\":\"#e74c3c\",\"icon\":\"\\ud83d\\udd00\"},{\"id\":1764993424523.2397,\"type\":\"server\",\"x\":750,\"y\":225,\"width\":70,\"height\":70,\"name\":\"SERVER_5\",\"ip\":\"\",\"color\":\"#2ecc71\",\"icon\":\"\\ud83d\\udda5\\ufe0f\"}]', '[{\"id\":1764993427482.4072,\"from\":1764993419500.3213,\"to\":1764993423010.7021,\"label\":\"Cable_1\"},{\"id\":1764993429342.792,\"from\":1764993420402.5142,\"to\":1764993423010.7021,\"label\":\"Cable_2\"},{\"id\":1764993431071.8591,\"from\":1764993421109.6628,\"to\":1764993423010.7021,\"label\":\"Cable_3\"},{\"id\":1764993433240.9575,\"from\":1764993424523.2397,\"to\":1764993423010.7021,\"label\":\"Cable_4\"}]', '2025-12-06 03:57:43');

-- --------------------------------------------------------

--
-- Table structure for table `quiz_questions`
--

CREATE TABLE `quiz_questions` (
  `question_id` int(11) NOT NULL,
  `category` varchar(50) NOT NULL,
  `difficulty` varchar(20) NOT NULL,
  `question_text` text NOT NULL,
  `option_a` varchar(255) NOT NULL,
  `option_b` varchar(255) NOT NULL,
  `option_c` varchar(255) NOT NULL,
  `option_d` varchar(255) NOT NULL,
  `correct_answer` int(11) NOT NULL,
  `explanation` text NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `quiz_questions`
--

INSERT INTO `quiz_questions` (`question_id`, `category`, `difficulty`, `question_text`, `option_a`, `option_b`, `option_c`, `option_d`, `correct_answer`, `explanation`, `created_at`) VALUES
(1, 'osi', 'easy', 'How many layers does the OSI model have?', '5 layers', '6 layers', '7 layers', '8 layers', 2, 'The OSI model has 7 layers: Physical, Data Link, Network, Transport, Session, Presentation, and Application.', '2025-11-30 09:11:56'),
(2, 'osi', 'easy', 'Which layer is responsible for logical addressing using IP addresses?', 'Physical Layer', 'Data Link Layer', 'Network Layer', 'Transport Layer', 2, 'The Network Layer (Layer 3) handles logical addressing using IP addresses and routing between networks.', '2025-11-30 09:11:56'),
(3, 'osi', 'easy', 'What is the topmost layer of the OSI model?', 'Physical Layer', 'Application Layer', 'Presentation Layer', 'Session Layer', 1, 'The Application Layer (Layer 7) is the topmost layer and closest to the end user.', '2025-11-30 09:11:56'),
(4, 'devices', 'easy', 'Which device operates at Layer 3 of the OSI model?', 'Hub', 'Switch', 'Router', 'Repeater', 2, 'Routers operate at Layer 3 (Network Layer) and use IP addresses to route traffic between networks.', '2025-11-30 09:11:56'),
(5, 'devices', 'easy', 'What does a switch use to forward data to the correct device?', 'IP Address', 'MAC Address', 'Port Number', 'Domain Name', 1, 'Switches operate at Layer 2 and use MAC addresses to forward frames to the correct device on a local network.', '2025-11-30 09:11:56'),
(6, 'protocols', 'easy', 'What protocol is used to translate domain names to IP addresses?', 'DHCP', 'DNS', 'FTP', 'HTTP', 1, 'DNS (Domain Name System) translates human-readable domain names like google.com into IP addresses.', '2025-11-30 09:11:56'),
(7, 'protocols', 'easy', 'Which protocol automatically assigns IP addresses to devices?', 'DNS', 'FTP', 'DHCP', 'SMTP', 2, 'DHCP (Dynamic Host Configuration Protocol) automatically assigns IP addresses to devices on a network.', '2025-11-30 09:11:56'),
(8, 'protocols', 'easy', 'What does TCP stand for?', 'Transfer Control Protocol', 'Transmission Control Protocol', 'Transport Connection Protocol', 'Technical Control Protocol', 1, 'TCP stands for Transmission Control Protocol and provides reliable, ordered data delivery.', '2025-11-30 09:11:56'),
(9, 'ip', 'easy', 'What is the default subnet mask for a Class C network?', '255.0.0.0', '255.255.0.0', '255.255.255.0', '255.255.255.255', 2, 'Class C networks use a default subnet mask of 255.255.255.0, providing 254 usable host addresses.', '2025-11-30 09:11:56'),
(10, 'troubleshooting', 'easy', 'Which command is used to test connectivity to another device?', 'ipconfig', 'ping', 'tracert', 'netstat', 1, 'The ping command sends ICMP echo requests to test if a device is reachable and measures response time.', '2025-11-30 09:11:56'),
(11, 'osi', 'medium', 'Which layer is responsible for establishing, managing, and terminating connections?', 'Transport Layer', 'Session Layer', 'Presentation Layer', 'Network Layer', 1, 'The Session Layer (Layer 5) manages connections between applications, including establishing and terminating sessions.', '2025-11-30 09:11:56'),
(12, 'osi', 'medium', 'At which layer does data encryption typically occur?', 'Application Layer', 'Presentation Layer', 'Session Layer', 'Transport Layer', 1, 'The Presentation Layer (Layer 6) handles data encryption/decryption, compression, and format conversion.', '2025-11-30 09:11:56'),
(13, 'devices', 'medium', 'What is the main difference between a hub and a switch?', 'Hubs are faster', 'Switches forward data only to the intended recipient', 'Hubs use IP addresses', 'There is no difference', 1, 'Switches intelligently forward frames only to the intended recipient using MAC addresses, while hubs broadcast to all ports.', '2025-11-30 09:11:56'),
(14, 'devices', 'medium', 'Which device can connect networks with different IP address ranges?', 'Hub', 'Switch', 'Router', 'Bridge', 2, 'Routers operate at Layer 3 and can connect networks with different IP address ranges, performing routing between them.', '2025-11-30 09:11:56'),
(15, 'protocols', 'medium', 'What is the purpose of the TCP three-way handshake?', 'To encrypt data', 'To establish a reliable connection', 'To assign IP addresses', 'To resolve domain names', 1, 'The TCP three-way handshake (SYN, SYN-ACK, ACK) establishes a reliable connection before data transfer begins.', '2025-11-30 09:11:56'),
(16, 'protocols', 'medium', 'Which protocol uses port 443 by default?', 'HTTP', 'HTTPS', 'FTP', 'SSH', 1, 'HTTPS (secure HTTP) uses port 443 by default for encrypted web traffic using SSL/TLS.', '2025-11-30 09:11:56'),
(17, 'ip', 'medium', 'How many usable host addresses are in a /24 network?', '254', '256', '255', '253', 0, 'A /24 network has 256 total addresses, minus 2 (network and broadcast addresses) = 254 usable host addresses.', '2025-11-30 09:11:56'),
(18, 'ip', 'medium', 'What is the IP address 192.168.1.255 in a /24 network?', 'Network address', 'Broadcast address', 'Gateway address', 'Host address', 1, 'The last address in a subnet (all host bits set to 1) is the broadcast address, used to send to all devices.', '2025-11-30 09:11:56'),
(19, 'troubleshooting', 'medium', 'A user cannot access the internet but can ping the default gateway. Where is the problem likely located?', 'Local network card', 'Local switch', 'Router or ISP', 'DNS server', 2, 'If the gateway is reachable but internet access fails, the issue is likely with the router, ISP connection, or beyond the local network.', '2025-11-30 09:11:56'),
(20, 'troubleshooting', 'medium', 'What does \"Destination Host Unreachable\" usually indicate?', 'DNS failure', 'No route to the destination', 'Port is closed', 'Packet too large', 1, 'This ICMP error indicates there is no route to reach the destination network, often due to routing issues.', '2025-11-30 09:11:56'),
(21, 'osi', 'hard', 'Which PDU (Protocol Data Unit) is used at the Transport Layer?', 'Frame', 'Packet', 'Segment', 'Bits', 2, 'The Transport Layer uses segments (TCP) or datagrams (UDP) as its PDU. Layer 2 uses frames, Layer 3 uses packets.', '2025-11-30 09:11:56'),
(22, 'osi', 'hard', 'What is the purpose of the CRC (Cyclic Redundancy Check) at the Data Link Layer?', 'Encryption', 'Error detection', 'Routing', 'Compression', 1, 'CRC is an error detection mechanism used at Layer 2 to detect corrupted frames during transmission.', '2025-11-30 09:11:56'),
(23, 'devices', 'hard', 'What feature allows a switch to prevent broadcast storms?', 'VLAN', 'Spanning Tree Protocol', 'Port Security', 'DHCP Snooping', 1, 'Spanning Tree Protocol (STP) prevents loops in switched networks that would cause broadcast storms.', '2025-11-30 09:11:56'),
(24, 'protocols', 'hard', 'In the DHCP DORA process, what does the \"R\" stand for?', 'Reply', 'Request', 'Receive', 'Respond', 1, 'DORA stands for Discover, Offer, Request, Acknowledge. The client Requests the offered IP address.', '2025-11-30 09:11:56'),
(25, 'ip', 'hard', 'What is the network address of 172.16.45.78/20?', '172.16.32.0', '172.16.40.0', '172.16.45.0', '172.16.0.0', 0, 'A /20 subnet mask is 255.255.240.0. The third octet: 45 AND 240 = 32, giving network 172.16.32.0.', '2025-11-30 09:11:56'),
(26, 'troubleshooting', 'hard', 'A network experiences intermittent connectivity issues. Ping times vary wildly. What is the most likely cause?', 'Faulty cable', 'Network congestion', 'Wrong subnet mask', 'Duplex mismatch', 1, 'Highly variable ping times (jitter) typically indicate network congestion or bandwidth saturation.', '2025-11-30 09:11:56');

-- --------------------------------------------------------

--
-- Table structure for table `quiz_results`
--

CREATE TABLE `quiz_results` (
  `result_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `difficulty` varchar(20) NOT NULL,
  `category` varchar(50) NOT NULL,
  `score` int(11) NOT NULL,
  `total_questions` int(11) NOT NULL,
  `percentage` decimal(5,2) NOT NULL,
  `time_taken` int(11) NOT NULL,
  `date_taken` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `quiz_results`
--

INSERT INTO `quiz_results` (`result_id`, `user_id`, `difficulty`, `category`, `score`, `total_questions`, `percentage`, `time_taken`, `date_taken`) VALUES
(1, 2, 'easy', 'troubleshooting', 0, 1, 0.00, 4, '2025-11-30 09:15:57'),
(2, 2, 'easy', 'osi', 2, 3, 67.00, 11, '2025-11-30 09:16:13'),
(3, 7, 'easy', 'troubleshooting', 1, 1, 100.00, 12, '2025-11-30 13:15:47'),
(4, 7, 'hard', 'troubleshooting', 1, 1, 100.00, 15, '2025-11-30 13:16:25'),
(5, 7, 'hard', 'troubleshooting', 0, 1, 0.00, 7, '2025-11-30 13:16:37'),
(6, 7, 'easy', 'devices', 0, 2, 0.00, 4, '2025-11-30 17:30:13'),
(7, 7, 'easy', 'devices', 0, 2, 0.00, 3, '2025-11-30 17:30:21'),
(8, 7, 'easy', 'osi', 1, 3, 33.00, 9, '2025-12-02 09:29:28'),
(9, 7, 'easy', 'osi', 1, 3, 33.00, 17, '2025-12-06 02:10:33'),
(10, 7, 'easy', 'osi', 1, 3, 33.00, 18, '2025-12-06 03:59:11');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `user_id` int(11) NOT NULL,
  `username` varchar(50) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(255) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`user_id`, `username`, `email`, `password`, `created_at`) VALUES
(1, 'Kenreiz', '23-03663@g.batstate-u.edu.ph', '$2y$10$nlnm9ScBUfhe5LPyZ93MKOBLgmbUaQqLpJmg/1diDiklQs/W.cuvG', '2025-11-23 03:26:51'),
(2, 'BJJ', 'BJeveryday@gmail.com', '$2y$10$ZfaGmyCjJqcwvkhol5N0LeRXOfFGBXNB6FjC7g9oeW/qXPJ/GqCv2', '2025-11-30 13:10:51'),
(3, 'PaoPaoPao', 'PaoPao@gmail.com', '$2y$10$HPqIFcFG2s0Hkk4UyFmTSebvfz4.dAQ0W9f6tE5qGkXnGdwgxMXeu', '2025-11-25 09:06:56'),
(4, 'Ronellll', 'ronel@gmail.com', '$2y$10$vt3TEb5ShlF5/7nQH5hZceypxjpDhYbXkelFnRlmxb7xWayErHmKG', '2025-11-25 07:54:15'),
(5, 'SENTY', 'VON@gmail.com', '$2y$10$1hRV5eIThjGdUKohYzMQg.fWANEnZYRbHpZU0mNFFI55EsJ1HA6wi', '2025-11-26 07:24:29'),
(6, 'joey', 'joemama@gmail.com', '$2y$10$JfP.Guy0tiQsljhq8TNPM.91TmNWdwGbJKZlXKNnpQAYhIRxq6HmS', '2025-11-30 06:25:59'),
(7, 'franzy', 'franz@gmail.com', '$2y$10$opGAsoRWivsfAfMP.6vime9xxjhCpoQEMmOz5mIlX.K.RsREpPAcO', '2025-12-06 03:55:05');

-- --------------------------------------------------------

--
-- Table structure for table `user_progress`
--

CREATE TABLE `user_progress` (
  `progress_id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `tutorial_id` varchar(50) DEFAULT NULL,
  `completed_date` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `user_progress`
--

INSERT INTO `user_progress` (`progress_id`, `user_id`, `tutorial_id`, `completed_date`) VALUES
(1, 6, '7', '2025-11-30 06:28:27'),
(2, 6, '1', '2025-11-30 06:28:36'),
(3, 6, '3', '2025-11-30 06:28:46'),
(4, 6, '5', '2025-11-30 06:28:53'),
(5, 6, '4', '2025-11-30 06:29:00'),
(6, 6, '6', '2025-11-30 06:29:11'),
(7, 6, '2', '2025-11-30 06:29:24'),
(8, 2, '1', '2025-11-30 06:30:19'),
(9, 2, '2', '2025-11-30 06:30:29'),
(10, 2, '3', '2025-11-30 06:30:33'),
(11, 2, '4', '2025-11-30 06:30:36'),
(12, 2, '5', '2025-11-30 06:30:39'),
(13, 2, '7', '2025-11-30 06:30:42'),
(14, 2, '6', '2025-11-30 06:38:49'),
(15, 7, '1', '2025-11-30 13:14:09'),
(16, 7, '2', '2025-11-30 13:14:17'),
(17, 7, '3', '2025-12-06 02:07:53'),
(18, 7, '4', '2025-12-06 03:56:38');

-- --------------------------------------------------------

--
-- Table structure for table `user_statistics`
--

CREATE TABLE `user_statistics` (
  `stat_id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `total_quizzes` int(11) DEFAULT 0,
  `avg_score` decimal(5,2) DEFAULT 0.00,
  `total_study_time` int(11) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `user_statistics`
--

INSERT INTO `user_statistics` (`stat_id`, `user_id`, `total_quizzes`, `avg_score`, `total_study_time`) VALUES
(1, 1, 0, 0.00, 0),
(2, 2, 0, 0.00, 0),
(3, 3, 0, 0.00, 0),
(4, 4, 0, 0.00, 0),
(5, 5, 0, 0.00, 0),
(6, 6, 0, 0.00, 0),
(7, 2, 1, 0.00, 4),
(8, 2, 2, 33.50, 15),
(9, 7, 0, 0.00, 0),
(10, 7, 1, 100.00, 12),
(11, 7, 2, 100.00, 27),
(12, 7, 3, 66.67, 34),
(13, 7, 4, 50.00, 38),
(14, 7, 5, 40.00, 41),
(15, 7, 6, 38.83, 50),
(16, 7, 7, 38.00, 67),
(17, 7, 8, 37.38, 85);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `active_sessions`
--
ALTER TABLE `active_sessions`
  ADD PRIMARY KEY (`session_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `network_devices_lib`
--
ALTER TABLE `network_devices_lib`
  ADD PRIMARY KEY (`device_id`);

--
-- Indexes for table `network_topologies`
--
ALTER TABLE `network_topologies`
  ADD PRIMARY KEY (`topology_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `quiz_questions`
--
ALTER TABLE `quiz_questions`
  ADD PRIMARY KEY (`question_id`),
  ADD KEY `idx_category_difficulty` (`category`,`difficulty`);

--
-- Indexes for table `quiz_results`
--
ALTER TABLE `quiz_results`
  ADD PRIMARY KEY (`result_id`),
  ADD KEY `idx_user_date` (`user_id`,`date_taken`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`user_id`),
  ADD UNIQUE KEY `username` (`username`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Indexes for table `user_progress`
--
ALTER TABLE `user_progress`
  ADD PRIMARY KEY (`progress_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `user_statistics`
--
ALTER TABLE `user_statistics`
  ADD PRIMARY KEY (`stat_id`),
  ADD KEY `user_id` (`user_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `active_sessions`
--
ALTER TABLE `active_sessions`
  MODIFY `session_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `network_devices_lib`
--
ALTER TABLE `network_devices_lib`
  MODIFY `device_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `network_topologies`
--
ALTER TABLE `network_topologies`
  MODIFY `topology_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `quiz_questions`
--
ALTER TABLE `quiz_questions`
  MODIFY `question_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT for table `quiz_results`
--
ALTER TABLE `quiz_results`
  MODIFY `result_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `user_progress`
--
ALTER TABLE `user_progress`
  MODIFY `progress_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `user_statistics`
--
ALTER TABLE `user_statistics`
  MODIFY `stat_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `active_sessions`
--
ALTER TABLE `active_sessions`
  ADD CONSTRAINT `active_sessions_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE;

--
-- Constraints for table `network_topologies`
--
ALTER TABLE `network_topologies`
  ADD CONSTRAINT `network_topologies_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE;

--
-- Constraints for table `quiz_results`
--
ALTER TABLE `quiz_results`
  ADD CONSTRAINT `quiz_results_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE;

--
-- Constraints for table `user_progress`
--
ALTER TABLE `user_progress`
  ADD CONSTRAINT `user_progress_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE;

--
-- Constraints for table `user_statistics`
--
ALTER TABLE `user_statistics`
  ADD CONSTRAINT `user_statistics_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
