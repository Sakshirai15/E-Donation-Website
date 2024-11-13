package com.example.edonation.dao;

import com.example.edonation.model.Product;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface ProductDAO extends JpaRepository<Product, Long> {
    // Custom query method to find products by name
    List<Product> findByName(String name);

    // Custom query method to find products by condition
    List<Product> findByCondition(String condition);
}
