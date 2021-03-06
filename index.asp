<%
	/* This function will initialize a bunch of access_* ASP variables. */
	LoadAccessInformation();
	/* Those variables are now accessible for ASP code:
	 * - access_free
	 * - access_purchase
	 * - etc... (see documentation for complete list).
	 */

	var ssl = GetHTTPProtocol() == "https";
%>
<?xml version="1.0" encoding="UTF-8" ?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
        "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
	<!--
		*******************************************************************************

		I M P O R T A N T
		- - - - - - - - -

		Do NOT copy and paste this code from a web browser "View Source" Window.

		The actual code contains server-side function calls which do not appear in a
		"View Source" situation.

		Please refer to the supplied templates on the product CD.

		*******************************************************************************
	-->
	<head>
		<meta http-equiv="content-type" content="text/html; charset=utf-8" />
		<meta http-equiv="Expires" content="0" />
		<meta http-equiv="Cache-Control" content="no-cache" />
		<meta http-equiv="Pragma" content="no-cache" />
		<title>Public Access - Login Page</title>
        <link rel="stylesheet" href="signinstyle.css">
        <link rel="icon" href="Logo1.jpg">
        <script src="https://kit.fontawesome.com/a81368914c.js"></script>
	</head>
	<body onload="javascript:setfocus();">
		<!-- Display company logo -->
		<div id="logo">
			<img src="/logo.gif" alt="HP - Company Logo" />
		</div>

		<div id="topAds">
			<!-- Put your ads here -->
			<div class="ads" style="position: relative; top: 10px;"><a href="http://www.hp.com/networking" target="_blank" title="Make it matter."><img src="/onepacific.jpg" alt="Make it matter." /></a></div>
		</div>

		<div id="main">
			<!-- Display error or warning messages -->
			<!-- <div id="message"><% IncludeAsp("login_error_message.asp"); %></div> -->

			<!-- Display login form -->
			<div class="boxed">
				<form action="/goform/HtmlLoginRequest" method="post" id="loginForm" name="loginForm">
					<input type="hidden" name="error_url" value="<% AspCreateHMACPair("/index.asp"); %>" />
					<input type="hidden" name="success_url" value="<% AspCreateHMACPair(GetWebFullURL("http"), "/transport.asp"); %>" />
					<input type="hidden" name="original_url" value="<%AspCreateHMACPair(GetOriginalUrlStr());%>" />
					<input type="hidden" name="subscription_url" value="<% AspCreateHMACPair(GetWebFullURL("https"), "/subscribe.asp"); %>" />
					<input type="hidden" name="valid_fields" value="access_type username password" />
<% ConditionalDisplay(!access_purchase && !access_free, "begin"); %>
					<input type="hidden" id="access_type" name="access_type" value="login" />
<% ConditionalDisplay(!access_purchase && !access_free, "end"); %>


					<table width="100%" border="0"  cellspacing="0" cellpadding="4">
<% ConditionalDisplay(access_purchase, "begin"); %>
						<tr>
							<td><input type="radio" id="access_type" name="access_type" value="subscribe" /></td>
							<td>Subscribe to the service</td>
						</tr>
<% ConditionalDisplay(access_purchase, "end"); %>
<% ConditionalDisplay(access_free, "begin"); %>
						<tr>
							<td><input type="radio" id="access_type" name="access_type" value="free_access" /></td>
							<td>Use Free Access service</td>
						</tr>
<% ConditionalDisplay(access_free, "end"); %>
<% ConditionalDisplay(access_purchase || access_free, "begin"); %>
						<tr>
							<td><input type="radio" id="access_type" name="access_type" value="login" checked="checked"/></td>
							<td>Existing User</td>
						</tr>
<% ConditionalDisplay(access_purchase || access_free, "end"); %>
					</table>
                        <div class="container">
                            <div class="forms-container">
                                <div class="img-banner">
                                    <img src="img1.svg" class="first-image"alt="">
                                </div>
                                <div class="sign-in">
                                    <div class="border-sign">
                                        <img src="logo1.jpg" class="logo" alt="" srcset="">
                                        <h2 class="title">Sign in</h2>
                                            <div class="input-field">
                                                <i class="fas fa-user"></i>
                                                <input type="text" name="username" placeholder="Username / Room No." value="<% write(GetSessionVar("username")); %>"/>
                                            </div>
                                            <div class="input-field">
                                                <i class="fas fa-lock"></i>
                                                <input type="password" name="password" placeholder="Password">
                                            </div>
                                            <input type="submit" name="Login" id="loginButton" value="Proceed" class="btn solid">
                                    </div>
                                </div>
                            </div>
                        </div>
					<hr/>
				</form>
			</div>
<% ConditionalDisplay(!ssl, "begin"); %>
			<div>
				<p><a href="<% write(GetWebFullURL("https")); %>/index.asp">Use the secure version of this form</a></p>
			</div>
<% ConditionalDisplay(!ssl, "end"); %>
		</div>
	</body>
	<script type="text/javascript" language="JavaScript" src="/prototype.js"></script>
	<script type="text/javascript" language="JavaScript" src="/sessionwindow.js"></script>
	<script type="text/javascript" language="JavaScript" src="/setfocus.js"></script>
	<script type="text/javascript" language="JavaScript">
	<!--
		function showsessionpageifnotsubscribe()
		{
			var action = $F('access_type');
			var showSessionPage = false;

			if (typeof(action) == 'string') {
				if ($F('access_type') != 'subscribe') {
					showSessionPage = true;
				}
			} else {
				showSessionPage = true;
			}

			if (showSessionPage) {
				showsessionpage('<% write(GetWebFullURL("http")); %>/session.asp');
			}
		}

		if (navigator.platform != 'iPod' && navigator.platform != 'iPad' && navigator.platform != 'iPhone') {
			document.loginForm.loginButton.onclick = showsessionpageifnotsubscribe;
		}
	//-->
	</script>
</html>
