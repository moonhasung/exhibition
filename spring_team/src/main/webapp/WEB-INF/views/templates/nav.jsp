<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="root" value="${pageContext.request.contextPath}" />
<!-- Start: header navigation -->

<script type="text/javascript">
$(document).ready(function() {
	
	$(".menu").children('a').removeClass('active'); // 메뉴 효과 지우는 구문 
});
</script>

<div class="navigation navigation_two">
	<div class="container">
		<div class="row">
			<div class="header_logo">
				<a href="${root}/"><img src="${root}/images/main/logo.jpg" alt=""></a>
			</div>
			<div id="navigation">
				<ul>
					<li class="has-sub menu">
						<a class="active" href="#" title="Introduce">
							INTRODUCE
						</a>
						<ul>
							<li><a href="${root}/index.html" title="회사 소개">회사 소개</a></li>
							<li><a href="${root}/index-two.html" title="작가 소개">작가 소개</a></li>							
						</ul>
					</li>					
					<li class="has-sub menu">
						<a href="#" title="Project">
							PROJECT
						</a>
						<ul>
							<li><a href="${root}/blog.html" title="포트폴리오">포트폴리오</a></li>
							<li><a href="${root}/blog-two.html" title="의뢰">의뢰</a></li>							
						</ul>
					</li>
					<li class="has-sub menu">
						<a href="#" title="Academy">
							ACADEMY
						</a>
						<ul>
							<li><a href="${root}/blog.html" title="수강생 작품">수강생 작품</a></li>
							<li><a href="${root}/blog-two.html" title="수업공지">수업공지</a></li>							
						</ul>
					</li>
					<li class="has-sub menu">
						<a href="#" title="Exhibit">
							EXHIBIT
						</a>
						<ul>
							<li><a href="${root}/blog.html" title="작품">작품</a></li>
							<li><a href="${root}/blog-two.html" title="진행 전시">진행 전시</a></li>
							<li><a href="${root}/blog-three.html" title="이전 전시">이전 전시</a></li>							
						</ul>
					</li>
					<li class="menu">
						<a href="${root}/about.html" title="Artshop">
							Artshop
						</a>
					</li>
				</ul>
			</div>
			<%-- <div class="header-right">
				<ul>
					<li>
						<!-- Search Bar -->
						<div class="search-option float-right">
							<button class="search tran3s dropdown-toggle" id="searchDropdown"
								data-toggle="dropdown" aria-haspopup="true"
								aria-expanded="false">
								<i class="fa fa-search" aria-hidden="true"></i>
							</button>
							<form action="#" class="p-color-bg dropdown-menu tran3s"
								aria-labelledby="searchDropdown">
								<input type="text" placeholder="Search....">
								<button class="p-color-bg">
									<i class="fa fa-search" aria-hidden="true"></i>
								</button>
							</form>
						</div> <!-- /.search-option -->
					</li>
					<li class="header-cart"><a href="#"> <span><i
								class="fa fa-shopping-cart"></i></span> <span class="cart-inner">4</span>
					</a>
						<div class="headr_btom_cart">
							<ul>
								<li class="single-cart">
									<div class="cartt_img">
										<a href="#"> <img src="images/cart1.jpg" alt="">
										</a>
									</div>
									<div class="cart-content">
										<a href="#" class="cart-title">Product One</a>
										<p class="qty">
											Qty: 5 <br>
											<span>$453.00</span>
										</p>
									</div>
									<div class="cart-remove">
										<a href="#" class="action"><i class="fa fa-close"></i></a>
									</div>
								</li>
								<li class="single-cart">
									<div class="cartt_img">
										<a href="#"> <img src="images/cart2.jpg" alt="">
										</a>
									</div>
									<div class="cart-content">
										<a href="#" class="cart-title">Product Two</a>
										<p class="qty">
											Qty: 2 <br>
											<span>$245.00</span>
										</p>
									</div>
									<div class="cart-remove">
										<a href="#" class="action"><i class="fa fa-close"></i></a>
									</div>
								</li>
							</ul>
							<div class="cart-pricing">
								<p class="shipping">
									shipping :<span class="s-price">$10.00</span>
								</p>
								<p class="total">
									total :<span class="p-total">$358.00</span>
								</p>
							</div>
							<div class="cart-button">
								<ul>
									<li><a href="#">View cart <i class="fa fa-angle-right"></i></a>
									</li>
									<li><a href="#">Checkout <i class="fa fa-angle-right"></i></a>
									</li>
								</ul>
							</div>
						</div></li>
					<li class="language-cart"><a href="#"
						class="setting-toggler shop_setting" id="srch"> <i
							class="fa fa-cog"></i>
					</a>
						<div class="shop_setting_inr">
							<ul>
								<li>
									<form action="#" method="POST">
										<div class="current">
											<a href="#">Currency : USD</a>
										</div>
										<ul class="first-step">
											<li><a href="#">Dollar(USD)</a></li>
											<li><a href="#"> Pound (GBP) </a></li>
										</ul>
									</form>
								</li>
								<li>
									<form action="#" method="POST">
										<div class="current">
											<a href="#">English</a>
										</div>
										<ul class="first-step">
											<li><a href="#">English</a></li>
											<li><a href="#">اللغة العربية</a></li>
										</ul>
									</form>
								</li>
								<li>
									<form action="#" method="POST">
										<div class="current">
											<a href="#">My Account</a>
										</div>
										<ul class="first-step">
											<li><a href="#">My Account</a></li>
											<li><a href="#">My Wishlist</a></li>
											<li><a href="#">My checkout</a></li>
											<li><a href="#">Login</a></li>
										</ul>
									</form>
								</li>
							</ul>
						</div></li>
				</ul>
			</div>
			<!-- End: social-nav --> --%>
		</div>
		<!--/ row -->
	</div>
	<!--/ container -->
</div>
<!-- End: header navigation -->
