import "bootstrap";
import "../plugins/flatpickr"
import { loadFile } from "../plugins/show_uploaded_image.js";

import 'mapbox-gl/dist/mapbox-gl.css'; // <-- you need to uncomment the stylesheet_pack_tag in the layout!
import { initMapbox } from '../plugins/init_mapbox';

loadFile(event);
initMapbox();
