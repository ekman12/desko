const clickWishlistHeart = () => {
  const wishlistHeart = document.getElementById("wishlist-heart")
  wishlistHeart.addEventListener("click", (event) => {
    event.currentTarget.classList.toggle("wishlist-heart-clicked");
  });
};

export { clickWishlistHeart };
