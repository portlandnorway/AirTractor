// Select the btn
// Addeventlistner (click)
// Another querySel.animate (might be Jquery). Try 'scrollTo' in MDN.
const initScroll = () => {
  $('#scroll-btn').on('click', function(e) {
    e.preventDefault();
    $('html, body').animate({ scrollTop: $($(this).attr('href')).offset().top}, 600, 'linear');
  });
};

export { initScroll };
