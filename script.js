const carousel = document.querySelector(".carousel");
const slides = document.querySelectorAll(".carousel-slide");
let currentIndex = 0;

function showSlide(index) {
    if (index < 0) {
        currentIndex = slides.length - 1;
    } else if (index >= slides.length) {
        currentIndex = 0;
    }

    carousel.style.transform = `translateX(-${currentIndex * 100}%)`;
}

// Next and previous buttons (optional)
const nextButton = document.getElementById("next");
const prevButton = document.getElementById("prev");

if (nextButton && prevButton) {
    nextButton.addEventListener("click", () => {
        currentIndex++;
        showSlide(currentIndex);
    });

    prevButton.addEventListener("click", () => {
        currentIndex--;
        showSlide(currentIndex);
    });
}

// Auto-advance the carousel (optional)
const autoAdvanceInterval = 7000; // Change slide every 7 seconds

setInterval(() => {
    currentIndex++;
    showSlide(currentIndex);
}, autoAdvanceInterval);

