
const initBtnDashboard = () => {
  const btnLast = document.getElementById("lasttrips");
  const btnUp = document.getElementById("upcomingtrips");



  if(btnLast) {

    btnLast.addEventListener('click', (event) => {
      // event.preventDefault();
      btnUp.classList.remove("btn-clicked")
      btnLast.classList.toggle("btn-clicked")
    })

  };
}

const initBtnUpcoming = () => {
  const btnLast = document.getElementById("lasttrips");
  const btnUp = document.getElementById("upcomingtrips");



  if(btnUp) {

    btnUp.addEventListener('click', (event) => {
      // event.preventDefault();
      btnLast.classList.remove("btn-clicked")
      btnUp.classList.toggle("btn-clicked")
    })

  };
}

export { initBtnDashboard }
export { initBtnUpcoming }
