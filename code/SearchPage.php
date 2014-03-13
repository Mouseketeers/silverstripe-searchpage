<?php
class SearchPage extends SiteTree {
	static $db = array(
	);
	static $defaults = array(
   		'ProvideComments' => false,
		'ShowInMenus' => false,
		'ShowInSearch' => false
	);
	public static $default_results_sort = 'Relevance';
	public static $default_results_sort_direction = '';

	function requireDefaultRecords() {
		parent::requireDefaultRecords();
		if(!DataObject::get_one('SearchPage')) {
			$searchPage = new SearchPage();
			$searchPage->Title = 'Search results';
			$searchPage->URLSegment = 'search';
			$searchPage->Status = 'Published';
			$searchPage->ShowInMenus = 0;
			$searchPage->ShowInSearch = 0;
			$searchPage->write();
			$searchPage->publish("Stage", "Live");	
		}
	}
	// public function canCreate($member = null){
	//    $rights = parent::canCreate($member);
	//    if($rights == false)
	//       return false;
	//    //allow SearchPage to be created only once   
	//    $dobj = DataObject::get('SearchPage');
	//    if(!$dobj)
	//       return true;
	      
	//    return $dobj->Count() == 0;
	// }
	function getCMSFields() {
		$fields = parent::getCMSFields();
		$fields->removeFieldFromTab('Root.Content.Metadata','URL');
		return $fields;
	}
	function setDefaultResultsSort($sort) {
		self::$default_results_sort = $sort;
	}
	function setDefaultResultsSortDirection($direction) {
		self::$default_results_sort_direction = $direction;
	}
	function getDefaultResultsSort() {
		return self::$default_results_sort;
	}
	function getDefaultResultsSortDirection() {
		return self::$default_results_sort_direction;
	}
}

class SearchPage_Controller extends Page_Controller {
	function Results($data = null, $form = null){
		if ($data && $form) {
			$data = array(
				'Results' => $form->getResults(),
				'Query' => $form->getSearchQuery()
			);
			$default_results_sort = $this->getDefaultResultsSort();
			$default_results_sort_direction = $this->getDefaultResultsSortDirection();
			if($default_results_sort != 'Relevance') {
				$data['Results']->sort($default_results_sort, $default_results_sort_direction);				
			}
			return $data;
		}
	}
	function SearchForm() {
		return SearchFormExtension::SearchForm();
	}
}
ContentController::$allowed_actions = array('SearchForm');