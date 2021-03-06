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
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>OnePacific Wi-Fi</title>
    <link rel="stylesheet" href="signinstyle.css">
    <link rel="icon" href="Logo1.jpg">
    <script src="https://kit.fontawesome.com/a81368914c.js"></script>

</head>
<body onload="javascript:setfocus();">
   <div id="main">

    <!-- Display error or warning messages -->
	<div id="message"><% IncludeAsp("login_error_message.asp"); %></div>

    <div class="container">
        <div class="forms-container">
            <div class="img-banner">
                <img src="img1.svg" class="first-image"alt="">
            </div>
            <div class="sign-in">
                <div class="border-sign">
                    <form action="/goform/HtmlLoginRequest" method="post" id="loginForm" name="loginForm" class="sign-in-form">
                        <input type="hidden" name="error_url" value="<% AspCreateHMACPair("/index.asp"); %>" />
                        <input type="hidden" name="success_url" value="<% AspCreateHMACPair(GetWebFullURL("http"), "/transport.asp"); %>" />
                        <input type="hidden" name="original_url" value="<%AspCreateHMACPair(GetOriginalUrlStr());%>" />
                        <input type="hidden" name="subscription_url" value="<% AspCreateHMACPair(GetWebFullURL("https"), "/subscribe.asp"); %>" />
                        <input type="hidden" name="valid_fields" value="access_type username password" />
                        
                        
                        <img src="logo1.jpg" class="logo" alt="" srcset="">
                        <h2 class="title">Sign in</h2>
                        <div class="input-field">
                            <i class="fas fa-user"></i>
                            <input type="text" name="username" placeholder="Username / Room No." value="<% write(GetSessionVar("username")); %>">
                        </div>
                        <div class="input-field">
                            <i class="fas fa-lock"></i>
                            <input type="password" placeholder="Password">
                        </div>
                        <input type="submit" name="Login" id="loginButton" value="Proceed" class="btn solid">
                    </form>
                </div>
            </div>
        </div>
    </div>
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