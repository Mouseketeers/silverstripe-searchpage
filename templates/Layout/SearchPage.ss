<div id="ContentArea" class="column grid_9">
	<h1>$Title</h1>
	$Content
	<p id="SearchForm">$SearchForm</p>
	<% if Results %>
		<p class="searchQuery"><strong>Din søgning på &quot;{$Query}&quot; gav $Results.Count resultater. Viser side $Results.CurrentPage af $Results.TotalPages.</strong></p>
			<ul id="SearchResults">
	 			<% control Results %>
	    		<li>
					<a class="searchResultHeader" href="$Link">
					<% if MenuTitle %>
					$MenuTitle
					<% else %>
					$Title
					<% end_if %>
					</a>
					<% if MetaDescription %>
					$MetaDescription
					<% else %>
					<p>$Content.LimitWordCountXML</p>
					<% end_if %>
	    		</li>
				<% end_control %>
			</ul>
	<% else %>
	<p><strong>Din søgning gav desværre ingen resultater.</strong></p>
	<% end_if %>
	<% if Results.MoreThanOnePage %>
		<div id="Pagination">
			<% if Results.NotFirstPage %>
	        <a id="Prev" href="$Results.PrevLink"><< Forrige</a>
			<% end_if %>
	        <% control Results.Pages %>
	        <% if CurrentBool %>
			<span class="PageNum" id="Current">$PageNum</span>
			<% else %>
			<span class="PageNum"><a href="$Link">$PageNum</a></span>
			<% end_if %>
	        <% end_control %>
			<% if Results.NotLastPage %>
			<a id="Next" href="$Results.NextLink">Næste >></a>
			<% end_if %>
		</div>
	<% end_if %>
</div>


