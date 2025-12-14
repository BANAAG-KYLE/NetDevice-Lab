# 🌐 NetDevice Lab: The Interactive Networking Guide

<div align="center">

![Course](https://img.shields.io/badge/course-IT--314-orange.svg)

**A Fully Integrated Web-Based Learning Platform for Computer Networking**

[📖 Documentation](#documentation) • [🎯 Features](#features) • [🏗️ Architecture](#architecture)

---

### 📚 **Course Information**

**IT-314: System Integration and Architecture**  
**Batangas State University - The National Engineering University**  
**College of Informatics and Computing Sciences**  
**1st Semester, AY 2025-2026**

---

</div>

## 👥 Project Team

<table>
<tr>
<td align="center" width="16.66%">
<img src="https://via.placeholder.com/100" width="100" height="100" style="border-radius: 50%"><br>
<b>Kyle Banaag</b><br>
<sub>Project Leader<br>System Architect</sub>
</td>
<td align="center" width="16.66%">
<img src="https://via.placeholder.com/100" width="100" height="100" style="border-radius: 50%"><br>
<b>Bjorn Phillipe Lara</b><br>
<sub>Database Admin<br>Backend Integration</sub>
</td>
<td align="center" width="16.66%">
<img src="https://via.placeholder.com/100" width="100" height="100" style="border-radius: 50%"><br>
<b>Paolo Dolor</b><br>
<sub>Frontend Developer<br>UI Integration</sub>
</td>
<td align="center" width="16.66%">
<img src="https://via.placeholder.com/100" width="100" height="100" style="border-radius: 50%"><br>
<b>Von Ian Chris Lozano</b><br>
<sub>API Integration<br>Module Coordinator</sub>
</td>
<td align="center" width="16.66%">
<img src="https://via.placeholder.com/100" width="100" height="100" style="border-radius: 50%"><br>
<b>Ronel Angelo Sales</b><br>
<sub>Documentation<br>Testing Lead</sub>
</td>
<td align="center" width="16.66%">
<img src="https://via.placeholder.com/100" width="100" height="100" style="border-radius: 50%"><br>
<b>[Member 6 Name]</b><br>
<sub>Integration Specialist<br>Quality Assurance</sub>
</td>
</tr>
</table>

---

## 📋 Table of Contents

- [🎯 Project Overview](#-project-overview)
- [🏗️ System Architecture](#️-system-architecture)
- [🔄 System Integration](#-system-integration)
- [✨ Key Features](#-key-features)
- [💾 Database Schema](#-database-schema)
- [🔌 API Endpoints](#-api-endpoints)
- [🎨 Frontend Technologies](#-frontend-technologies)
- [⚙️ Backend Technologies](#️-backend-technologies)
- [📊 Integration Flow](#-integration-flow)
- [🚀 Installation & Setup](#-installation--setup)
- [📸 Screenshots](#-screenshots)
- [🧪 Testing](#-testing)
- [📈 Future Enhancements](#-future-enhancements)

---

## 🎯 Project Overview

### **Problem Statement**

Many students struggle with understanding computer networking concepts because:
- 📚 Textbooks are boring and difficult to comprehend
- 🔄 Complex protocols are hard to visualize
- 💰 Expensive software (Cisco Packet Tracer) creates barriers
- 📊 Lack of progress tracking and feedback

### **Our Solution**

**NetDevice Lab** is a comprehensive, fully-integrated web-based platform that makes learning networking:
- 🎬 **Visual** - Interactive protocol animations
- 🎨 **Hands-on** - Network topology designer
- 📈 **Progressive** - Automated progress tracking
- 🆓 **Accessible** - Completely free for students

### **Project Objectives**

```
✅ Demonstrate three-tier architecture integration
✅ Implement secure user authentication system
✅ Create real-time data synchronization
✅ Build interactive learning modules
✅ Develop RESTful API communication
✅ Deploy modular, scalable system design
```

---

## 🏗️ System Architecture

### **Three-Tier Architecture**

```
┌─────────────────────────────────────────────────────────┐
│                   PRESENTATION LAYER                     │
│  ┌──────────┐  ┌──────────┐  ┌──────────┐  ┌─────────┐ │
│  │   HTML   │  │   CSS    │  │JavaScript│  │ Canvas  │ │
│  │  Pages   │  │  Styles  │  │  Logic   │  │   API   │ │
│  └──────────┘  └──────────┘  └──────────┘  └─────────┘ │
└─────────────────────────────────────────────────────────┘
                            ⬇️ HTTP/AJAX
┌─────────────────────────────────────────────────────────┐
│                   APPLICATION LAYER                      │
│  ┌──────────┐  ┌──────────┐  ┌──────────┐  ┌─────────┐ │
│  │   PHP    │  │ Session  │  │   JSON   │  │  REST   │ │
│  │ Backend  │  │Management│  │Processing│  │   API   │ │
│  └──────────┘  └──────────┘  └──────────┘  └─────────┘ │
└─────────────────────────────────────────────────────────┘
                            ⬇️ MySQLi
┌─────────────────────────────────────────────────────────┐
│                      DATA LAYER                          │
│  ┌──────────┐  ┌──────────┐  ┌──────────┐  ┌─────────┐ │
│  │  MySQL   │  │  Users   │  │  Quizzes │  │Progress │ │
│  │Database  │  │  Table   │  │  Results │  │Tracking │ │
│  └──────────┘  └──────────┘  └──────────┘  └─────────┘ │
└─────────────────────────────────────────────────────────┘
```

### **Technology Stack**

<div align="center">

| Layer | Technologies |
|-------|-------------|
| 🎨 **Frontend** | HTML5, CSS3, JavaScript (ES6+), Canvas API |
| ⚙️ **Backend** | PHP 8.2, Session Management, JSON |
| 💾 **Database** | MySQL (MariaDB 10.4.32) |
| 🌐 **Server** | Apache 2.4 (XAMPP) |
| 🔧 **Tools** | Git, VS Code, phpMyAdmin |

</div>

---

## 🔄 System Integration

### **Integration Points Demonstrated**

#### **1️⃣ Frontend-Backend Integration**
```javascript
// JavaScript Fetch API → PHP Backend
fetch('php/login.php', {
    method: 'POST',
    body: formData
})
.then(response => response.json())
.then(data => {
    // Handle integrated response
});
```

#### **2️⃣ Backend-Database Integration**
```php
// PHP MySQLi → MySQL Database
$sql = "SELECT * FROM users WHERE username = ?";
$stmt = $link->prepare($sql);
$stmt->bind_param('s', $username);
$stmt->execute();
```

#### **3️⃣ Session Integration**
```php
// Cross-page state management
session_start();
$_SESSION['user_id'] = $user['user_id'];
$_SESSION['username'] = $user['username'];
```

#### **4️⃣ Real-time Data Synchronization**
```javascript
// Asynchronous data updates
setInterval(() => {
    fetch('php/get_stats.php')
        .then(r => r.json())
        .then(data => updateUI(data));
}, 5000);
```

### **Integration Architecture Diagram**

```
┌──────────┐                    ┌──────────┐
│  Client  │ ◄─── HTTP/AJAX ──► │   PHP    │
│JavaScript│                    │ Backend  │
└──────────┘                    └──────────┘
     │                                │
     │ DOM Manipulation          MySQLi Connection
     │                                │
     ▼                                ▼
┌──────────┐                    ┌──────────┐
│   HTML   │                    │  MySQL   │
│   DOM    │                    │ Database │
└──────────┘                    └──────────┘

     Integration Flow:
     User Action → JS Event → Fetch API → PHP Processing
     → Database Query → JSON Response → UI Update
```

---

## ✨ Key Features

### **1. User Authentication System** 🔐

**Integration Demonstrated:**
- Frontend form validation (JavaScript)
- Backend credential verification (PHP)
- Database user lookup (MySQL)
- Session management (PHP Sessions)
- Secure password hashing (bcrypt)

**Technical Implementation:**
```
Login Flow:
HTML Form → JavaScript Validation → Fetch API 
→ login.php → MySQLi Query → Session Creation 
→ JSON Response → Redirect to Dashboard
```

---

### **2. Interactive Dashboard** 📊

**Integration Demonstrated:**
- Multi-table database joins
- Real-time statistics calculation
- Asynchronous data loading
- Dynamic DOM updates

**Features:**
- ✅ Total Quizzes Completed
- ✅ Average Score Calculation
- ✅ Tutorial Progress Tracking
- ✅ Study Time Monitoring
- ✅ Recent Activity Feed

---

### **3. Protocol Animations** 🎬

**Animations Available:**
- TCP Three-Way Handshake
- DNS Resolution Process
- DHCP IP Assignment (DORA)
- ICMP Ping/Echo Request

**Integration Demonstrated:**
- CSS keyframe animations
- JavaScript timing control
- DOM manipulation
- Event-driven architecture

---

### **4. OSI Model Tutorials** 📚

**7 Layers Covered:**
1. Layer 7 - Application Layer
2. Layer 6 - Presentation Layer
3. Layer 5 - Session Layer
4. Layer 4 - Transport Layer
5. Layer 3 - Network Layer
6. Layer 2 - Data Link Layer
7. Layer 1 - Physical Layer

**Integration Demonstrated:**
- Modal component integration
- Progress tracking (PHP + MySQL)
- State management
- Data persistence

---

### **5. Interactive Quiz System** ❓

**Quiz Features:**
- 3 difficulty levels (Easy, Medium, Hard)
- 5 categories (OSI, Devices, Protocols, IP, Troubleshooting)
- Randomized questions from database
- Real-time feedback
- Automatic scoring
- Progress saving

**Integration Demonstrated:**
```
Quiz Integration Flow:
┌─────────────────────────────────────────────────┐
│ 1. User selects difficulty & category (Frontend)│
├─────────────────────────────────────────────────┤
│ 2. AJAX request → get_quiz_questions.php       │
├─────────────────────────────────────────────────┤
│ 3. PHP queries database (SELECT RAND())        │
├─────────────────────────────────────────────────┤
│ 4. Database returns 10 random questions        │
├─────────────────────────────────────────────────┤
│ 5. PHP formats as JSON array                   │
├─────────────────────────────────────────────────┤
│ 6. Frontend renders questions dynamically      │
├─────────────────────────────────────────────────┤
│ 7. User answers → JavaScript validation        │
├─────────────────────────────────────────────────┤
│ 8. POST results → save_quiz_result.php         │
├─────────────────────────────────────────────────┤
│ 9. PHP updates quiz_results & user_statistics  │
├─────────────────────────────────────────────────┤
│ 10. Dashboard statistics update automatically  │
└─────────────────────────────────────────────────┘
```

---

### **6. Network Topology Designer** 🎨

**Features:**
- Drag-and-drop interface
- Device types: PC, Router, Server
- Cable connections
- IP address assignment
- Save/Load functionality
- Connectivity checking

**Integration Demonstrated:**
- HTML5 Canvas API
- Object-oriented JavaScript
- JSON data serialization
- Database BLOB storage
- Real-time canvas rendering

---

### **7. Device Encyclopedia** 🖥️

**Devices Covered:**
- Routers, Switches, Hubs
- Firewalls, Access Points
- Modems, NICs
- Load Balancers, Proxy Servers
- Repeaters

**Integration Features:**
- Search functionality
- Category filtering
- Modal detail views
- Responsive design

---

## 💾 Database Schema

### **Entity Relationship Diagram**

```
┌─────────────┐         ┌──────────────────┐         ┌────────────────┐
│    USERS    │────1:*──│  QUIZ_RESULTS    │         │ QUIZ_QUESTIONS │
│             │         │                  │         │                │
│ PK user_id  │         │ PK result_id     │         │ PK question_id │
│  username   │         │ FK user_id       │         │  category      │
│  email      │         │  difficulty      │         │  difficulty    │
│  password   │         │  category        │         │  question_text │
│  created_at │         │  score           │         │  option_a      │
└─────────────┘         │  percentage      │         │  option_b      │
       │                │  time_taken      │         │  option_c      │
       │                └──────────────────┘         │  option_d      │
       │                                             │  correct_answer│
       │                ┌──────────────────┐         │  explanation   │
       ├───────1:*──────│ USER_PROGRESS    │         └────────────────┘
       │                │                  │
       │                │ PK progress_id   │         ┌────────────────┐
       │                │ FK user_id       │         │USER_STATISTICS │
       │                │  tutorial_id     │         │                │
       │                │  completed_date  │         │ PK stat_id     │
       │                └──────────────────┘         │ FK user_id     │
       │                                             │  total_quizzes │
       │                ┌──────────────────┐         │  avg_score     │
       └───────1:*──────│NETWORK_TOPOLOGIES│         │  total_study   │
                        │                  │         └────────────────┘
                        │ PK topology_id   │
                        │ FK user_id       │
                        │  topology_name   │
                        │  device_data     │
                        │  connection_data │
                        │  created_at      │
                        └──────────────────┘
```

### **Table Specifications**

| Table | Records | Purpose | Integration Point |
|-------|---------|---------|-------------------|
| **users** | User accounts | Authentication | Session management |
| **user_statistics** | Performance metrics | Dashboard display | Real-time calculations |
| **user_progress** | Tutorial completion | Progress tracking | Achievement system |
| **quiz_questions** | 26 questions | Quiz content | Random selection |
| **quiz_results** | Quiz history | Performance analysis | Statistical aggregation |
| **network_topologies** | Saved designs | Topology persistence | JSON serialization |

---

## 🔌 API Endpoints

### **Authentication Endpoints**

```php
POST /php/register.php
Request:  { username, email, password }
Response: { success: true, message: "Registration successful" }

POST /php/login.php
Request:  { username, password, rememberMe }
Response: { success: true, user_id, username }

GET /php/check_session.php
Response: { loggedIn: true, userId, username, email }

GET /php/logout.php
Action:   Destroys session, redirects to index.html
```

### **Learning Module Endpoints**

```php
GET /php/get_stats.php?user_id={id}
Response: {
    success: true,
    stats: {
        total_quizzes: 10,
        avg_score: 85.5,
        total_study_time: 3600,
        tutorials_completed: 5
    },
    recent_activity: [...]
}

GET /php/get_tutorial_progress.php
Response: {
    success: true,
    completed: [1, 2, 3, 7]
}

POST /php/mark_tutorial_complete.php
Request:  { layer: 7 }
Response: { success: true, message: "Tutorial completed" }
```

### **Quiz System Endpoints**

```php
GET /php/get_quiz_questions.php?difficulty={level}&category={cat}
Response: {
    success: true,
    questions: [
        {
            question_id: 1,
            question_text: "...",
            options: ["A", "B", "C", "D"],
            correct_answer: 2,
            explanation: "..."
        }
    ]
}

POST /php/save_quiz_result.php
Request: {
    difficulty: "easy",
    category: "osi",
    score: 8,
    total_questions: 10,
    percentage: 80,
    time_taken: 120,
    answers: [...]
}
Response: { success: true, message: "Result saved" }
```

### **Topology Designer Endpoints**

```php
POST /php/save_topology.php
Request: {
    name: "My Network",
    devices: [{id, type, x, y, name, ip}],
    connections: [{id, from, to, label}]
}
Response: { success: true, topology_id: 5 }

GET /php/get_topologies.php
Response: {
    success: true,
    topologies: [
        {topology_id, topology_name, created_at}
    ]
}

GET /php/load_topology.php?id={id}
Response: {
    success: true,
    devices: [...],
    connections: [...]
}
```

---

## 🎨 Frontend Technologies

### **HTML5 Structure**

```
/pages/
├── dashboard.html      - User dashboard
├── learning.html       - Learning modules hub
├── protocols.html      - Protocol animations
├── tutorials.html      - OSI layer tutorials
├── quiz.html          - Interactive quiz system
├── topology.html      - Network designer
└── devices.html       - Device encyclopedia
```

### **CSS3 Styling**

```
/css/
├── style.css          - Base styles & components
├── animations.css     - Protocol animations
└── responsive.css     - Mobile responsiveness
```

**Design Features:**
- 🎨 Modern gradient backgrounds
- 🌙 Smooth transitions and animations
- 📱 Fully responsive (mobile, tablet, desktop)
- ♿ Accessible color contrasts
- 🎯 Consistent UI components

### **JavaScript Modules**

```
/js/
├── main.js                    - Core functions
├── topology-designer.js       - Canvas drawing logic
├── quiz.js                    - Quiz functionality
└── progress.js                - Progress tracking
```

**JavaScript Features:**
- ✅ ES6+ syntax (arrow functions, async/await)
- ✅ Fetch API for AJAX requests
- ✅ DOM manipulation
- ✅ Event-driven architecture
- ✅ Object-oriented programming
- ✅ Canvas API for graphics

---

## ⚙️ Backend Technologies

### **PHP Architecture**

```
/php/
├── config.php                    - Database connection
├── register.php                  - User registration
├── login.php                     - Authentication
├── logout.php                    - Session destruction
├── check_session.php             - Session validation
├── get_stats.php                 - Dashboard statistics
├── get_quiz_questions.php        - Quiz data retrieval
├── save_quiz_result.php          - Quiz result storage
├── get_tutorial_progress.php     - Progress retrieval
├── mark_tutorial_complete.php    - Progress update
├── save_topology.php             - Topology save
├── load_topology.php             - Topology load
└── get_topologies.php            - Topology list
```

### **Security Implementations**

```php
✅ Password Hashing (bcrypt)
password_hash($password, PASSWORD_BCRYPT);

✅ SQL Injection Prevention (Prepared Statements)
$stmt = $link->prepare("SELECT * FROM users WHERE username = ?");
$stmt->bind_param('s', $username);

✅ XSS Prevention (Input Sanitization)
$username = trim($_POST['username']);
$username = htmlspecialchars($username);

✅ Session Security
session_start();
session_regenerate_id(true);

✅ CSRF Protection
// Token validation on sensitive operations
```

---

## 📊 Integration Flow Examples

### **Example 1: User Login Integration**

```
┌──────────────────────────────────────────────────────────────┐
│                     USER LOGIN FLOW                          │
└──────────────────────────────────────────────────────────────┘

1. USER ACTION (Frontend)
   └─> User enters username & password
   └─> Clicks "Login" button

2. JAVASCRIPT VALIDATION (Frontend)
   └─> event.preventDefault() - Stop form submission
   └─> Validate input fields
   └─> Prepare FormData object

3. FETCH API CALL (Frontend → Backend)
   └─> POST request to php/login.php
   └─> Send credentials securely

4. PHP RECEIVES DATA (Backend)
   └─> Retrieve $_POST['username'] and $_POST['password']
   └─> Sanitize input data

5. DATABASE QUERY (Backend → Database)
   └─> Prepare SQL statement with parameters
   └─> Execute: SELECT * FROM users WHERE username = ?
   └─> Fetch user record

6. PASSWORD VERIFICATION (Backend)
   └─> Use password_verify() to check hash
   └─> Compare stored hash with input

7. SESSION CREATION (Backend)
   └─> session_start()
   └─> $_SESSION['user_id'] = $user['user_id']
   └─> $_SESSION['username'] = $user['username']

8. JSON RESPONSE (Backend → Frontend)
   └─> Return: { success: true, user_id: 5, username: "John" }

9. JAVASCRIPT HANDLING (Frontend)
   └─> Parse JSON response
   └─> Check if success === true
   └─> Store user info if needed

10. PAGE REDIRECT (Frontend)
    └─> window.location.href = 'pages/dashboard.html'
    └─> User successfully logged in

⏱️ Total Process Time: ~200-500ms
```

### **Example 2: Quiz Taking Integration**

```
┌──────────────────────────────────────────────────────────────┐
│                   QUIZ SYSTEM INTEGRATION                    │
└──────────────────────────────────────────────────────────────┘

PHASE 1: QUIZ INITIALIZATION
├─> User selects difficulty & category (Frontend)
├─> JavaScript validates selections
├─> GET request: get_quiz_questions.php?difficulty=easy&category=osi
├─> PHP queries database: SELECT * FROM quiz_questions WHERE...
├─> MySQL returns 10 random questions (ORDER BY RAND() LIMIT 10)
├─> PHP formats as JSON array with all question data
├─> JavaScript receives questions and stores in memory
└─> First question rendered dynamically in DOM

PHASE 2: ANSWERING QUESTIONS
├─> User clicks answer button
├─> JavaScript highlights selected answer
├─> JavaScript checks if correct (client-side immediate feedback)
├─> Correct answer shown in green, wrong in red
├─> Explanation displayed below question
├─> Answer stored in array: userAnswers.push({...})
├─> "Next Question" button appears
└─> Repeat for all 10 questions

PHASE 3: QUIZ COMPLETION
├─> User finishes last question
├─> JavaScript calculates: score, percentage, time_taken
├─> Prepare comprehensive result object
├─> POST request: save_quiz_result.php
│   └─> Body: {
│         difficulty, category, score, total_questions,
│         percentage, time_taken, answers[]
│      }
├─> PHP receives quiz result data
├─> BEGIN TRANSACTION (for data integrity)
│   ├─> INSERT INTO quiz_results (user_id, score, percentage...)
│   ├─> UPDATE user_statistics SET total_quizzes = total_quizzes + 1
│   └─> RECALCULATE avg_score = AVG(percentage) FROM quiz_results
├─> COMMIT TRANSACTION
├─> PHP returns: { success: true }
├─> JavaScript displays results screen
└─> User sees final score, breakdown, performance message

PHASE 4: DASHBOARD UPDATE (Real-time Integration)
├─> User navigates to dashboard
├─> Dashboard loads: check_session.php (verify user)
├─> Dashboard loads: get_stats.php (get updated statistics)
├─> PHP queries user_statistics table
├─> Returns: { total_quizzes: 11, avg_score: 83.2, ... }
├─> JavaScript updates DOM elements dynamically
└─> Statistics reflect latest quiz results

🔄 INTEGRATION POINTS:
- Frontend ↔ Backend: Fetch API (JSON)
- Backend ↔ Database: MySQLi (Prepared Statements)
- State Management: JavaScript variables + PHP Sessions
- Data Format: JSON for all API responses
```

---

## 🚀 Installation & Setup

### **Prerequisites**

```bash
✅ XAMPP 8.2 or higher
✅ PHP 8.2+
✅ MySQL (MariaDB) 10.4+
✅ Modern web browser (Chrome, Firefox, Edge)
✅ Text editor (VS Code recommended)
```

### **Step-by-Step Installation**

#### **1. Clone the Repository**
```bash
git clone https://github.com/your-username/netdevice-lab.git
cd netdevice-lab
```

#### **2. Start XAMPP Services**
```bash
# Start Apache and MySQL
- Open XAMPP Control Panel
- Click "Start" on Apache
- Click "Start" on MySQL
```

#### **3. Create Database**
```sql
-- Open phpMyAdmin (http://localhost/phpmyadmin)
-- Create new database

CREATE DATABASE netdevice_db;

-- Import the provided SQL file
-- File: /database/netdevice_db.sql
```

#### **4. Configure Database Connection**
```php
// File: php/config.php
define('DB_SERVER', 'localhost');
define('DB_USERNAME', 'root');
define('DB_PASSWORD', '');  // Leave empty for XAMPP default
define('DB_NAME', 'netdevice_db');
```

#### **5. Move Project to XAMPP Directory**
```bash
# Copy project folder to:
C:/xampp/htdocs/netdevice-lab/

# Or create symlink (Windows CMD as Admin):
mklink /D C:\xampp\htdocs\netdevice-lab C:\path\to\your\project
```

#### **6. Access the Application**
```
🌐 Open browser and navigate to:
http://localhost/netdevice-lab/

📝 Register a new account or use test account:
Username: testuser
Password: test123
```

### **Project Structure**

```
netdevice-lab/
│
├── index.html              # Landing page
├── login.html             # Login page
├── register.html          # Registration page
│
├── pages/                 # Application pages
│   ├── dashboard.html
│   ├── learning.html
│   ├── protocols.html
│   ├── tutorials.html
│   ├── quiz.html
│   ├── topology.html
│   └── devices.html
│
├── css/                   # Stylesheets
│   ├── style.css
│   ├── animations.css
│   └── responsive.css
│
├── js/                    # JavaScript files
│   ├── main.js
│   ├── topology-designer.js
│   ├── quiz.js
│   └── progress.js
│
├── php/                   # Backend PHP files
│   ├── config.php
│   ├── register.php
│   ├── login.php
│   ├── logout.php
│   ├── check_session.php
│   ├── get_stats.php
│   ├── get_quiz_questions.php
│   ├── save_quiz_result.php
│   ├── get_tutorial_progress.php
│   ├── mark_tutorial_complete.php
│   ├── save_topology.php
│   ├── load_topology.php
│   └── get_topologies.php
│
├── database/              # Database files
│   └── netdevice_db.sql
│
├── images/                # Image assets
│
├── docs/                  # Documentation
│   └── architecture.md
│
└── README.md              # This file
```

---

## 📸 Screenshots

### **Landing Page**
<div align="center">
<img src="screenshots/landing-page.png" alt="Landing Page" width="800">

*Modern gradient hero section with animated globe background*
</div>

### **Dashboard**
<div align="center">
<img src="screenshots/dashboard.png" alt="Dashboard" width="800">

*Real-time statistics and progress tracking*
</div>

### **Protocol Animations**
<div align="center">
<img src="screenshots/tcp-animation.png" alt="TCP Animation" width="800">

*Interactive TCP Three-Way Handshake visualization*
</div>

### **Quiz System**
<div align="center">
<img src="screenshots/quiz.png" alt="Quiz" width="800">

*Interactive quiz with instant feedback*
</div>

### **Topology Designer**
<div align="center">
<img src="screenshots/topology.png" alt="Topology Designer" width="800">

*Drag-and-drop network design tool*
</div>

---

## 🧪 Testing

### **Test Scenarios Completed**

#### **Authentication Testing**
```
✅ User registration with valid data
✅ Duplicate username/email prevention
✅ Password strength validation
✅ Login with correct credentials
✅ Login with incorrect credentials
✅ Session persistence across pages
✅ Logout functionality
✅ Password hashing verification
```

#### **Quiz System Testing**
```
✅ Question randomization
✅ Multiple difficulty levels
✅ Category filtering
✅ Answer validation
✅ Score calculation
✅ Time tracking
✅ Result storage
✅ Statistics update
```

#### **Topology Designer Testing**
```
✅ Device placement
✅ Cable connections
✅ IP address validation
✅ Save functionality
✅ Load functionality
✅ Connectivity check
✅ Canvas zoom
✅ Undo/Redo operations
```

#### **Integration Testing**
```
✅ Frontend-Backend communication
✅ Database transactions
✅ Session management
✅ Real-time data updates
✅ Error handling
✅ Cross-browser compatibility
✅ Mobile responsiveness
```

### **Performance Metrics**

| Metric | Result | Status |
|--------|--------|--------|
| Average Page Load | < 2 seconds | ✅ Pass |
| API Response Time | < 500ms | ✅ Pass |
| Database Query Time | < 100ms | ✅ Pass |
| Login Process | < 1 second | ✅ Pass |
| Quiz Load Time | < 1.5 seconds | ✅ Pass |

---

## 📈 Future Enhancements

### **Planned Features**

🔮 **Version 2.0 Roadmap**
- [ ] Advanced network simulations
- [ ] Multi-player collaboration mode
- [ ] AI-powered learning recommendations
- [ ] Mobile app (React Native)
- [ ] CCNA certification practice exams
- [ ] Video tutorials integration
- [ ] Community forum
- [ ] Instructor dashboard
- [ ] Achievement badges system
- [ ] Leaderboard functionality

### **Technical Improvements**
- [ ] Migrate to Laravel framework
- [ ] Implement Redis caching
- [ ] Add WebSocket for real-time features
- [ ] API rate limiting
- [ ] OAuth2 authentication
- [ ] Progressive Web App (PWA)
- [ ] Docker containerization
- [ ] CI/CD pipeline setup

---

## 📜 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

---

## 🙏 Acknowledgments

**Special Thanks To:**
- 👨‍🏫 **Prof. [Name]** - IT-314 Course Instructor
- 🏫 **Batangas State University** - The National Engineering University
- 🎓 **College of Informatics and Computing Sciences**
- 📚 **All networking resources and documentation**

---

## 📞 Contact & Support

<div align="center">

**Project Repository:** [github.com/your-username/netdevice-lab](https://github.com/your-username/netdevice-lab)

**Email:** netdevice.lab@gmail.com

**University:** Batangas State University - Alangilan Campus

---

### 🌟 If you found this project helpful, please give it a star!

[![GitHub stars](https://img.shields.io/github/stars/your-username/netdevice-lab?style=social)](https://github.com/your-username/netdevice-lab/stargazers)
[![GitHub forks](https://img.shields.io/github/forks/your-username/netdevice-lab?style=social)](https://github.com/your-username/netdevice-lab/network/members)

</div>

---

<div align="center">

**Made with ❤️ by IT-NT-3101 Students**

*Leading Innovations, Transforming Lives, Building the Nation*

**© 2025 NetDevice Lab. All Rights Reserved.**

</div>
