import mapboxgl from 'mapbox-gl';
import 'mapbox-gl/dist/mapbox-gl.css';

const initTripMapbox = () => {
  const mapElement = document.getElementById('trip-map');

  if (mapElement) { // only build a map if there's a div#map to inject into
    mapboxgl.accessToken = mapElement.dataset.mapboxApiKey;

    const waypoints = JSON.parse(mapElement.dataset.waypoints);

    const map = new mapboxgl.Map({
      container: 'trip-map',
      style: 'mapbox://styles/mapbox-map-design/ckhqrf2tz0dt119ny6azh975y'
    });

    fitMapToWaypoints(map, waypoints);

    map.on('load', function () {
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
          "line-color": "#b61fe2",
          "line-width": 6,
        "line-opacity": 0.5
      }
  });
};

const fitMapToWaypoints = (map, waypoints) => {
  const bounds = new mapboxgl.LngLatBounds();
  waypoints.forEach(waypoint => bounds.extend(waypoint));
  map.fitBounds(bounds, { padding: 70, maxZoom: 15, duration: 0 });
};

export { initTripMapbox };

