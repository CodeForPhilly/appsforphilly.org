<script>
$(window).load(function() {
 // fix sub nav on scroll
 var $win = $(window)
 , $nav = $('.navbar')
 , $nC = $('#navCont')
 , navTop = $('.navbar').length && $('.navbar').offset().top + 20
 , isFixed = 0
 
 $nav.addClass('auto-size');
 
processScroll()
 
 $nC.addClass('auto-size')
 $win.on('scroll', processScroll)
 
function processScroll() {
 var i, scrollTop = $win.scrollTop()
 if (scrollTop >= navTop && !isFixed) {
 isFixed = 1
 $nC.removeClass('auto-size')
 $nav.addClass('navbar-fixed-top');
 } else if (scrollTop <= navTop && isFixed) {
 isFixed = 0
 $nC.addClass('auto-size')
 $nav.removeClass('navbar-fixed-top');
 }
 }
});
 
<!-- Put this in your stylesheet -->
<pre>
</script>