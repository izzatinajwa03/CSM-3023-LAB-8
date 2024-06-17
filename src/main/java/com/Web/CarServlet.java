
package com.web;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import com.carshop.model.Car;
import com.carshop.dao.CarDao;

@WebServlet("/")
public class CarServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;
    private CarDao carDao;

    public void init() {
        carDao = new CarDao();
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getServletPath();

        try {
            switch (action) {
                case "/newcar":
                    showNewForm(request, response);
                    break;
                case "/insertcar":
                    insertCar(request, response);
                    break;
                case "/deletecar":
                    deleteCar(request, response);
                    break;
                case "/editcar":
                    showEditForm(request, response);
                    break;
                case "/updatecar":
                    updateCar(request, response);
                    break;
                default:
                    listCar(request, response);
                    break;
            }
        } catch (SQLException ex) {
            throw new ServletException(ex);
        }
    }

    private void listCar(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, IOException, ServletException {
        List<Car> listCar = carDao.selectAllCars();
        request.setAttribute("listCar", listCar);
        RequestDispatcher dispatcher = request.getRequestDispatcher("listCars.jsp");
        dispatcher.forward(request, response);
    }

    private void showNewForm(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        RequestDispatcher dispatcher = request.getRequestDispatcher("addCar.jsp");
        dispatcher.forward(request, response);
    }

    private void showEditForm(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        Car existingCar = carDao.selectCar(id);
        RequestDispatcher dispatcher = request.getRequestDispatcher("editCar.jsp");
        request.setAttribute("car", existingCar);
        dispatcher.forward(request, response);
    }

    protected void insertCar(HttpServletRequest request, HttpServletResponse response)
        throws SQLException, IOException {
    String brand = request.getParameter("brand");
    String model = request.getParameter("model");
    int cylinder = Integer.parseInt(request.getParameter("cylinder"));
    double price = Double.parseDouble(request.getParameter("price"));
    Car newCar = new Car(brand, model, cylinder, price);
    carDao.insertCar(newCar);
    response.sendRedirect("listCars");
}

    private void updateCar(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        String brand = request.getParameter("brand");
        String model = request.getParameter("model");
        int cylinder = Integer.parseInt(request.getParameter("cylinder"));
        double price = Double.parseDouble(request.getParameter("price"));

        Car car = new Car(id, brand, model, cylinder, price);
        carDao.updateCar(car);
        response.sendRedirect("listCars");
    }

    private void deleteCar(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        carDao.deleteCar(id);
        response.sendRedirect("listCars");
    }
}
