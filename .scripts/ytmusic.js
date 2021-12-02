for (let i = 0; i < 100; i++){
	var song = document.body.querySelectorAll("#button.dropdown-trigger,style-scope ytmusic-menu-renderer");
	song[2].click()
	await new Promise(r => setTimeout(r, 100));

	var dropdown = document.body.querySelector("ytmusic-menu-popup-renderer");
	let deleteAlbum = dropdown.children[0].children[5]
	if (deleteAlbum == undefined){
		deleteAlbum = dropdown.children[0].children[4]
	}
	deleteAlbum.children[0].click()
	await new Promise(r => setTimeout(r, 100));

	var deleteBtn = document.body.querySelector("yt-button-renderer#confirm-button");
	deleteBtn.click()
	await new Promise(r => setTimeout(r, 100));
}
