/**
 * The background color for the buttons
 * 
 * Barva pozadi tlacitek
 */
const buttonColor = "#2f65b0";

/**
 * The color of the text in the buttons
 * 
 * Barva textu tlacitek
 */
const buttonTextColor = "white";

/**
 * The base reference size in pixels. Think of this like the value of 1rem on the web.
 * 
 * Zakladni referencni velikost v pixelech. Neco jako hodnota 1rem ve webovem prostredi.
 */
const baseSize = 16;

/**
 * The font family used throughout the application
 * 
 * Rodina pisem pouzivana v cele aplikaci
 */
const fontFamily = "Noto Sans";

/**
 * The color of the text elements
 * 
 * Barva textovych elementu
 */
const textColor = "#565655";

/**
 * The background color of the application
 * 
 * Barva pozadi aplikace
 */
const backgroundColor = "#e9e9e9";

/**
 * The color of the headings in the application
 * 
 * Barva nadpisu v aplikaci
 */
const headingColor = "#2f65b0";

/**
 * The "home" page of the application
 * 
 * "Domovska" stranka aplikace
 */
const landingPage = "home";

/**
 * The pages loaded with the application. This is a map of the page name 
 * to the corresponding file in the "pages/" directory. Switching to appropriate
 * pages is possible using the API.PageSwitcher.navigateTo(pageName) function.
 * 
 * Stranky nacitane s aplikaci. Jde o mapu nazvu stranek na prislusny soubor
 * v adresari "pages/". Na jednotlive stranky je mozne se prepinat pomoci funkce 
 * API.PageSwitcher.navigateTo(pageName).
 */
const pages = {
    home: "MainPage.qml",
    about: "AboutPage.qml",
    web: "WebPage.qml",
    timetable: "TimeTablePage.qml",
    suplovani: "SubstitutionsPage.qml",
};

/**
 * The initial links opened within the WebViews
 * 
 * Počáteční odkazy webových prohlížečů
 */

const urls = {
    web: "https://pslib.cz",
    timetable: "https://bakalar.pslib.cz/rodice/Timetable/Public",
    suplovani: "https://bakalar.pslib.cz/rodice/next/zmeny.aspx"
};

/**
 * Origins allowed withing the WebViews (unless overwritten)
 * 
 * Odkazy povolené ve webových prohlížečích (pokud není uvedeno jinak)
 */

const allowedOrigins = [
    "pslib.cz",
];

/**
 * Text displayed on the main page
 * 
 * Text zobrazovaný na domovské stránce
 */

const mainPageText = {
    heading: "Kam to bude?",
    btn1: "Rozvrh",
    btn2: "Suplování",
    btn3: "Web",
    btn4: "O aplikaci"
};
