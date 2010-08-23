<?php
FulltextSearchable::enable();
Object::add_extension('Page_Controller', 'SearchFormExtension');
SearchFormExtension::$useInlineLabel = true;
?>