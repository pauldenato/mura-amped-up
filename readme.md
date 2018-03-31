# Mura Amp'd Up

This is just an example of how to start making your site AMP Compatible.

For this to work:

1) You must be on Mura 7.1.137 or greater

2) Add this to your theme eventhandler.cfc in the onRenderStart();

```
<!--- Allows AMP to work --->
<cfif $.event('amp') eq 1>
	<cfset request.returnFormat='AMP'>
</cfif>
```

3) Place the `/amp_inc` folder in the `theme/templates`

4) In the `html_head.cfm` file place the following just below the feeds.
> *Replace blog and news with the sections of the site you wish to expose to AMP*

```
<!--- MURA AMP --->
<cfif len($.content().getFileName())>
	<cfif listFindNoCase('Blog,News', $.content().getParent().getTitle()) >
		<link rel="amphtml" href="#$.content().getURL(complete='true')#?amp=1" />
	</cfif>
</cfif>
```

5) In the `navbar.cfm` wrap the standard cfml in the folowing ```<cfif>```

```
<cfif request.returnFormat NEQ 'AMP'>
	<!--- Standard Mura Navbar Code --->
	<cfelse>
	<!--- Include AMP Header --->
	<div class="logo">
		<a href="#$.createHREF(filename=$.content('filename'))#">
			<amp-img src="#$.siteConfig('themeAssetPath')#/images/{-- your logo --}" height="50" width="150" alt="Mura AMP'd Up"></a>
	</div>
</cfif>
```

6) Lastly wrap the code in the templates you are using for the sections identified above in the folowing ```<cfif>```
```
<cfif request.returnFormat NEQ 'AMP'>
	<!--- Your template code.  In my case the two_column_SR and the three_column --->
<cfelse>
	<cfinclude template = "amp_inc/page_amp.cfm">
</cfif>
```

7) Once complete you should be able to navigate to a designated amp page with ```?amp=1``` appended to the url and start validaiting your markup.

> **note** for amp-youtube to work you'll need to create a Page/YouTube subtype and put the ```/page_youtube/``` folder into the ```content_types``` directory.

#Resources
- https://www.ampproject.org/
- https://validator.ampproject.org/
- https://ampbyexample.com/playground/
- https://search.google.com/test/amp
- https://search.google.com/structured-data/testing-tool
- https://chrome.google.com/webstore/detail/amp-validator/nmoffdblmcmgeicmolmhobpoocbbmknc?hl=en-US
