<cfoutput>

	<cfif len($.content().getValue('youtubeid'))>

		<cfif request.returnFormat NEQ 'AMP'>
				<iframe
					width="100%"
					height="380"
					src="https://www.youtube.com/embed/#$.content().getValue('youtubeid')#?rel=0"
					frameborder="0" allow="autoplay; encrypted-media"
					allowfullscreen>
				</iframe>
			<hr />
			#m.setDynamicContent(m.content().getBody())#

		<cfelse>

		<!--AMP article video -->
		<!--- YouTube ID Extended Attribute --->
		<amp-youtube
			width="480"
			height="270"
			layout=responsive
			data-videoid="#$.content().getValue('youtubeid')#">
		</amp-youtube>

		</cfif>

	</cfif>

</cfoutput>
