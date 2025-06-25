<%@ page contentType="text/html;charset=UTF-8" language="java" %>

 <!-- IT23600584 Indievarie H. C -->   



<%@ page import="com.ecobarn.model.*" %>
<%@ page import="com.ecobarn.DAO.*" %>

<%@ page import="java.sql.*" %>
<%@ page import="java.util.List" %>
<%@ page import="com.ecobarn.model.Product" %>
<%@ page import="com.ecobarn.model.Category" %>
<%@ page import="com.ecobarn.model.Review" %>
<%@ page import="com.ecobarn.DAO.ProductDAO" %>
<%@ page import="com.ecobarn.DAO.CategoryDAO" %>
<%@ page import="com.ecobarn.DAO.ReviewDAO" %>

<%
    List<Product> products = ProductDAO.getAllProducts();
    List<Category> categories = CategoryDAO.getAllCategories();
    List<Review> reviews = ReviewDAO.getAllReviews();

    request.setAttribute("products", products);
    request.setAttribute("categories", categories);
    request.setAttribute("reviews", reviews);
%>



<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Eco-Barn | Home </title>
      <link rel="icon" type="image/x-icon" href="img/logoblack.png">
    <link rel="stylesheet" href="css/gstyle.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
    <link rel="stylesheet" href="https://unpkg.com/swiper/swiper-bundle.min.css" />



<%
    request.setAttribute("currentPage", "home");
%>
<jsp:include page="header.jsp" />

<jsp:include page="hero.jsp"/>
<jsp:include page="categories.jsp"/>
<jsp:include page="promo.jsp"/>
<jsp:include page="reviews.jsp"/>
<jsp:include page="products.jsp"/>
<jsp:include page="footer.jsp"/>


<!-- Swiper JS for testimonials -->
<script src="https://unpkg.com/swiper/swiper-bundle.min.js"></script>

<!-- JavaScript for category tabs and Swiper -->
<script>
    // Category Tabs Logic
    document.addEventListener("DOMContentLoaded", function () {
        const tabs = document.querySelectorAll(".tab-item");
        const sections = document.querySelectorAll(".items-container");

        tabs.forEach(tab => {
            tab.addEventListener("click", function () {
                tabs.forEach(btn => btn.classList.remove("active-tab"));
                this.classList.add("active-tab");

                const category = this.getAttribute("data-cat");
                sections.forEach(sec => {
                    sec.style.display = sec.id === category ? "flex" : "none";
                });
            });
        });
    });

    // Swiper Testimonials
    var swiper = new Swiper(".mySwiper", {
        slidesPerView: 1,
        loop: true,
        spaceBetween: 30,
        navigation: {
            nextEl: ".swiper-button-next",
            prevEl: ".swiper-button-prev",
        },
        pagination: {
            el: ".swiper-pagination",
            clickable: true,
        },
        autoplay: {
            delay: 3000,
            disableOnInteraction: false,
        },
        effect: "slide",
        speed: 800
    });
</script>

</body>
</html>
