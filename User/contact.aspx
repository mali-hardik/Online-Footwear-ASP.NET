<%@ Page Title="" Language="C#" MasterPageFile="~/User/usermaster.master" AutoEventWireup="true" CodeFile="contact.aspx.cs" Inherits="User_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

<!-- banner -->
<div class="page-head">
	<div class="container">
		<h3>Contact</h3>
	</div>
</div>
<!-- //banner -->
<!-- contact -->
	<div class="contact">
		<div class="container">
			<div class="contact-grids">
				<div class="col-md-4 contact-grid text-center animated wow slideInLeft" data-wow-delay=".5s">
					<div class="contact-grid1">
						<i class="glyphicon glyphicon-map-marker" aria-hidden="true"></i>
						<h4>Address</h4>
						<p>12K Street, 45 Building Road <span>New York City.</span></p>
					</div>
				</div>
				<div class="col-md-4 contact-grid text-center animated wow slideInUp" data-wow-delay=".5s">
					<div class="contact-grid2">
						<i class="glyphicon glyphicon-earphone" aria-hidden="true"></i>
						<h4>Call Us</h4>
						<p>+9099400550<span>+8980110331</span></p>
					</div>
				</div>
				<div class="col-md-4 contact-grid text-center animated wow slideInRight" data-wow-delay=".5s">
					<div class="contact-grid3">
						<i class="glyphicon glyphicon-envelope" aria-hidden="true"></i>
						<h4>Email</h4>
						<p><a href="mailto:info@example.com">sam.randeriya121@gmail.com</a><span><a href="mailto:info@example.com">malihardik786@gmail.com</a></span></p>
					</div>
				</div>
				<div class="clearfix"> </div>
			</div>
			<div class="map wow fadeInDown animated" data-wow-delay=".5s">
				<h3 class="tittle">View On Map</h3>
				<iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3721.1829090220203!2d72.77638131493465!3d21.145117985935467!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x3be05274e362b3e3%3A0x672dfe4f512e4d87!2sSDJ+International+College!5e0!3m2!1sen!2sin!4v1552886143370" width="600" height="450" frameborder="0" style="border:0" allowfullscreen></iframe>
			</div>
			
		</div>
	</div>
	
<!-- //contact -->

</asp:Content>

