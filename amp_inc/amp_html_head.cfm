<!--- fullservername is for article schema --->
<cfset fullservername = $.getBean('utility').getRequestProtocol() & "://" & $.getBean('utility').getRequestHost()>
<cfoutput>

		<head>
			<meta charset="utf-8">
			<script async src="https://cdn.ampproject.org/v0.js"></script>
			<!-- social links -->
			<script async custom-element="amp-social-share" src="https://cdn.ampproject.org/v0/amp-social-share-0.1.js"></script>

			<!--- Only include if there is a vidoe  --  Google gets angry if you load unecessary stuff --->
			<cfif $.content('subType') eq 'youtube'>
				<script async custom-element="amp-youtube" src="https://cdn.ampproject.org/v0/amp-youtube-0.1.js"></script>
			</cfif>
			<!---
				if you needed video or accordion you would include these
				<script async custom-element="amp-accordion" src="https://cdn.ampproject.org/v0/amp-accordion-0.1.js"></script>
			 --->

			<script async custom-element="amp-analytics" src="https://cdn.ampproject.org/v0/amp-analytics-0.1.js"></script>

			<cfif $.content().getIsHome()>
				<title>#$.siteConfig().getTagLine()#</title>
			<cfelse>
				<title>#HTMLEditFormat($.content('HTMLTitle'))# - Mura Amp'd Up</title>
			</cfif>

			<link rel="canonical" href="#$.content().getURL(complete='true')#" />

			<meta name="viewport" content="width=device-width,minimum-scale=1,initial-scale=1">

			<style amp-boilerplate>body{-webkit-animation:-amp-start 8s steps(1,end) 0s 1 normal both;-moz-animation:-amp-start 8s steps(1,end) 0s 1 normal both;-ms-animation:-amp-start 8s steps(1,end) 0s 1 normal both;animation:-amp-start 8s steps(1,end) 0s 1 normal both}@-webkit-keyframes -amp-start{from{visibility:hidden}to{visibility:visible}}@-moz-keyframes -amp-start{from{visibility:hidden}to{visibility:visible}}@-ms-keyframes -amp-start{from{visibility:hidden}to{visibility:visible}}@-o-keyframes -amp-start{from{visibility:hidden}to{visibility:visible}}@keyframes -amp-start{from{visibility:hidden}to{visibility:visible}}</style><noscript><style amp-boilerplate>body{-webkit-animation:none;-moz-animation:none;-ms-animation:none;animation:none}</style></noscript>

			<cfinclude template = "amp_page_styles.cfm">

		</head>
</cfoutput>
