$(document).ready(function(){

  // 동영상 팝업
  $(".popupback").hide();
  $(".popup-video").hide();
  $(".popup-video li").hide();
  $(".fs_video > div").click(function(){

    var i = $(this).index();

    $(".popupback").fadeIn();
    $(".popup-video").fadeIn();
    $(".popup-video  li").eq(i).show();
  });

  $(".popupback").click(function(){

    $(".popupback").fadeOut();
    $(".popup-video").fadeOut();
    $(".popup-video li").fadeOut();

  });


    
  // 슬라이드

  var s = 0;
  function slide01(){

    //next
    $(".button1").click(function(){
      if(s>=1){

      s=0;

    }else{

      s++;

    }
    
    $(".fs_video").stop().animate({left: -197 * s},500);
  });

  };

  

  // setInterval(slide01,2000);
  $(document).ready(function(){
    slide01();
});



// main-p slide


 // 슬라이드
 var p = 0;

 function slide02() {
 
   //next
   $(".button2").click(function() {
     if (p >= 24) {
       p = 0;
     } else {
       p++;
     }
     $(".phozip").stop().animate({left: -401 * p}, 500);
   });
 
   //previous
   $(".button3").click(function() {
     if (p <= 0) {
       p = 24;
     } else {
       p--;
     }
     $(".phozip").stop().animate({left: -400.7 * p}, 500);
   });
 };
 
 $(document).ready(function() {
   slide02();
 });
//블러
$(".review-blur").click(function(){

  $(this).fadeOut();

});


});


var p = 0;
var max = 5;

function slide02() {
  // next 1
  $(".right-button").click(function() {
    if (p < max) {
      p++;
    } else {
      $(".posterzip").css({left: 0});
      p = 1;
    }
    $(".posterzip").stop().animate({left: -164 * p}, 100);
  });

  $(".left-button").click(function() {
    if (p === 0) {
      $(".posterzip").css({left: -164 * max});
      p = max-1;
    } else {
      p--;
    }
    $(".posterzip").stop().animate({left: -164 * p}, 100);
  });
}

$(document).ready(function() {
  slide02();
});

$(document).ready(function(){


  $(".popupback1").hide();
  $(".popup-photo").hide();
  $(".popup-photo li").hide();
  $(".phozip div").click(function(){

    var i = $(this).index();

    $(".popupback1").fadeIn();
    $(".popup-photo").fadeIn();
    $(".popup-photo  li").eq(i).show();
  });

  $(".popupback1").click(function(){

    $(".popupback1").hide();
    $(".popup-photo").hide();
    $(".popup-photo li").hide();

  });
});