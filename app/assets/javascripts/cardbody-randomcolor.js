// randomColor comes from https://github.com/davidmerfield/randomColor
// see: https://randomcolor.lllllllllllllllll.com/ for further customization

  var divCardBody = $('.sortable-card');// set card-body to a variable
  console.log(divCardBody);

    divCardBody.each(function(){
      $(this).css("background-color", randomColor({hue: 'blue', luminosity: 'light'}));
    });//end each
