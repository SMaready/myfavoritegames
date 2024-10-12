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

// Next and previous buttons
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

// Auto-advance the carousel
const autoAdvanceInterval = 10000; // Change slide every 10 seconds

// If statement so that if next or prev button clicks the 10 sec interval resets?
setInterval(() => {
    currentIndex++;
    showSlide(currentIndex);
}, autoAdvanceInterval);


