<div id="ContentArea" class="column grid_12">
<h1>$Title</h1>
$Content
<p id="SearchForm">$SearchForm</p>
<% if Results %>
		<p class="searchQuery"><strong>Your search for &quot;{$Query}&quot; gave $Results.Count results. Showing page $Results.CurrentPage of $Results.TotalPages.</strong></p>
		
<div id="SearchResults">
	<% control Results %>
		<p><a class="searchResultHeader" href="$Link">
			<% if MenuTitle %>
				$MenuTitle
			<% else %>
				$Title
			<% end_if %>
		</a><br />
		$Content.LimitWordCountPlainText</p>
	<% end_control %>
</div>
<% else_if Query %>
	<p id="NoResults"><strong>Your search for &quot;{$Query}&quot; gave no results</strong></p>
<% end_if %>		
<% if Results.MoreThanOnePage %>
<div id="Pagination">
	<% if Results.NotFirstPage %>
	<a id="Prev" href="$Results.PrevLink" title="View the previous page"><< Previous</a>
	<% end_if %>
	<% control Results.Pages %>
	<% if CurrentBool %>
	<span class="PageNum" id="Current">$PageNum</span>
	<% else %>
	<span class="PageNum"><a href="$Link" title="View page number $PageNum">$PageNum</a></span>
	<% end_if %>
	<% end_control %>
	<% if Results.NotLastPage %>
		<a id="Next" href="$Results.NextLink" title="View the next page">Next >></a>
	<% end_if %>
</div>
<% end_if %>
</div>


