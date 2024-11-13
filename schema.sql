CREATE DATABASE Edonationwebsite; 

USE Edonationwebsite;
  
--1. Users Table
CREATE TABLE Users (
    user_id INT AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(50) NOT NULL UNIQUE,
    email VARCHAR(100) NOT NULL UNIQUE,
    password_hash VARCHAR(255) NOT NULL,
    role ENUM('donor', 'recipient', 'admin') DEFAULT 'donor',
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP);

-- 2. Categories Table
CREATE TABLE Categories (
    category_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(50) NOT NULL UNIQUE,
    description TEXT);

-- 3. Products Table
CREATE TABLE Products (
    product_id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT NOT NULL,
    category_id INT,
    name VARCHAR(100) NOT NULL,
    description TEXT,
    condition ENUM('new', 'like new', 'used', 'for parts') NOT NULL,
    status ENUM('available', 'pending', 'donated') DEFAULT 'available',
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    FOREIGN KEY (user_id) REFERENCES Users(user_id) ON DELETE CASCADE,
    FOREIGN KEY (category_id) REFERENCES Categories(category_id));

-- 4. DonationRequests Table
CREATE TABLE DonationRequests (
    request_id INT AUTO_INCREMENT PRIMARY KEY,
    product_id INT NOT NULL,
    recipient_id INT NOT NULL,
    status ENUM('pending', 'approved', 'rejected') DEFAULT 'pending',
    requested_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (product_id) REFERENCES Products(product_id) ON DELETE CASCADE,
    FOREIGN KEY (recipient_id) REFERENCES Users(user_id) ON DELETE CASCADE);

-- 5. Donations Table
CREATE TABLE Donations (
    donation_id INT AUTO_INCREMENT PRIMARY KEY,
    product_id INT NOT NULL,
    donor_id INT NOT NULL,
    recipient_id INT NOT NULL,
    donated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (product_id) REFERENCES Products(product_id) ON DELETE CASCADE,
    FOREIGN KEY (donor_id) REFERENCES Users(user_id) ON DELETE SET NULL,
    FOREIGN KEY (recipient_id) REFERENCES Users(user_id) ON DELETE SET NULL);

-- 6. Messages Table
CREATE TABLE Messages (
    message_id INT AUTO_INCREMENT PRIMARY KEY,
    sender_id INT NOT NULL,
    recipient_id INT NOT NULL,
    message_text TEXT NOT NULL,
    sent_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (sender_id) REFERENCES Users(user_id) ON DELETE CASCADE,
    FOREIGN KEY (recipient_id) REFERENCES Users(user_id) ON DELETE CASCADE);
