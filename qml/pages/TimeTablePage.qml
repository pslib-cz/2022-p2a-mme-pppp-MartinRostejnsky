//pip install PyQtWebEngine
//This concept is more of an experiment

import URLUtils 1.0
import "../components" as Components
import "../Constants.js" as Constants

Components.WebView {
    url: Constants.urls["timetable"]
    allowedOrigins: [
        urlUtils.getOrigin(Constants.urls["timetable"])
    ]

    URLUtils {
        id: urlUtils
    }
}