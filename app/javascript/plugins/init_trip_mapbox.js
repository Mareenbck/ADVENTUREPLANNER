import mapboxgl from 'mapbox-gl';
import 'mapbox-gl/dist/mapbox-gl.css';

const initTripMapbox = () => {
  const mapElement = document.getElementById('trip-map');

  if (mapElement) { // only build a map if there's a div#map to inject into

    mapboxgl.accessToken = mapElement.dataset.mapboxApiKey;

    const waypoints = JSON.parse(mapElement.dataset.waypoints);

    const map = new mapboxgl.Map({
      container: 'trip-map',
      style: 'mapbox://styles/mapbox-map-design/ckhqrf2tz0dt119ny6azh975y',
      pitch: 20,
      bearing: -100,
    });

    fitMapToWaypoints(map, waypoints);

    map.on('load', function () {
      map.addSource('mapbox-dem', {
        'type': 'raster-dem',
        'url': 'mapbox://mapbox.mapbox-terrain-dem-v1',
        'tileSize': 512,
        'maxzoom': 15
        });
        // add the DEM source as a terrain layer with exaggerated height
        map.setTerrain({ 'source': 'mapbox-dem', 'exaggeration': 1.5 });

        // add a sky layer that will show when the map is highly pitched
        map.addLayer({
        'id': 'sky',
        'type': 'sky',
        'paint': {
        'sky-type': 'atmosphere',
        'sky-atmosphere-sun': [0.0, 0.0],
        'sky-atmosphere-sun-intensity': 15
        }
        });
      addLayer(map, waypoints)
    });
  }
};

const addLayer = function (map, waypoints) {
  map.addLayer({
      "id": "route",
      "type": "line",
      "source": {
          "type": "geojson",
          "data": {
              "type": "Feature",
              "properties": {},
              "geometry": {
                  "type": "LineString",
                  "coordinates": waypoints
              }
          }
      },
      "layout": {
          "line-join": "round",
          "line-cap": "round"
      },
      "paint": {
          "line-color": "#ff1d15",
          "line-width": 6,
        "line-opacity": 0.5
      }
  });
};

const fitMapToWaypoints = (map, waypoints) => {
  const bounds = new mapboxgl.LngLatBounds();
  waypoints.forEach(waypoint => bounds.extend(waypoint));
  map.fitBounds(bounds, { padding: 70, maxZoom: 16, duration: 0 });
};


const initMapbox = () => {
  const mapElement = document.getElementById('map');

  if (mapElement) { // only build a map if there's a div#map to inject into

    mapboxgl.accessToken = mapElement.dataset.mapboxApiKey;
    const map = new mapboxgl.Map({
      container: 'map',
      style: 'mapbox://styles/mapbox/streets-v10'
    });

    const markers = JSON.parse(mapElement.dataset.markers);
    markers.forEach((marker, index) => {

    // const popup = new mapboxgl.Popup().setHTML(marker.infoWindow);

      const element = document.createElement('div');
      element.className = 'marker';
      element.style.backgroundImage = `url('${marker.image_url}')`;
      element.style.backgroundSize = 'cover';
      element.style.width = '40px';
      element.style.height = '65px';
      element.id = `marker-${marker.id}`;
      element.dataset.orderId = index

      element.addEventListener('click', () => {
        const event = new CustomEvent("activeindex", {detail: {index: index}});
        element.dispatchEvent(event);
      })

    new mapboxgl.Marker(element)
      .setLngLat([ marker.lng, marker.lat ])
      // .setPopup(popup)
      .addTo(map);
  });

  fitMapToMarkers(map, markers);

    mapElement.addEventListener("activecard", (event) => {
      const card = event.detail.el;
      const cardInfo = card.querySelector("#box-info-index");
      const allMarkers = mapElement.querySelectorAll("[id^='marker-']");
      allMarkers.forEach((marker) => {
        marker.classList.remove("active-marker");
        marker.style.backgroundImage = 'url(https://res.cloudinary.com/ddw7wju1q/image/upload/v1614940257/marker_s7rf5k.png)'
      });

      map.flyTo({
        center: [parseFloat(cardInfo.dataset.long), parseFloat(cardInfo.dataset.lat - 0.05)],
        zoom: 10
      });

      const marker = mapElement.querySelector(`#marker-${cardInfo.dataset.markerId}`)
      marker.classList.add("active-marker");
      marker.style.backgroundImage = 'url(https://res.cloudinary.com/ddw7wju1q/image/upload/v1614940255/marker-active_xeao39.png)'
      console.log(marker)
    });
  }
};

const fitMapToMarkers = (map, markers) => {
  const bounds = new mapboxgl.LngLatBounds();
  markers.forEach(marker => bounds.extend([ marker.lng, (marker.lat - 0.1) ]));
  map.fitBounds(bounds, { padding: 60, maxZoom: 9, duration: 0 });
};

export { initTripMapbox };
export { initMapbox };


// Quand on clicke sur le marker -> déclenche event -> récupérer l'id
// chercher la carte qui a le meme id
// Ajouter la
