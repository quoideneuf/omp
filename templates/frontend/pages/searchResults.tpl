{**
 * templates/frontend/pages/searchResults.tpl
 *
 * Copyright (c) 2014-2020 Simon Fraser University
 * Copyright (c) 2003-2020 John Willinsky
 * Distributed under the GNU GPL v3. For full terms see the file docs/COPYING.
 *
 * @brief Display the page to view the catalog.
 *
 * @uses $publishedSubmissions array List of published submissions
 * @uses $searchQuery string The search query, if one was just made
 *}
{include file="frontend/components/header.tpl" pageTitle="common.search"}

<div class="page page_search">

	{* Breadcrumb *}
	{include file="frontend/components/breadcrumbs.tpl" type="category" currentTitleKey="common.search"}
	<h1>{translate key="common.search"}</h1>
	<div class="monograph_count">
		{translate key="catalog.browseTitles" numTitles=$publishedSubmissions|@count}
	</div>

	{* No query - this may happen because of a screen reader, so don't show an
	   error, just leave them with the search form *}
	{if $searchQuery == '' }

	{* No published titles *}
	{elseif !$publishedSubmissions|@count}
		<div class="search_results">
			{translate key="catalog.noTitlesSearch" searchQuery=$searchQuery|escape}
			<a href="#search-form">
				{translate key="search.searchAgain"}
			</a>
		</div>

	{* Monograph List *}
	{else}
		<div class="search_results">
			{if $publishedSubmissions|@count > 1}
				{translate key="catalog.foundTitlesSearch" searchQuery=$searchQuery|escape number=$publishedSubmissions|@count}
			{else}
				{translate key="catalog.foundTitleSearch" searchQuery=$searchQuery|escape}
			{/if}
			<a href="#search-form">
				{translate key="search.searchAgain"}
			</a>
		</div>
		{include file="frontend/components/monographList.tpl" monographs=$publishedSubmissions}
	{/if}

	<a name="search-form"></a>
	{include file="frontend/components/searchForm_simple.tpl"}

</div><!-- .page -->

{include file="frontend/components/footer.tpl"}
