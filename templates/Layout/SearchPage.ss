<div id="ContentArea" class="column grid_6">
	<h1>$Title</h1>
	$Content
	<p id="SearchForm">$SearchForm</p>
	<% if Results %>
		<p class="searchQuery">Din søgning på &quot;{$Query}&quot; gav $Results.totalSize resultater. Viser side $Results.CurrentPage af $Results.TotalPages.</p>
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
					<p>$Content.FirstParagraph</p>
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
			<span id="Prev"><a href="$Results.PrevLink">< Forrige</a></span>
			<% end_if %>
	        <% control Results.Pages %>
	        <% if CurrentBool %>
			<span class="pageNum" id="Current">$PageNum</span>
			<% else %>
			<span class="pageNum"><a href="$Link">$PageNum</a></span>
			<% end_if %>
	        <% end_control %>
			<% if Results.NotLastPage %>
			<span id="Next"><a id="Next" href="$Results.NextLink">Næste ></a></span>
			<% end_if %>
		</div>
	<% end_if %>
</div>


