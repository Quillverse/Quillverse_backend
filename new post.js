const imageInput = document.querySelector('#image');
const previewImage = document.querySelector('#preview-image');

imageInput.addEventListener('change', (event) => {
	const file = event.target.files[0];
	const reader = new FileReader();

	reader.onload = () => {
		previewImage.src = reader.result;
	};

	if (file) {
		reader.readAsDataURL(file);
	}
});