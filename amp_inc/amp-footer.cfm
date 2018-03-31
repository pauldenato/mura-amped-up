<cfoutput>
	<!--- Get Current Contentbean --->
	<cfset currentContent = $.content() />
	<cfset shareURL = currentContent.getURL(complete='true')>
	<cfset shareTitle = URLEncodedFormat(currentContent.getTitle(),"utf-8")>
	<!--- get site name --->
	<cfset shareSource = URLEncodedFormat($.siteConfig('site'),"utf-8")>

	<footer>
		<div class="bg-light">
			<div class="container">
				<div class="row">
					<div>
						<h4>Contact Info</h4>
						<ul class="list-unstyled">
							<li class="mb-2">
								<i class="fa fa-phone mr-1" aria-hidden="true"></i>
								<a href="tel:1-916-608-8608">+1(916)608-8608 <strong>Local</strong></a>
							</li>
							<li class="mb-2">
								<i class="fa fa-phone mr-1" aria-hidden="true"></i>
								<a href="tel:1-800-466-7525">+1(800)466-7525 <strong>Toll Free</strong></a>
							</li>
							<li class="mb-2">
								<i class="fa fa-envelope mr-1" aria-hidden="true"></i>
								<a href="mailto:info@blueriver.com">info@blueriver.com</a>
							</li>
							<li class="mb-2">
								<i class="fa fa-plug mr-1" aria-hidden="true"></i>
								<a href="http://www.getmura.com">Powered by Mura</a>
							</li>
						</ul>
					</div>

					<div>
						<h4>Follow</h4>

						<!--- AMP Social Markup  --->
						<!--- https://www.ampproject.org/docs/reference/components/amp-social-share :: Info: Amp Social Share --->
						<!--- https://ampbyexample.com/components/amp-social-share/ :: Example: Amp Social Share --->
						<!---
									data-param-text is the text to include in the share.
									data-param-url is the URL to share, current URL by default.
									data-param-attribution is where the share is attributed to.
						 --->
						 <amp-social-share type="email"></amp-social-share>
					   <amp-social-share type="facebook" data-param-app_id="{app id}" data-param-url="#shareURL#"></amp-social-share>
					   <amp-social-share type="gplus" data-param-text="#shareTitle#" data-param-url="#shareURL#"></amp-social-share>
					   <amp-social-share type="linkedin" data-param-text="#shareTitle#" data-param-url="#shareURL#" data-param-attribution="#shareSource#"></amp-social-share>
					   <amp-social-share type="pinterest" data-param-media="https://ampbyexample.com/img/amp.jpg"></amp-social-share>
					   <amp-social-share type="tumblr" data-param-text="#shareTitle#" data-param-url="#shareURL#"></amp-social-share>
					   <amp-social-share type="twitter" data-param-text="#shareTitle#" data-param-url="#shareURL#"></amp-social-share>
					   <amp-social-share type="whatsapp" data-param-text="#shareTitle#" data-param-url="#shareURL#"></amp-social-share>
					</div>

				</div>
			</div>
		</div>

		<div class="py-2 bg-secondary text-light">
			<div class="container">
				<p class="mb-0">&copy; #esapiEncode('html', $.siteConfig('site'))# #year(now())#</p>
			</div>
		</div>
	</footer>

</cfoutput>
