;(function($) {
	$(document).ready(function() {
		var inlineLabel = '$InlineLabel';
		$('input.nolabel').each(function() {
			if($(this).val() != inlineLabel) $(this).addClass('nonDefaultValue');
			$(this).focus(function() {
				if($(this).val() == inlineLabel) {
					$(this).val('');
					$(this).addClass('nonDefaultValue');
				}
			});
			$(this).blur(function() {
				if($(this).val() == '') {
					$(this).val(inlineLabel);
					$(this).removeClass('nonDefaultValue');
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