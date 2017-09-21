<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="root" value="${pageContext.request.contextPath}" />

<!-- Start:Footer Section 
==================================================-->
<footer class="footer-section">
	<div class="container">
		<div class="row">
			<!-- Start: About -->
			<div class="col-sm-3 col-xs-12">
				<div class="widget">
					<div class="col-md-12" style="margin-top: 25%;">
						<img style="border-radius: 25px;" class="img-responsive" src="${root}/images/template/lfooter_ogo.jpg" alt="">
					</div>
				</div>
			</div>
			<!-- End: About -->
			<!-- Start: Helpful Link -->
			<div class="col-sm-3 col-xs-12">
				<div class="widget">
					<h5>Helpful Link</h5>
					<ul class="recent-post helpful_post">
						<li>
							<h6>
								<a href="#">Why choose us</a>
							</h6>
						</li>
						<li>
							<h6>
								<a href="#">Our service</a>
							</h6>
						</li>
						<li>
							<h6>
								<a href="#">About us</a>
							</h6>
						</li>
					</ul>
				</div>
			</div>
			<!-- End: Helpful Link -->

			<!-- Start: Latest post -->
			<div class="col-sm-3 col-xs-12">
				<div class="widget">
					<h5>Latest post</h5>
					<ul class="recent-post">
						<li>
							<h6>
								<a href="#">Loren ipsum dolor consectetur elitdo </a>
							</h6>
						</li>
						<li>
							<h6>
								<a href="#">Loren ipsum dolor consectetur elitdo </a>
							</h6>
						</li>
						<li>
							<h6>
								<a href="#">Loren ipsum dolor consectetur elitdo </a>
							</h6>
						</li>
					</ul>
				</div>
			</div>
			<!-- End: Latest post -->
			<!-- Start: CONTACT INFO -->
			<div class="col-sm-3 col-xs-12">
				<div class="widget">
					<h5>CONTACT INFO</h5>
					<!-- Start Subscribe -->
					<div class="box-content">
						<div class="cont_widg">
							<ul class="footer_contact_info">
								<li><i class="icon_phone"></i><span>Call Us 0 (245)
										378-6748</span></li>
								<li><i class="icon_mail"></i><span>info@mail.com</span></li>
								<li><i class="icon_pin"></i><span>California, USA</span></li>
								<li><i class="icon_clock"></i><span>Monday - Friday
										9am - 6 pm</span></li>
							</ul>
						</div>
					</div>
				</div>
			</div>
			<!-- End: CONTACT INFO -->
			<!-- Start:Subfooter -->
			<div class="subfooter">
				<div class="col-xs-10">
					<p>
						<a href="https://www.instagram.com/explore/tags/%EC%99%95%EC%9D%80%EC%8B%A4%EC%BA%98%EB%A6%AC%EA%B7%B8%EB%9D%BC%ED%94%BC"
							target="_blank">
							<img alt="footer-1" src="${root}/images/template/footer-1.jpg">
						</a>
						<img alt="footer-2" src="${root}/images/template/footer-2.jpg">
						<img alt="footer-3" src="${root}/images/template/footer-3.jpg">
						<a href="https://twitter.com/wangwangon?lang=ko" target="_blank">
							<img alt="footer-4" src="${root}/images/template/footer-4.jpg">
						</a>
						<a href="https://ko-kr.facebook.com/ohwangart" target="_blank">
							<img alt="footer-5" src="${root}/images/template/footer-5.jpg">
						</a>
					</p>
				</div>
				<div class="col-xs-2">
					<a class="scrollup" href="#" style="font-size: 24px;">GO TOP</a>
				</div>
			</div>
			<!-- End:Subfooter -->
		</div>
	</div>
</footer>
<!-- End:Footer Section 
========================================-->