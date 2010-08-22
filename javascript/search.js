;(function($) {
	$(document).ready(function() {
		var inlineLabel = '$InlineLabel';
		$('input.nolabel').each(function() {
			$(this).focus(function() {
				if($(this).val() == inlineLabel) {
					$(this).val('');
					$(this).toggleClass('nonDefaultValue');
				}
			});
			$(this).blur(function() {
				if($(this).val() == '') {
					$(this).val(inlineLabel);
					$(this).toggleClass('nonDefaultValue');
				}
			});
		});
		$('#SearchForm_SearchForm').submit(
			function() {
				if($('#SearchForm_SearchForm_Search').val() == inlineLabel) {
					return false;
				}
			}
		);
	
	});
})(jQuery);