function run () {
	const searchForm = document.querySelector('.js-tweet-search');
	if (!searchForm) {
		return;
	}

	searchForm.addEventListener("submit", function(e) {
		e.preventDefault();
		const urlInput = searchForm.querySelector('input[type="url"]') as HTMLInputElement;
		if (!urlInput || !urlInput.value) {
			return;
		}

		var tweetIdMatch = urlInput.value.match(/\/(\d+)/);
		if (!tweetIdMatch) {
			return;
		}

		document.location.href = `/${tweetIdMatch[1]}/`;
	}, false);

	searchForm.classList.add('is-enabled');
}

run();
