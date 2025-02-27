document.addEventListener('DOMContentLoaded', function() {
  const cartItems = document.querySelectorAll('.cart-item');

  cartItems.forEach(item => {
    const productId = item.dataset.itemId;
    const quantityInput = item.querySelector('.quantity-input');
    const decreaseBtn = item.querySelector('.decrease');
    const increaseBtn = item.querySelector('.increase');
    const itemTotalElement = item.querySelector('.item-total');
    const cartTotalElement = document.querySelector('.total-amount');

    decreaseBtn.addEventListener('click', function() {
      let currentQuantity = parseInt(quantityInput.value);
      if (currentQuantity > 1) {
        updateQuantity(productId, currentQuantity - 1);
      }
    });

    increaseBtn.addEventListener('click', function() {
      let currentQuantity = parseInt(quantityInput.value);
      if (currentQuantity < 99) {
        updateQuantity(productId, currentQuantity + 1);
      }
    });

    function updateQuantity(productId, newQuantity) {
      // Mise à jour de l'URL pour correspondre à vos routes
      fetch(`/cart/update/${productId}`, {
        method: 'PATCH',
        headers: {
          'Content-Type': 'application/json',
          'X-CSRF-Token': document.querySelector('meta[name="csrf-token"]').content
        },
        body: JSON.stringify({
          quantity: newQuantity
        })
      })
      .then(response => response.json())
      .then(data => {
        // Mettre à jour la quantité
        quantityInput.value = newQuantity;

        // Mettre à jour le total de l'article
        itemTotalElement.textContent = data.item_total;

        // Mettre à jour le total du panier
        cartTotalElement.textContent = data.cart_total;
      })
      .catch(error => {
        console.error('Erreur:', error);
        alert('Erreur lors de la mise à jour de la quantité');
      });
    }
  });
});
