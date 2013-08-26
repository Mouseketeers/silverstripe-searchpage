<div class="row typography">
	<div class="eight columns">
		<h1>$Title</h1>
		$Content
		<div class="search-page-form">$SearchForm</div>
		<% if Results %>
		<ul id="search-results">
			<% control Results %>
			<li>
				<a href="$Link"><strong>$Title</strong></a>
				<% if MetaDescription %>
				<p>$MetaDescription</p>
				<% else %>
				<p>$Content.Summary(50)</p>
				<% end_if %>
			</li>
			<% end_control %>
		</ul>
		<% else %>
		<p><strong><% _t('Search.NoResults','Your search gave no results.') %></strong></p>
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
</div>