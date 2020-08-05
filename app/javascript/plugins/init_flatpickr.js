import flatpickr from 'flatpickr';
import 'flatpickr/dist/flatpickr.min.css'
import rangePlugin from "flatpickr/dist/plugins/rangePlugin"


const initFlatpickr = () => {
  flatpickr("#start-date",{
    dateFormat: "d F Y",
    allowInput: false,
    minDate: "today",
    "plugins": [new rangePlugin({ input: "#end-date" })]
  });
};

export { initFlatpickr }
