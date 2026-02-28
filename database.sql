-- ============================================
-- لعبة تحدي الحروف - قاعدة البيانات
-- ============================================

-- إنشاء قاعدة البيانات
CREATE DATABASE IF NOT EXISTS huroof_game 
CHARACTER SET utf8mb4 
COLLATE utf8mb4_unicode_ci;

USE huroof_game;

-- ============================================
-- جدول المستخدمين
-- ============================================
CREATE TABLE users (
    id INT AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(50) UNIQUE NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    password_hash VARCHAR(255) NOT NULL,
    total_points INT DEFAULT 0,
    games_played INT DEFAULT 0,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ============================================
-- جدول الحروف العربية
-- ============================================
CREATE TABLE letters (
    id INT AUTO_INCREMENT PRIMARY KEY,
    letter VARCHAR(10) NOT NULL,
    is_active BOOLEAN DEFAULT TRUE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- إدخال الحروف العربية (28 حرف)
INSERT INTO letters (letter) VALUES 
('أ'), ('ب'), ('ت'), ('ث'), ('ج'), ('ح'), ('خ'),
('د'), ('ذ'), ('ر'), ('ز'), ('س'), ('ش'), ('ص'),
('ض'), ('ط'), ('ظ'), ('ع'), ('غ'), ('ف'), ('ق'),
('ك'), ('ل'), ('م'), ('ن'), ('هـ'), ('و'), ('ي');

-- ============================================
-- جدول التصنيفات
-- ============================================
CREATE TABLE categories (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    icon VARCHAR(50),
    is_active BOOLEAN DEFAULT TRUE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- إدخال التصنيفات
INSERT INTO categories (name, icon) VALUES
('حيوان', '🦁'),
('نبات', '🌿'),
('بلد', '🌍'),
('فاكهة', '🍎'),
('اسم إنسان', '👤'),
('جماد', '📦'),
('لون', '🎨'),
('مهنة', '💼');

-- ============================================
-- جدول الإجابات الصحيحة
-- ============================================
CREATE TABLE answers (
    id INT AUTO_INCREMENT PRIMARY KEY,
    category_id INT NOT NULL,
    letter_id INT NOT NULL,
    answer VARCHAR(100) NOT NULL,
    is_verified BOOLEAN DEFAULT TRUE,
    FOREIGN KEY (category_id) REFERENCES categories(id) ON DELETE CASCADE,
    FOREIGN KEY (letter_id) REFERENCES letters(id) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ============================================
-- جدول الجولات (الألعاب)
-- ============================================
CREATE TABLE games (
    id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT NOT NULL,
    letter_id INT NOT NULL,
    score INT DEFAULT 0,
    time_taken INT DEFAULT 0,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE CASCADE,
    FOREIGN KEY (letter_id) REFERENCES letters(id) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ============================================
-- إدخال بعض الإجابات التجريبية
-- ============================================
-- حيوان - حرف م
INSERT INTO answers (category_id, letter_id, answer) VALUES 
(1, 24, 'مهر'), (1, 24, 'ماعز'), (1, 24, 'قرد');

-- نبات - حرف م
INSERT INTO answers (category_id, letter_id, answer) VALUES 
(2, 24, 'موز'), (2, 24, 'مانجو'), (2, 24, 'ملوخية');

-- بلد - حرف م
INSERT INTO answers (category_id, letter_id, answer) VALUES 
(3, 24, 'مصر'), (3, 24, 'المغرب'), (3, 24, 'موريتانيا');

-- فاكهة - حرف م
INSERT INTO answers (category_id, letter_id, answer) VALUES 
(4, 24, 'موز'), (4, 24, 'مانجو'), (4, 24, 'مشمش');
