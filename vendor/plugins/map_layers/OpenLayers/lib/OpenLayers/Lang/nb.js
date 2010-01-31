/* Copyright (c) 2006-2008 MetaCarta, Inc., published under the Clear BSD
 * license.  See http://svn.openlayers.org/trunk/openlayers/license.txt for the
 * full text of the license. */

/**
 * @requires OpenLayers/Lang.js
 */

/**
 * Namespace: OpenLayers.Lang["nb"]
 * Dictionary for norwegian bokm�l (Norway). Keys for entries are used in calls to
 *     <OpenLayers.Lang.translate>.  Entry bodies are normal strings or
 *     strings formatted for use with <OpenLayers.String.format> calls.
 */
OpenLayers.Lang["nb"] = {

    'unhandledRequest': "Ubehandlet foresp�rsel returnerte ${statusText}",

    'permalink': "Kobling til denne siden",

    'overlays': "Kartlag",

    'baseLayer': "Bakgrunnskart",

    'sameProjection':
        "Oversiktskartet fungerer bare n�r det har samme projeksjon som hovedkartet",

    'readNotImplemented': "Lesing er ikke implementert.",

    'writeNotImplemented': "Skriving er ikke implementert.",

    'noFID': "Kan ikke oppdatere feature (objekt) som ikke har FID.",

    'errorLoadingGML': "Feil under lasting av GML-fil ${url}",

    'browserNotSupported':
        "Din nettleser st�tter ikke vektortegning. F�lgende tegnemetoder st�ttes:\n${renderers}",

    'componentShouldBe': "addFeatures : komponenten m� v�re en ${geomType}",

    // console message
    'getFeatureError':
        "getFeatureFromEvent kj�rt mot lag uten tegnemetode. Dette betyr som regel at du " +
        "fjernet et lag uten � fjerne alle handlere tilknyttet laget.",

    // console message
    'minZoomLevelError':
        "Egenskapen minZoomLevel er kun tenkt for bruk p� lag " +
        "basert p� FixedZoomLevels. At dette wfs-laget sjekker " +
        "minZoomLevel er en fortidslevning. Det kan dog ikke " +
        "tas bort uten � risikere at OL-baserte applikasjoner " +
        "slutter � virke, s� det er merket som foreldet: " +
        "minZoomLevel i sjekken nedenfor vil fjernes i 3.0. " +
        "Vennligst bruk innstillingene for min/maks oppl�sning " +
        "som er beskrevet her: "+
        "http://trac.openlayers.org/wiki/SettingZoomLevels",

    'commitSuccess': "WFS-transaksjon: SUKSESS ${response}",

    'commitFailed': "WFS-transaksjon: FEILET ${response}",

    'googleWarning':
        "Google-laget kunne ikke lastes.<br><br>" +
        "Bytt til et annet bakgrunnslag i lagvelgeren i " +
        "�vre h�yre hj�rne for � slippe denne meldingen.<br><br>" +
        "Sannsynligvis for�rsakes feilen av at Google Maps-biblioteket " +
        "ikke er riktig inkludert p� nettsiden, eller at det ikke er " +
        "angitt riktig API-n�kkel for nettstedet.<br><br>" +
        "Utviklere: For hjelp til � f� dette til � virke se "+
        "<a href='http://trac.openlayers.org/wiki/Google' " +
        "target='_blank'>her</a>.",

    'getLayerWarning':
        "${layerType}-laget kunne ikke lastes.<br><br>" +
        "Bytt til et annet bakgrunnslag i lagvelgeren i " +
        "�vre h�yre hj�rne for � slippe denne meldingen.<br><br>" +
        "Sannsynligvis for�rsakes feilen av at " +
        "${layerLib}-biblioteket ikke var riktig inkludert " +
        "p� nettsiden.<br><br>" +
        "Utviklere: For hjelp til � f� dette til � virke se " +
        "<a href='http://trac.openlayers.org/wiki/${layerLib}' " +
        "target='_blank'>her</a>.",

    'scale': "<strong>Skala</strong> 1 : ${scaleDenom}",

    // console message
    'layerAlreadyAdded':
        "Du fors�kte � legge til laget ${layerName} p� kartet, men det er allerede lagt til",

    // console message
    'reprojectDeprecated':
        "Du bruker innstillingen 'reproject' p� laget ${layerName}. " +
        "Denne innstillingen er foreldet, den var ment for � st�tte " +
        "visning av kartdata over kommersielle bakgrunnskart, men det " +
        "b�r n� gj�res med st�tten for Spherical Mercator. Mer informasjon " +
        "finnes p� http://trac.openlayers.org/wiki/SphericalMercator.",

    // console message
    'methodDeprecated':
        "Denne metoden er markert som foreldet og vil bli fjernet i 3.0. " +
        "Bruk ${newMethod} i stedet.",

    // console message
    'boundsAddError': "Du m� gi b�de x- og y-verdier til funksjonen add.",

    // console message
    'lonlatAddError': "Du m� gi b�de lon- og lat-verdier til funksjonen add.",

    // console message
    'pixelAddError': "Du m� gi b�de x- og y-verdier til funksjonen add.",

    // console message
    'unsupportedGeometryType': "Ust�ttet geometritype: ${geomType}",

    // console message
    'pagePositionFailed':
        "OpenLayers.Util.pagePosition feilet: elementet med id ${elemId} kan v�re feilplassert.",
                    
    'end': ''
};
