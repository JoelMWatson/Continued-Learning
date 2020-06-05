$(document).ready(function () {
    
    // Waypoints
    var sticky_nav = new Waypoint({
        element: document.getElementById("waypoint"),
        handler: function(direction) {
            if (direction == "down") {
                $("nav").addClass("sticky");
                $(".js--scroll-to-top").show();
            } else {
                $("nav").removeClass("sticky");
                $(".js--scroll-to-top").hide();

            }
        },
        offset: "75%"
    });
    
    // scrolling with buttons
    $(".js--scroll-to-features").click(function (e) {
        e.stopPropagation();
        $("html, body").animate({scrollTop: $(".js--section-features").offset().top}, 1000); 
    });
    $(".js--scroll-to-process").click(function (e) {
        e.stopPropagation();
        $("html, body").animate({scrollTop: $(".js--section-process").offset().top}, 1000); 
    });
    $(".js--scroll-to-locations").click(function (e) {
        e.stopPropagation();
        $("html, body").animate({scrollTop: $(".js--section-locations").offset().top}, 1000); 
    });
    $(".js--scroll-to-plans").click(function (e) {
        e.stopPropagation();
        $("html, body").animate({scrollTop: $(".js--section-plans").offset().top}, 1000); 
    });
    
    // back to top
    $(".js--scroll-to-top").click(function (e) {
        e.stopPropagation();
        $("html, body").animate({scrollTop: 0}, 1000); 
    });
    
    // hamburger nav
    $(".js--hamburger-nav").click(function() {
        var nav = $(".js--main-nav");
        var icon = $(".js--hamburger-nav i");
        
        nav.slideToggle(200);
        if (icon.hasClass("ion-navicon-round")) {
            icon.addClass("ion-close-round");
            icon.removeClass("ion-navicon-round");
        } else {
            icon.addClass("ion-navicon-round");
            icon.removeClass("ion-close-round");
        }
        
    });
    
});