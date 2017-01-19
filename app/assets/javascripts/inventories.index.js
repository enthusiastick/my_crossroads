document.addEventListener("turbolinks:load", function() {
  function inventoryButtonClickHandler(e) {
    e.preventDefault();
    let formActions = document.getElementById('form-actions');
    time = new Date().getTime()
    regexp = new RegExp(inventoryButton.dataset.id, 'g')
    formActions.insertAdjacentHTML('beforebegin', inventoryButton.dataset.fields.replace(regexp, time))
  }
  let inventoryButton = document.getElementById('add-component-button');
  if (inventoryButton) {
    inventoryButton.addEventListener('click', inventoryButtonClickHandler, false);
  }
})
