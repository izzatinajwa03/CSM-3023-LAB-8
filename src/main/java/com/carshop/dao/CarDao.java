
package com.carshop.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.carshop.model.Car;

public class CarDao {
    private String jdbcURL = "jdbc:mysql://localhost:3306/CSM3023LAB8";
    private String jdbcUsername = "root";
    private String jdbcPassword = "admin";

    private static final String INSERT_CAR_SQL = "INSERT INTO CarPricelist (car_id, Brand, Model, Cylinder, Price) VALUES (?, ?, ?, ?, ?);";
    private static final String SELECT_CAR_BY_ID = "SELECT car_id, Brand, Model, Cylinder, Price FROM CarPricelist WHERE car_id = ?";
    private static final String SELECT_ALL_CARS = "SELECT * FROM CarPricelist";
    private static final String DELETE_CAR_SQL = "DELETE FROM CarPricelist WHERE car_id = ?";
    private static final String UPDATE_CAR_SQL = "UPDATE CarPricelist SET Brand = ?, Model = ?, Cylinder = ?, Price = ? WHERE car_id = ?;";

    public CarDao() {}

    protected Connection getConnection() {
        Connection connection = null;
        try {
            Class.forName("com.mysql.jdbc.Driver");
            connection = DriverManager.getConnection(jdbcURL, jdbcUsername, jdbcPassword);
        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
        }
        return connection;
    }

    public void insertCar(Car car) throws SQLException {
        System.out.println(INSERT_CAR_SQL);

        try (Connection connection = getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(INSERT_CAR_SQL)) {
            preparedStatement.setString(1, car.getBrand());
            preparedStatement.setString(2, car.getModel());
            preparedStatement.setInt(3, car.getCylinder());
            preparedStatement.setDouble(4, car.getPrice());
            System.out.println(preparedStatement);
            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            printSQLException(e);
        }
    }

    public Car selectCar(int car_id) {
        Car car = null;
        try (Connection connection = getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(SELECT_CAR_BY_ID)) {
            preparedStatement.setInt(1, car_id);
            System.out.println(preparedStatement);
            ResultSet rs = preparedStatement.executeQuery();

            while (rs.next()) {
                String brand = rs.getString("Brand");
                String model = rs.getString("Model");
                int cylinder = rs.getInt("Cylinder");
                double price = rs.getDouble("Price");
                car = new Car(car_id, brand, model, cylinder, price);
            }
        } catch (SQLException e) {
            printSQLException(e);
        }
        return car;
    }

    public List<Car> selectAllCars() {
        List<Car> cars = new ArrayList<>();
        try (Connection connection = getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(SELECT_ALL_CARS)) {
            System.out.println(preparedStatement);
            ResultSet rs = preparedStatement.executeQuery();

            while (rs.next()) {
                int car_id = rs.getInt("car_id");
                String brand = rs.getString("Brand");
                String model = rs.getString("Model");
                int cylinder = rs.getInt("Cylinder");
                double price = rs.getDouble("Price");
                cars.add(new Car(car_id, brand, model, cylinder, price));
            }
        } catch (SQLException e) {
            printSQLException(e);
        }
        return cars;
    }

    public boolean deleteCar(int car_id) throws SQLException {
        boolean rowDeleted;
        try (Connection connection = getConnection();
             PreparedStatement statement = connection.prepareStatement(DELETE_CAR_SQL)) {
            statement.setInt(1, car_id);
            rowDeleted = statement.executeUpdate() > 0;
        }
        return rowDeleted;
    }

    public boolean updateCar(Car car) throws SQLException {
        boolean rowUpdated;
        try (Connection connection = getConnection();
             PreparedStatement statement = connection.prepareStatement(UPDATE_CAR_SQL)) {
            statement.setString(1, car.getBrand());
            statement.setString(2, car.getModel());
            statement.setInt(3, car.getCylinder());
            statement.setDouble(4, car.getPrice());
            statement.setInt(5, car.getId());
            rowUpdated = statement.executeUpdate() > 0;
        }
        return rowUpdated;
    }

    private void printSQLException(SQLException ex) {
        for (Throwable e : ex) {
            if (e instanceof SQLException) {
                e.printStackTrace(System.err);
                System.err.println("SQLState: " + ((SQLException) e).getSQLState());
                System.err.println("Error Code: " + ((SQLException) e).getErrorCode());
                System.err.println("Message: " + e.getMessage());
                Throwable t = ex.getCause();
                while (t != null) {
                    System.out.println("Cause: " + t);
                    t = t.getCause();
                }
            }
        }
    }
}
