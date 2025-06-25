<%@ page import="java.sql.*" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

 <!-- IT23600584 Indievarie H. C -->   


<section class="shop-bg">
    <h2 style="font-size:25px; margin-bottom:10px;">Today’s Best-Selling Items</h2>
<br>
    <!-- Category Tabs -->
    <div class="category-tabs">
        <button class="tab-item active-tab" data-cat="vegetables">VEGETABLES</button>
        <button class="tab-item" data-cat="fruits">FRUITS</button>
        <button class="tab-item" data-cat="freshnuts">FRESH NUTS</button>
        <button class="tab-item" data-cat="leafygreen">LEAFY GREEN</button>
        <button class="tab-item" data-cat="root">ROOT</button>
    </div>

<%
    String url = "jdbc:mysql://localhost:3306/ecobarn";
    String user = "root";
    String pass = "oslocc123";

    String[] categories = {"vegetables", "fruits", "freshnuts", "leafygreen", "root"};
    String[] tables = {"tbl_vegetables", "tbl_fruits", "tbl_nuts", "tbl_leafy", "tbl_roots"};

    Connection conn = null;
    PreparedStatement stmt = null;
    ResultSet rs = null;

    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        conn = DriverManager.getConnection(url, user, pass);

        for (int i = 0; i < categories.length; i++) {
            String categoryId = categories[i];
            String tableName = tables[i];

            // Query to get products for each category
            String sql = "SELECT name, price, image FROM " + tableName;
            stmt = conn.prepareStatement(sql);
            rs = stmt.executeQuery();
%>
    <div class="items-container" id="<%= categoryId %>" style="<%= i == 0 ? "" : "display:none;" %>">
<%
            // If no products are found for this category
            if (!rs.isBeforeFirst()) {
                out.println("<p>No products available in this category.</p>");
            } else {
                // Loop through the result set and display products
                while (rs.next()) {
                    String name = rs.getString("name");
                    double price = rs.getDouble("price");
                    String image = rs.getString("image");
%>
        <div class="product-card">
            <img src="<%= "img/" + image %>" alt="<%= name %>">
            <h4><%= name %></h4>
            <p class="price">LKR <%= price %></p>
            <a href="ItemDetailsController?category=<%= categoryId %>&name=<%= java.net.URLEncoder.encode(name, "UTF-8") %>" class="select-btn">Select options</a>
        </div>
<%
                }
            } // end if-else
%>
    </div>
<%
        } // end for
    } catch (Exception e) {
        out.println("Error: " + e.getMessage());
    } finally {
        if (rs != null) rs.close();
        if (stmt != null) stmt.close();
        if (conn != null) conn.close();
    }
%>
</section>
<br>
<script>
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
</script>
