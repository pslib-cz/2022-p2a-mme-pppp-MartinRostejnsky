//pip install PyQtWebEngine
//This concept is more of an experiment

import URLUtils 1.0
import "../components" as Components
import "../Constants.js" as Constants

Components.WebView {
    url: Constants.urls["suplovani"]
    allowedOrigins: [
        urlUtils.getOrigin(Constants.urls["suplovani"])
    ]

    URLUtils {
        id: urlUtils
    }
}