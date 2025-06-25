<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.ecobarn.model.Review" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
 <!-- IT23600584 Indievarie H. C -->   


<section class="testimonials">
   <h3 class="sub-heading">Customer Feedback</h3>
<h2 class="heading">What Our Clients Are Saying</h2>
<p class="description">
    We take pride in delivering quality products and outstanding service. <br>Here’s what some of our valued customers have shared about their experience with us.
</p>

    <div class="swiper mySwiper">
        <div class="swiper-wrapper">
            <%
                Object obj = request.getAttribute("reviews");
                List<Review> reviews = new ArrayList<>();
                if (obj instanceof List<?>) {
                    for (Object o : (List<?>) obj) {
                        if (o instanceof Review) {
                            reviews.add((Review) o);
                        }
                    }
                }

                for (Review review : reviews) {
            %>
            <div class="swiper-slide testimonial-card">
                <p><%= review.getComment() %></p>
                <img src="<%= review.getImagePath() %>" alt="<%= review.getName() %>" class="testimonial-img">
                <div class="info">
                    <h4><%= review.getName() %></h4>
                    <span class="stars">
                        <%
                            for (int i = 0; i < review.getRating(); i++) {
                                out.print("⭐");
                            }
                        %>
                    </span>
                </div>
            </div>
            <% } %>
        </div>

        <div class="swiper-button-prev"></div>
        <div class="swiper-button-next"></div>
        <div class="swiper-pagination"></div>
    </div>
</section>
