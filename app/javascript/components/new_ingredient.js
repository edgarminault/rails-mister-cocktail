const newIngredient = () => {
  event.preventDefault();
  const ingredientForm = document.querySelector("#form-dose-none");
  const button = document.querySelector('#add-ing-button');
  console.log(button)
  button.addEventListener("click", (event) => {
    if (ingredientForm.style.display.length === 0) {
      ingredientForm.style.display = "block"
    } else {
      ingredientForm.style.display = ""
    }
  });
};

export { newIngredient };
