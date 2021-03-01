

const initOpenWeather = () => {
  const locationLat = document.querySelector(".map-booking").dataset.lat;
  const locationLong = document.querySelector(".map-booking").dataset.long;
  console.log(location)
  fetch(`https://api.openweathermap.org/data/2.5/onecall?lat=${locationLat}&lon=${locationLong}&units=metric&appid=3ec494677eb396bad30e14883661e348`)
    .then(response => response.json())
    .then((data) => {
      console.log(data);

      const dailyMeteoDiv = document.querySelectorAll(".meteo");
      dailyMeteoDiv.forEach((day) => {

        // on recupere l'id du jour
        const dayId = day.id.split("-")[1]

        // on va chercher la data pour le jour en question (on interpole l'id du jour)

        const main = data.daily[dayId].weather[0].main
        const icon = `http://openweathermap.org/img/wn/${data.daily[dayId].weather[0].icon}@2x.png`;
        const degres = Math.floor(data.daily[dayId].temp.day);

        // on va chercher la bonne div correspondant au jour et on injecte les infos
        const insertDegres = document.querySelector(`#day-${dayId} .degres`);
        const insertIcon = document.querySelector(`#day-${dayId} .img`);
        const insertMain = document.querySelector(`#day-${dayId} .main`);

        insertIcon.innerText = "";
        insertIcon.src = icon;
        insertDegres.innerText = " °C";
        insertDegres.insertAdjacentText('afterbegin', degres);
        insertMain.innerText = "";
        insertMain.insertAdjacentText('beforeend', main);
      } )

  })
}

export { initOpenWeather }
