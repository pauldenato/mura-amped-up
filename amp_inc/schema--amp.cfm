<!--- fullservername is for article schema --->
<cfset fullservername = $.getBean('utility').getRequestProtocol() & "://" & $.getBean('utility').getRequestHost()>
		<cfscript>
			img1x1 = $.content().getImageURL(size = 'amp-1x1',complete = true)
			img4x3 = $.content().getImageURL(size = 'amp-4x3',complete = true)
			img16x9 = $.content().getImageURL(size = 'amp-16x9',complete = true)
		</cfscript>
<cfoutput>

	<cfset videoURL = "">
	<cfset schemaType = "NewsArticle" />
	<!--- youtube subtype required --->
	<cfif $.content('subType') eq 'youtube'>
			<cfset videoURL = "https://www.youtube.com/watch?v="&$.content('youtubeid') />
			<cfset schemaType = "VideoObject" />
	</cfif>

	<!--- set video URL if video ---->
<cfif schemaType eq "NewsArticle">
	<!--- schema / newsarticle --->
	<script type="application/ld+json">
		{
			"@context": "http://schema.org",
			"@type": "#schemaType#",
			"image": [
				"#img1x1#",
				"#img4x3#",
				"#img16x9#"
			],
			"headline": "#$.content('HTMLTitle')#",
			"description": "#$.content('metaDesc')#",
			"datePublished": "#dateFormat($.content().getValue('releaseDate'),'yyyy-mm-dd')#T#timeFormat($.content().getValue('releaseDate'),'HH:mm:ss')#Z",
			"publisher": {
				"@type": "Organization",
				"name": "#jsStringFormat($.siteConfig('site'))#",
				"url": "#$.createHREF(filename='',complete='true')#",
				"logo": {
					"@type": "imageObject",
					"url": "#fullservername##$.siteConfig('themeAssetPath')#/images/amp-logo-blue.png"
				}
			},
			"mainEntityOfPage": "#$.content().getURL(complete='true')#",
			"dateModified": "#dateFormat($.content().getValue('lastUpdate'),'yyyy-mm-dd')#T#timeFormat($.content().getValue('lastUpdate'),'HH:mm:ss')#Z",
			"articleBody": "#ReplaceNoCase($.setDynamicContent($.content('body')), '"', "'" ,"all")#",
			"author":
				{
					"@type": "Person",
					"name": "#$.content().getlastUpdateBy()#"
				},
			"video": "#videoURL#"
		}
	</script>
	<cfelse>
		<!--- schema / video --->
		<script type="application/ld+json">
			{
			  "@context": "http://schema.org",
			  "@type": "#schemaType#",
			  "name": "#$.content('HTMLTitle')#",
			  "description": "#$.content('metaDesc')#",
			  "thumbnailUrl": "#$.content().getImageURL(size='amp-16x9',complete='true')#",
			  "uploadDate": "#dateFormat($.content().getValue('created'),'yyyy-mm-dd')#T#timeFormat($.content().getValue('created'),'HH:mm:ss')#Z",
				"publisher": {
					"@type": "Organization",
					"name": "#jsStringFormat($.siteConfig('site'))#",
					"url": "#$.createHREF(filename='',complete='true')#",
					"logo": {
						"@type": "imageObject",
						"url": "#fullservername##$.siteConfig('themeAssetPath')#/images/amp-logo-blue.png"
					}
			  },
			  "contentUrl": "#videoURL#",
			  "embedUrl": "#videoURL#"
			}
		</script>
	</cfif>
</cfoutput>
