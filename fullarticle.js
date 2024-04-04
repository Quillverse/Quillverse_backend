const followAuthor = document.getElementById('followAuthor');
const articleLikeBtn = document.getElementById('articleLikeBtn');
const heartIcon = document.querySelector('.fa-heart');
const bookmarkIcon = document.querySelector('.fa-bookmark');

followAuthor.addEventListener('click', () => {
    if (followAuthor.innerText === 'Follow') {
        followAuthor.innerText = 'Following';
    }
    else {
        followAuthor.innerText = 'Follow';
    }
})

bookmarkIcon.addEventListener('click', () => {
    bookmarkIcon.classList.toggle('fa-solid');
})

heartIcon.addEventListener('click', () => {
    heartIcon.classList.toggle('fa-solid');
})
