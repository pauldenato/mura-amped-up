<cfoutput>
	<!DOCTYPE html>
	<html amp="amp" lang="en">
		<cfinclude template="amp_html_head.cfm"/>
		<!--- include article schema --->
		<cfscript>
			$.addToHTMLHeadQueue('#$.siteConfig('themeAssetPath')#/templates/amp_inc/schema--amp.cfm');
		</cfscript>
		<body>
			<!--- site header --->
			<cfinclude template="../inc/navbar.cfm"/>
			<div class="template py-5">
				<div class="container">
					<!--- Link to Full Article --->
					<div class="article-full">
						<a href="#$.content().getURL(complete='true')#" class="btn btn-primary center-block">View Full Article</a>
					</div>
					<div class="row">
						<section class="content col-lg-12 col-md-12 col-sm-12 col-xs-12">
							<h1>
								#$.content('title')#
							</h1>

							<cfif $.content('subType') eq "youtube">
								<cfinclude template='#$.siteConfig('themeAssetPath')#/content_types/page_youtube/index.cfm'>
							<cfelse>
							<!--- Primary Associated Image --->
							<cfif $.content().hasImage(usePlaceholder=false)>
								<cfscript>
									img = $.content().getImageURL(complete=true);
								</cfscript>
								<!--- make image call to get height and width --->
								<cfimage source="#img#" action="info" structName="metaImageInfo">
								<div class="post-featured-img">
									<amp-img src="#img#" alt="" height="#(metaImageInfo.height \ 2)#" width="#(metaImageInfo.width \ 2)#" layout="responsive"></amp-img>
								</div>
							</cfif>
							</cfif>
							<!--- /Primary Associated Image --->

							<!--- BODY --->
							<!--- #m.setDynamicContent(m.content().getBody())# --->

							<!--- Prepare to remove images from body --->
							<cfset bodyWithImages=m.setDynamicContent(m.content().getBody())>
							<!--- create an array of images in the body --->
							<cfset regexpimg=reMatch('<img[^>]+src=(['&'""])([^'&'""]+)\1[^>]*>', bodyWithImages )/>

							<!--- loop array and identify any images --->
							<cfloop array="#regexpimg#" index="i">
								<!--- create blank list for amp image creation --->
								<cfset ampimage=''>

								<!--- create an array of src in the body from the image regex --->
								<cfset regexpsrc=reMatch('src\s*=\s*[''\"]([^''\"]*?)[''\"][^>]*?', i )/>
								<!--- loop the src files --->

								<cfloop array="#regexpsrc#" index="s">
									<!--- create url for image check based on src regex--->
									<cfset imageURL=reReplaceNoCase(s, 'src="', '')>
									<cfset imageURL=reReplaceNoCase(imageURL, '"', '')>
									<!--- Check if the result is an image --->
									<cfif isImageFile(imageURL)>
										<!--- set blank values for height and width --->
										<cfset actualImageInfo.height=''>
										<cfset actualImageInfo.width=''>
										<!--- make image call to get height and width --->
										<cfimage source="#imageURL#" action="info" structName="actualImageInfo">
										<!--- <amp-img src="welcome.jpg" alt="Welcome" height="400" width="800"></amp-img> --->
										<!--- build our amp image tag with the existing src --->
										<cfset ampimage='<amp-img '>
										<cfset ampimage=ListAppend(ampimage, s, ' ')>
										<!--- setitting height and width from the above image check --->
										<cfset ampimage=ListAppend(ampimage, 'alt="" height="#(actualImageInfo.height \ 2)#" width="#(actualImageInfo.width \ 2)#" layout="responsive"></amp-img>', ' ')>
									</cfif>
									<!--- replace the original img tag with the new amp-img tag --->
									<cfset bodyWithImages=replacenocase(bodyWithImages, "#i#",'#ampimage#','ALL')/>

								</cfloop>

							</cfloop>

							<!---
							Original call for body - not sure it needs to be editiable any longer
							#m.renderEditableAttribute(attribute='body', type='htmlEditor')#
						--->

							<!--- Display updated image content --->
							#bodyWithImages#

					</section>
				</div>
				<!--- Link to Full Article --->
				<div class="article-full">
					<a href="#$.content().getURL(complete='true')#" class="btn btn-primary center-block">View Full Article</a>
				</div>
			</div>
			<!-- /.container -->
		</div>
				<cfinclude template="amp-footer.cfm" />
	</body>
</html>
</cfoutput>
