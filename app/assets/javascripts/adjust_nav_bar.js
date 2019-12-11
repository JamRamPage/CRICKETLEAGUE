//Highlights the appropriate page in the nav bar based
//on which page is currently open:
$(document).on('turbolinks:load', function() {
  var currentPage = window.location.pathname
  if (currentPage == "/home") {
    $("a#home").addClass("active")
    $("a#matches").removeClass("active")
    $("a#table").removeClass("active")
    $("a#batters").removeClass("active")
    $("a#bowlers").removeClass("active")
    $("a#contact").removeClass("active")
  }else if (currentPage == "/matches") {
    $("a#home").removeClass("active")
    $("a#matches").addClass("active")
    $("a#table").removeClass("active")
    $("a#batters").removeClass("active")
    $("a#bowlers").removeClass("active")
    $("a#contact").removeClass("active")
  }else if (currentPage == "/table") {
    $("a#home").removeClass("active")
    $("a#matches").removeClass("active")
    $("a#table").addClass("active")
    $("a#batters").removeClass("active")
    $("a#bowlers").removeClass("active")
    $("a#contact").removeClass("active")
  }else if (currentPage == "/batters") {
    $("a#home").removeClass("active")
    $("a#matches").removeClass("active")
    $("a#table").removeClass("active")
    $("a#batters").addClass("active")
    $("a#bowlers").removeClass("active")
    $("a#contact").removeClass("active")
  }else if (currentPage == "/bowlers") {
    $("a#home").removeClass("active")
    $("a#matches").removeClass("active")
    $("a#table").removeClass("active")
    $("a#batters").removeClass("active")
    $("a#bowlers").addClass("active")
    $("a#contact").removeClass("active")
  }else if (currentPage == "/contact") {
    $("a#home").removeClass("active")
    $("a#matches").removeClass("active")
    $("a#table").removeClass("active")
    $("a#batters").removeClass("active")
    $("a#bowlers").removeClass("active")
    $("a#contact").addClass("active")
  }else {
    $("a#home").removeClass("active")
    $("a#matches").removeClass("active")
    $("a#table").removeClass("active")
    $("a#batters").removeClass("active")
    $("a#bowlers").removeClass("active")
    $("a#contact").removeClass("active")
  }
});
