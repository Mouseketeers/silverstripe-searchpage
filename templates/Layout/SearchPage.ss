<div id="ContentArea" class="eight columns push-two">
	<h1>$Title</h1>
	$Content
	<p id="SearchForm">$SearchForm</p>
	<% if Results %>
		<p class="searchQuery">Din søgning på &quot;{$Query}&quot; gav $Results.totalSize resultater. Viser side $Results.CurrentPage af $Results.TotalPages.</p>
			<ul id="SearchResults">
				<% control Results %>
				<li>
					<a class="searchResultHeader" href="$Link">
					$Title
					</a>
					<% if MetaDescription %>
					$MetaDescription
					<% else %>
					<p>$Content.Summary(50)</p>
					<% end_if %>
				</li>
				<% end_control %>
			</ul>
	<% else %>
	<p><strong>Din søgning gav desværre ingen resultater.</strong></p>
	<% end_if %>
	<% if Results.MoreThanOnePage %>
		<ul class="pagination hide-on-print">
			<% if Results.NotFirstPage %>
			<li><a href="$Results.PrevLink"><</a></li>
			<% end_if %>
			<% control Results.Pages %>
			<% if CurrentBool %>
			<li class="current"><a href="$Link">$PageNum</a></li>
			<% else %>
			<li><a href="$Link">$PageNum</a></li>
			<% end_if %>
			<% end_control %>
			<% if Results.NotLastPage %>
			<li><a href="$Results.NextLink">></a></li>
			<% end_if %>
		</ul>
	<% end_if %>
</div>