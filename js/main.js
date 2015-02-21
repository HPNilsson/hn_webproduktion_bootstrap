$(document).ready(function() {
		pushPopListeners();
		

		$("#admin").click(function() {
			$('.createPageForm').toggle();
		});


  $('li li a').addClass("btn btn-default");
 
  $('article').addClass("box_outline");
  $('p').addClass("col-md-offset-1");


	$("#admin-form form").submit(function() {
		var adminFormData = {
			":title": $(this).find("#page_title").val(),
			":path": $(this).find("#page_url").val(),
			":body": $(this).find("#page_body").val(),
			":iid": $(this).find(".menuSelect2 select :selected").val()
		};
		
			adminFormData.menuData = {
			":title": $(this).find("#menu_title").val(),
			":path": $(this).find("#page_url").val(),
			":plid": $(this).find(".menuSelect select :selected").val()
			};
		

		insertNewPage(adminFormData);

		this.reset();
		return false;
	});

	getMenuImages();

});



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

	function createImageSelect(data){
		var selectImgHtml = $('<select class="form-control"/>');

		var imgSelectTop = $("<option value=''>Select Image</option>");

		imgSelectTop.data("imgData", {iid: null});
		selectImgHtml.append(imgSelectTop);

		for (var i = 0; i < data.length; i++) {
	
				var optionHtml = $('<option value="'+data[i].iid+'">'+data[i].title+'</option>');
				optionHtml.data("imgData", data[i]);

				selectImgHtml.append(optionHtml);
			
		}
		$('form .menuSelect2').html(selectImgHtml);
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
		$('header nav .navbar-collapse .navbar-nav').not(".navbar-right").remove();
		$('header nav .navbar-collapse').prepend(mainMenuHtml);
		//$('header nav .navbar-nav').append(staticMenuItems);

		console.log(mainMenuHtml.children().length);
	}