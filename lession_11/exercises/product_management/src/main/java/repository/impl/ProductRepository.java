package repository.impl;

import bean.Product;
import repository.IProductRepository;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class ProductRepository implements IProductRepository {
    private static final Map<Integer, Product> products;

    static {
        products = new HashMap<>();
        products.put(1, new Product(1, "Iphone", 1000, "New box", "China"));
        products.put(2, new Product(2, "Samsum", 1000, "New box", "China"));
        products.put(3, new Product(3, "Nokia", 1000, "New box", "China"));
        products.put(4, new Product(4, "Lg", 1000, "New box", "China"));
        products.put(5, new Product(5, "Bphone", 1000, "New box", "China"));
        products.put(6, new Product(6, "Xaomi", 1000, "New box", "China"));
    }

    @Override
    public List<Product> findAll() {
        return new ArrayList<>(products.values());
    }

    @Override
    public void save(Product product) {
        products.put(product.getId(), product);
    }

    @Override
    public Product findById(int id) {
        return products.get(id);
    }

    @Override
    public void update(int id, Product product) {
        products.put(id, product);
    }

    @Override
    public void remove(int id) {
        products.remove(id);
    }
}
