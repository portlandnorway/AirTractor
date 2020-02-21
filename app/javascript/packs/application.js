import "bootstrap";
import 'mapbox-gl/dist/mapbox-gl.css';
import 'flatpickr/dist/flatpickr.css'; // <-- you need to uncomment the stylesheet_pack_tag in the layout!

import { initMapbox }       from '../plugins/init_mapbox';
import { initScroll }       from '../plugins/init_scroll_btn';
import { toggleDateInputs } from '../plugins/booking';
import { fadeOut }          from '../plugins/flash';

initMapbox();
initScroll();
toggleDateInputs();
fadeOut()
