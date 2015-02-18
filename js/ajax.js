

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

function createSelect(data){
	var selectHtml = $('<select class="form-control"/>');
	var topOptionHtml = $('<option value="">Top</option>');
			selectHtml.append(topOptionHtml);

	for (var i = 0; i < data.length; i++) {
		if (data[i].plid === null) {
			var optionHtml = $('<option value="'+data[i].mlid+'">'+data[i].title+'</option>');
			selectHtml.append(optionHtml);
		}
	}
	$('.menuSelect').html(selectHtml);
}

var staticMenuItems;
function createMainMenu(data) {
	var mainMenuHtml = $('<ul class="nav navbar-nav"/>');

	while (data.length > 0) {
		var linkItem = data[0];
		var parentId = linkItem.plid;
		var htmlParent = mainMenuHtml.find('[data-mlid="'+parentId+'"]');
		if (parentId && htmlParent.length === 0) {
			data.push(data.shift());
			continue;
		}
		else {
			if (!parentId) {
				mainMenuHtml.append('<li data-mlid="'+linkItem.mlid+'"><a href="'+linkItem.path+'">'+linkItem.title+'</a></li>');
			}
			else {
				if (htmlParent.children('ul').length === 0) {
					htmlParent.addClass('dropdown');
					htmlParent.append('<ul class="dropdown-menu"/>');
				}
				mainMenuHtml.find('[data-mlid="'+parentId+'"] > ul').append('<li data-mlid="'+linkItem.mlid+'"><a href="'+linkItem.path+'">'+linkItem.title+'</a></li>');
			}
			data.shift();
		}
	}

	if(!staticMenuItems){staticMenuItems = $('header nav .navbar-nav').children('li');}
	$('header nav .navbar-nav').remove();
	$('header nav').append(mainMenuHtml);
	$('header nav .navbar-nav').append(staticMenuItems);

	console.log(mainMenuHtml.children().length);
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
			$("section#page").append('<article class="pageMaterial"></article>');
			$('section#page').show();
			$('.pageMaterial').append('<h3>'+data[0]['title']+'</h3>'+'<p>'+data[0]['body']+'</p>'+'<h4>'+data[0]['author']+'</h4>'+'<time>Created '+data[0]['created']+'</time>');
			

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

function getMenuLinks(whichMenu) {
	$.ajax({
		url: "php/get_menulinks.php",
		type: "post",
		dataType: "json",
		success: function(data) {
			console.log("getting menu links! Yay! ", data);
			if (whichMenu == "select") {
				createSelect(data);
			}
			else {
				createMainMenu(data);
			}
		},
		error: function(data) {
			console.log("error getting menu links... darn ", data.responseText);
		}
	});
}



