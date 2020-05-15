const newReview = () => {
  event.preventDefault();
  const reviewForm = document.querySelector("#form-review-none");
  const button = document.querySelector('#add-rev-button');
  console.log(button)
  button.addEventListener("click", (event) => {
    if (reviewForm.style.display.length === 0) {
      reviewForm.style.display = "block"
    } else {
      reviewForm.style.display = ""
    }
  });
};

export { newReview };
