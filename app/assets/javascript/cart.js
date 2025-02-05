document.addEventListener('DOMContentLoaded', () => {
  const cartItems = document.querySelectorAll('.cart-item');

  cartItems.forEach(item => {
    const productId = item.dataset.itemId;
    const quantityInput = item.querySelector('.quantity-input');
    const decreaseBtn = item.querySelector('.decrease');
    const increaseBtn = item.querySelector('.increase');
    let timeout;

    // Gestion des boutons + et -
    decreaseBtn?.addEventListener('click', () => {
      if (quantityInput.value > 1) {
        quantityInput.value = parseInt(quantityInput.value) - 1;
        updateQuantity(productId, quantityInput.value);
      }
    });

    increaseBtn?.addEventListener('click', () => {
      quantityInput.value = parseInt(quantityInput.value) + 1;
      updateQuantity(productId, quantityInput.value);
    });

    // Gestion de la saisie manuelle
    quantityInput?.addEventListener('change', () => {
      let value = parseInt(quantityInput.value);

      // Valider les limites
      if (value < 1) value = 1;
      if (value > 99) value = 99;

      quantityInput.value = value;
      updateQuantity(productId, value);
    });
  });

  // Fonction pour mettre à jour la quantité
  function updateQuantity(productId, quantity) {
    clearTimeout(timeout);

    timeout = setTimeout(() => {
      fetch(`/cart/update/${productId}`, {
        method: 'PATCH',
        headers: {
          'Content-Type': 'application/json',
          'X-CSRF-Token': document.querySelector('[name="csrf-token"]').content
        },
        body: JSON.stringify({ quantity: quantity })
      })
      .then(response => response.json())
      .then(data => {
        // Mettre à jour les totaux
        const itemContainer = document.querySelector(`.cart-item[data-item-id="${productId}"]`);
        if (itemContainer) {
          const priceElement = itemContainer.querySelector('.item-price');
          const totalElement = document.querySelector('.cart-total');

          if (priceElement && totalElement) {
            const unitPrice = parseFloat(priceElement.dataset.unitPrice);
            const newPrice = (unitPrice * quantity).toFixed(2);
            priceElement.textContent = `${newPrice} €`;
          }
        }
      })
      .catch(error => console.error('Erreur de mise à jour du panier:', error));
    }, 500); // Ajout d'un délai pour éviter les requêtes excessives
  }
});
