const newIngredient = () => {
  const ingredientForm = document.querySelector("#form-dose");
  const button = document.querySelector('#add-ing-button');
  console.log(button)
  button.addEventListener("click", (event) => {
    console.log(event)
    ingredientForm.style.display = "block"
  });
};

export { newIngredient };
