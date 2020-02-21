//fadeout flash messages
const fadeOut = () => {
$('.alert').fadeIn(function() {
    setTimeout(function() {
        $('.alert').fadeOut();
    }, '2000');
});
};

export { fadeOut };
