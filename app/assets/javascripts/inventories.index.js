document.addEventListener("turbolinks:load", function() {
  function inventoryButtonClickHandler(e) {
    e.preventDefault();
    let formActions = document.getElementById('form-actions');
    formActions.insertAdjacentHTML('beforebegin', inventoryButton.dataset.fields)
  }
  let inventoryButton = document.getElementById('add-component-button');
  if (inventoryButton) {
    inventoryButton.addEventListener('click', inventoryButtonClickHandler, false);
  }
})
