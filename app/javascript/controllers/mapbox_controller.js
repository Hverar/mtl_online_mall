import { Controller } from "@hotwired/stimulus"
import mapboxgl from "mapbox-gl"

export default class extends Controller {
  static values = {
    apiKey: String,
    lat: Number,
    lng: Number,
    name: String
  }

  connect() {
    mapboxgl.accessToken = this.apiKeyValue;

    const map = new mapboxgl.Map({
      container: this.element,
      style: "mapbox://styles/mapbox/streets-v11",
      center: [this.lngValue, this.latValue],
      zoom: 13
    });

    new mapboxgl.Marker()
      .setLngLat([this.lngValue, this.latValue])
      .setPopup(new mapboxgl.Popup().setHTML(`<strong>${this.nameValue}</strong>`))
      .addTo(map);
  }
}
