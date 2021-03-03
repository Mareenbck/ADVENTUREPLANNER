 import "jquery-bar-rating";

 const initStarRating = () => {
 $('#review_rating').barrating({
   theme: 'css-stars'
 });
 $('#review_rating_2').barrating({
   theme: 'css-stars'
 });
 $('#review_rating_3').barrating({
   theme: 'css-stars'
 });
 $('#review_rating_4').barrating({
   theme: 'css-stars'
 });
}

export { initStarRating };
