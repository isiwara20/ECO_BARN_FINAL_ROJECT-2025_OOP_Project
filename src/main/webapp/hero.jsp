<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
 <!-- IT23600584 Indievarie H. C -->   

<!-- Font Awesome Kit -->
<script src="https://kit.fontawesome.com/a076d05399.js" crossorigin="anonymous"></script>

<!-- Hero Section -->

















<section class="hero">
    <div class="hero-content">
        <h1><span>Fresh Grocery</span> <span class="shopping">Shopping</span></h1>
                <p >Explore our range to your door with</p>
        <a href="voiceAssistant.jsp" class="btn">ECO-Barn Voice Assistant</a>
    </div>
    <div class="hero-image">
        <img src="${pageContext.request.contextPath}/img/slide1.png" alt="Fresh Vegetables">
      
        
    </div>
</section>







<!-- Features Section -->
<section class="features">
    <div class="feature-box">
        <img src="${pageContext.request.contextPath}/img/groceries_10963225.png" alt="Grocery Icon">
        <h3>Grocery</h3>
        <p>Organic food from trusted local farms.</p>
    </div>
    <div class="feature-box">
        <img src="${pageContext.request.contextPath}/img/lettuce_17288377.png" alt="Salads Icon">
        <h3>Salads</h3>
        <p>Fresh salad picks delivered daily.</p>
    </div>
    <div class="feature-box">
        <img src="${pageContext.request.contextPath}/img/shopping_14090797.png" alt="Cart Icon">
        <h3>Cart Value</h3>
        <p>Save more with healthy bundles.</p>
    </div>
    <div class="feature-box">
        <img src="${pageContext.request.contextPath}/img/solution_8320810.png" alt="Support Icon">
        <h3>Support</h3>
        <p>24/7 eco-friendly customer care.</p>
    </div>
</section>

<br>
<!-- Three Vertical Product Containers -->
<section class="product-section">
    <!-- Organic Vegetables Container -->
    <div class="product-container">
        <div class="discount-circle">20%</div>
        <h3>ORGANIC VEGETABLES</h3>
        <p>Best For Health</p>
        <a href="DealDetailServlet" class="btn">VIEW MORE</a>
        <img src="${pageContext.request.contextPath}/img/main1.png" alt="Organic Vegetables" class="product-img">
    </div>

    <!-- Healthy & Fresh Grocery Container -->
    <div class="product-container">
        <div class="discount-circle">15%</div>
        <h3>HEALTHY & FRESH GROCERY</h3>
        <p>Best For Health</p>
        <a href="DealDetailServlet" class="btn">VIEW MORE</a>
        <img src="${pageContext.request.contextPath}/img/main2.png" alt="Healthy & Fresh Grocery" class="product-img">
    </div>

    <!-- 100% Natural Fruits Container -->
    <div class="product-container">
        <div class="discount-circle">10%</div>
        <h3>100% NATURAL FRUITS</h3>
        <p>Best For Health</p>
        <a href="DealDetailServlet" class="btn">VIEW MORE</a>
        <img src="${pageContext.request.contextPath}/img/main3.png" alt="100% Natural Fruits" class="product-img">
    </div>
</section>
