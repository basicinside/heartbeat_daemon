/* Copyright (c) 2006-2008 MetaCarta, Inc., published under the Clear BSD
 * license.  See http://svn.openlayers.org/trunk/openlayers/license.txt for the
 * full text of the license. */

/**
 * @requires OpenLayers/Lang.js
 */

/**
 * Namespace: OpenLayers.Lang["da-DK"]
 * Dictionary for Danish.  Keys for entries are used in calls to
 *     <OpenLayers.Lang.translate>.  Entry bodies are normal strings or
 *     strings formatted for use with <OpenLayers.String.format> calls.
 */
OpenLayers.Lang['da-DK'] = {

    'unhandledRequest': "En ikke h�ndteret foresp�rgsel returnerede ${statusText}",

    'permalink': "Permalink",

    'overlays': "Kortlag",

    'baseLayer': "Baggrundslag",

    'sameProjection':
        "Oversigtskortet fungerer kun n�r det har samme projektion som hovedkortet",

    'readNotImplemented': "L�sning er ikke implementeret.",

    'writeNotImplemented': "Skrivning er ikke implementeret.",

    'noFID': "Kan ikke opdateret en feature (et objekt) der ikke har et FID.",

    'errorLoadingGML': "Fejlede under indl�sning af GML fil ${url}",

    'browserNotSupported':
        "Din browser underst�tter ikke vektor visning. F�lgende vektor visninger underst�ttes:\n${renderers}",

    'componentShouldBe': "addFeatures : komponenten skal v�re en ${geomType}",

    // console message
    'getFeatureError':
        "getFeatureFromEvent blev kaldt p� et lag uden en visning. Dette betyder som regel at du " +
        "har destrueret et lag, men ikke de h�ndteringer der var tilknyttet.",

    // console message
    'minZoomLevelError':
        "Egenskaben minZoomLevel er kun beregnet til brug " +
        "med FixedZoomLevels. At dette WFS lag kontrollerer " +
        "minZoomLevel egenskaben, er et levn fra en tidligere " +
        "version. Vi kan desv�rre ikke fjerne dette uden at risikere " +
        "at �del�gge eksisterende OL baserede programmer der " +
        " benytter denne funktionalitet. " +
        "Egenskaben b�r derfor ikke anvendes, og minZoomLevel " +
        "kontrollen herunder vil blive fjernet i version 3.0. " +
        "Benyt istedet min/max opl�snings indstillingerne, som " +
        "er beskrevet her: " +
        "http://trac.openlayers.org/wiki/SettingZoomLevels",

    'commitSuccess': "WFS transaktion: LYKKEDES ${response}",

    'commitFailed': "WFS transaktion: MISLYKKEDES ${response}",

    'googleWarning':
        "Google laget kunne ikke indl�ses.<br><br>" +
        "For at fjerne denne besked, v�lg et nyt bagrundskort i " +
        "lagskifteren i �verste h�jre hj�rne.<br><br>" +
        "Fejlen skyldes formentlig at Google Maps bibliotekts " +
        "scriptet ikke er inkluderet, eller ikke indeholder den " +
        "korrkte API n�gle for dit site.<br><br>" +
        "Udviklere: For hj�lp til at f� dette til at fungere, " +
        "<a href='http://trac.openlayers.org/wiki/Google' " +
        "target='_blank'>klik her</a>",

    'getLayerWarning':
        "${layerType}-laget kunne ikke indl�ses.<br><br>" +
        "For at fjerne denne besked, v�lg et nyt bagrundskort i " +
        "lagskifteren i �verste h�jre hj�rne.<br><br>" +
        "Fejlen skyldes formentlig at ${layerLib} bibliotekts " +
        "scriptet ikke er inkluderet.<br><br>" +
        "Udviklere: For hj�lp til at f� dette til at fungere, " +
        "<a href='http://trac.openlayers.org/wiki/${layerLib}' " +
        "target='_blank'>klik her</a>",

    'scale': "M�lforhold = 1 : ${scaleDenom}",

    // console message
    'layerAlreadyAdded':
        "Du har fors�gt at tilf�je laget: ${layerName} til kortet, men det er allerede tilf�jet",

    // console message
    'reprojectDeprecated':
        "Du anvender indstillingen 'reproject' p� laget ${layerName}." + 
        "Denne indstilling b�r ikke l�ngere anvendes. Den var beregnet " +
        "til at vise data ovenp� kommercielle grundkort, men den funktionalitet " +
        "b�r nu opn�s ved at anvende Spherical Mercator underst�ttelsen. " +
        "Mere information er tilg�ngelig her: " +
        "http://trac.openlayers.org/wiki/SphericalMercator.",

    // console message
    'methodDeprecated':
        "Denne funktion b�r ikke l�ngere anvendes, og vil blive fjernet i version 3.0. " +
        "Anvend venligst funktionen ${newMethod} istedet.",

    // console message
    'boundsAddError': "Du skal angive b�de x og y v�rdier i kaldet til add funktionen.",

    // console message
    'lonlatAddError': "Du skal angive b�de lon og lat v�rdier i kaldet til add funktionen.",

    // console message
    'pixelAddError': "Du skal angive b�de x og y v�rdier i kaldet til add funktionen.",

    // console message
    'unsupportedGeometryType': "Geometri typen: ${geomType} er ikke underst�ttet.",

    // console message
    'pagePositionFailed':
        "OpenLayers.Util.pagePosition fejlede: elementet med id ${elemId} er m�ske placeret forkert.",

    // console message
    'filterEvaluateNotImplemented': "evaluering er ikke implementeret for denne filter type."
};
