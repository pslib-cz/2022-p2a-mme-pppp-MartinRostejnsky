//pip install PyQtWebEngine
//This concept is more of an experiment

import "../components" as Components

Components.WebView {
    url: "https://bakalar.pslib.cz/rodice/Timetable/Public"
    allowedOrigins: [
        "bakalar.pslib.cz"
    ]
}