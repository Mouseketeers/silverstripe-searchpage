<?php
class SearchPage extends SiteTree {
	static $db = array(
	);
	static $defaults = array(
   		'ProvideComments' => false,
		'ShowInMenus' => false
	);
	
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
			Database::alteration_message('Search page created','created');
		}
	}
	public function canCreate($member = null){
	   $rights = parent::canCreate($member);
	   if($rights == false)
	      return false;
	   //allow SearchPage to be created only once   
	   $dobj = DataObject::get('SearchPage');
	   if(!$dobj)
	      return true;
	      
	   return $dobj->Count() == 0;
	}
	function getCMSFields() {
		$fields = parent::getCMSFields();
		$fields->removeFieldFromTab('Root.Content.Metadata','URL');
		return $fields;
	}
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
		return SearchFormExtension::SearchForm();
		//return new CustomSearch($this, "SearchForm", $fields, $actions);
	}
}
ContentController::$allowed_actions = array('SearchForm');