<?php 
class SearchFormExtension extends Extension {
	static $useInlineLabel = true;
	function SearchForm() {
		$inlineLabel = (self::$useInlineLabel) ? _t('Search.INLINELABEL', 'Enter search') : '';
		Requirements::javascript('thirdparty/jquery/jquery.js');
		Requirements::javascriptTemplate('search/javascript/search.js', array('InlineLabel' => $inlineLabel));
		$searchText = isset($_REQUEST['Search']) ? $_REQUEST['Search'] : '';
		$searcFieldValue = $searchText ? $searchText : $inlineLabel;
		$searchField = new TextField('Search', '', $searcFieldValue);
		$searchField->addExtraClass('InlineLabel');
		$fields = new FieldSet (
			$searchField
		);
		$actions = new FieldSet(
			new FormAction('Results', _t('SearchForm.SEARCH', 'Search'))
		);
		$SearchForm = new SearchForm($this, 'SearchForm', $fields, $actions);
		$SearchForm->setFormAction('search/SearchForm');
		$SearchForm->classesToSearch  = array('SiteTree');
		$SearchForm->getValidator()->setJavascriptValidationHandler('none');
		return $SearchForm;
	}
}
?>