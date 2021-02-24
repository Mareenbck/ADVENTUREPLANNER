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
        'maxzoom': 14
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

const initMapbox = () => {
  const mapElement = document.getElementById('map');

  if (mapElement) { // only build a map if there's a div#map to inject into
    mapboxgl.accessToken = mapElement.dataset.mapboxApiKey;
    const map = new mapboxgl.Map({
      container: 'map',
      style: 'mapbox://styles/mapbox/streets-v10'
    });

    const markers = JSON.parse(mapElement.dataset.markers);
  markers.forEach((marker) => {
    new mapboxgl.Marker()
      .setLngLat([ marker.lng, marker.lat ])
      .addTo(map);
  });
  fitMapToMarkers(map, markers);
  }
};

const fitMapToMarkers = (map, markers) => {
  const bounds = new mapboxgl.LngLatBounds();
  markers.forEach(marker => bounds.extend([ marker.lng, marker.lat ]));
  map.fitBounds(bounds, { padding: 70, maxZoom: 11, duration: 0 });
};

export { initTripMapbox };
export { initMapbox };

