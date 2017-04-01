document.addEventListener("DOMContentLoaded", function() {
  function inventoryButtonClickHandler(e) {
    e.preventDefault();
    var formInputs = document.getElementById('form-inputs');
    time = new Date().getTime()
    regexp = new RegExp(inventoryButton.dataset.id, 'g')
    formInputs.insertAdjacentHTML('afterbegin', inventoryButton.dataset.fields.replace(regexp, time))
  }
  var inventoryButton = document.getElementById('add-component-button');
  if (inventoryButton) {
    inventoryButton.addEventListener('click', inventoryButtonClickHandler, false);
  }
})
