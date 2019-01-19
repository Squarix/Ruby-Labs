document.addEventListener('turbolinks:load', function() {
	
	$input = $('#query');
	var options = {
		getValue: 'name',
		url: function(phrase) {
			return '/autocomplete.json?query=' + phrase;
		},
		categories: [
			{
				listLocation: 'posts',
				header: '<strong>posts</strong>'
			},
			{
				listLocation: 'users',
				header: '<strong>users</strong>'
			}
		],
		list: {
			onChooseEvent: function() {
				var url = $input.getSelectedItemData().url;
				console.log(url);
			}
		}
	}

	$input.easyAutocomplete(options);
});