<?php
class SearchPage extends Page {
	static $db = array(
	);
	static $defaults = array(
   		'ProvideComments' => false,
		'ShowInMenus' => false
	);
	static $has_one = array(
	);

}
class SearchPage_Controller extends Page_Controller {
	function Results($data = null, $form = null){
		if ($data && $form) {
			$data = array(
				'Results' => $form->getResults(),
				'Query' => $form->getSearchQuery()
			);
			return $data;
		}
	}
	function SearchForm() {
		$searchText = isset($_REQUEST['Search']) ? $_REQUEST['Search'] : ''; 

		$fields = new FieldSet (
			new TextField('Search', '', $searchText)
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
class SeachPageControllerExtension extends DataObjectDecorator {
	function SearchForm() {
		return SearchPage_Controller::SearchForm();
	}
}
DataObject::add_extension('Page', 'SeachPageControllerExtension');
?>