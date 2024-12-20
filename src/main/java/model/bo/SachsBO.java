package model.bo;

import model.bean.Sachs;
import model.dao.SachsDAO;
import java.util.List;

public class SachsBO {
    private SachsDAO sachsDAO;

    public SachsBO() {
        this.sachsDAO = new SachsDAO(); // Initialize the DAO
    }

    // Method to insert a new Sachs into the database
    public boolean insertSachs(Sachs sachs) {
        // You can add any business logic here if necessary
        if (sachs.getNameSach() == null || sachs.getNameSach().isEmpty()) {
            return false; // Example validation check
        }
        return sachsDAO.insertSachs(sachs); // Call DAO method to insert
    }

    // Method to get all Sachs from the database
    public List<Sachs> getAllSachs() {
        return sachsDAO.getAllSachs(); // Call DAO method to fetch all records
    }

    // Method to get a Sachs by ID
    public Sachs getSachsById(int idSach) {
        return sachsDAO.getSachsById(idSach); // Call DAO method to fetch a Sachs by ID
    }

    // Method to update a Sachs
    public boolean updateSachs(Sachs sachs) {
        // Example business logic for validation
        if (sachs.getSoluong() < 0) {
            return false; // Example validation: soluong should not be negative
        }
        return sachsDAO.updateSachs(sachs); // Call DAO method to update the Sachs
    }

    // Method to delete a Sachs by ID
    public boolean deleteSachs(int idSach) {
        return sachsDAO.deleteSachs(idSach); // Call DAO method to delete the Sachs by ID
    }
}
