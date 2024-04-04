document.addEventListener('scroll', () => {
    const header = document.querySelector('header');

    if (window.scrollY > 0) {
        header.classList.add('scrolled');
    }
    else {
        header.classList.remove('scrolled')
    }
})

const scrollLinks = document.querySelectorAll('.scroll-link');
const navBar = document.querySelector('.navbar');

scrollLinks.forEach(function (link) {
    link.addEventListener('click', function (e) {
        e.preventDefault();
        const id = e.currentTarget.getAttribute('href').slice(1);
        const element = document.getElementById(id);

        const navHeight = navBar.getBoundingClientRect().height;
        let position = element.offsetTop - navHeight;

        window.scrollTo({
            top: position,
            left: 0,
        });
    });
});