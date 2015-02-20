

function insertNewPage(adminFormData) {
	$.ajax({
		url: "php/save_content.php",
		type: "post",
		dataType: "json",
		data: {
			"page_data" : adminFormData
		},
		success: function(data) {
			// goTo("content-list");
			console.log("insertNewPage in db WORKS!");
		},
		error: function(data) {
			console.log("insertNewPage error: ", data);
		}
	});
}



function getPageFromUrl(pageUrl) {
	if(!pageUrl){return;}
	$.ajax({
		url: "php/get_content.php",
		type: "get",
		dataType: "json",
		data: {
			"path" : {":path": pageUrl}
		},
		success: function(data) {
			console.log("Getting page from url yeah! You go url page thing! ", data);
			$("section#page").html('');
			$("section#page").append('<article class="pageMaterial col-sm-10 col-sm-offset-2 "></article>');
			$('section#page').show();
			$('.pageMaterial').append('<h3 class="text-center">'+data[0]['title']+'</h3>'+'<div><p class="text-center">'+data[0]['body']+'</p></div>'+'<h4>'+data[0]['author']+'</h4>'+'<time>Created '+data[0]['created']+'</time>');
			

			// $.each(pageUrl, );
			//	$("section#page").append();

			
			// loopa ut console loggen på skärmen. Title = <h3> auth: <p> body: <p> etc etc
			// Skapa all html här: 

		},
		error: function(data) {
			console.log("error getting page from url.. damn ", data.responseText);
		}
	});
}


function getMenuImages(whichMenuImage) {
$.ajax({
		url: "php/get_menuimages.php",
		dataType: "json",
		success: function(data) {
			console.log("getting menu images! Yay! ", data);
				createImageSelect(data);
		},
		error: function(data) {
			console.log("error getting menu images... dammit ", data.responseText);
		}
	});
}

function getMenuLinks(whichMenu) {
	$.ajax({
		url: "php/get_menulinks.php",
		type: "post",
		dataType: "json",
		success: function(data) {
			console.log("getting menu links! Yay! ", data);
				createSelect(data);
				createMainMenu(data);
		},
		error: function(data) {
			console.log("error getting menu links... darn ", data.responseText);
		}
	});
}



