CREATE DATABASE E_donation_website; 

USE E_donation_website;
  
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

-- 3. DonationRequests Table
CREATE TABLE DonationRequests (
    request_id INT AUTO_INCREMENT PRIMARY KEY,
    product_id INT NOT NULL,
    recipient_id INT NOT NULL,
    status ENUM('pending', 'approved', 'rejected') DEFAULT 'pending',
    requested_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (product_id) REFERENCES Products(product_id) ON DELETE CASCADE,
    FOREIGN KEY (recipient_id) REFERENCES Users(user_id) ON DELETE CASCADE);

-- 4. Donations Table
CREATE TABLE Donations (
    donation_id INT AUTO_INCREMENT PRIMARY KEY,
    product_id INT NOT NULL,
    donor_id INT NOT NULL,
    recipient_id INT NOT NULL,
    donated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (product_id) REFERENCES Products(product_id) ON DELETE CASCADE,
    FOREIGN KEY (donor_id) REFERENCES Users(user_id) ON DELETE SET NULL,
    FOREIGN KEY (recipient_id) REFERENCES Users(user_id) ON DELETE SET NULL);


