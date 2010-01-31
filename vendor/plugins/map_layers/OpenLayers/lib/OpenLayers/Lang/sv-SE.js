/* Copyright (c) 2006-2008 MetaCarta, Inc., published under the Clear BSD
 * license.  See http://svn.openlayers.org/trunk/openlayers/license.txt for the
 * full text of the license. */

/**
 * @requires OpenLayers/Lang.js
 */

/**
 * Namespace: OpenLayers.Lang["sv-SE"]
 * Dictionary for swedish (Sweden).  Keys for entries are used in calls to
 *     <OpenLayers.Lang.translate>.  Entry bodies are normal strings or
 *     strings formatted for use with <OpenLayers.String.format> calls.
 */
OpenLayers.Lang["sv-SE"] = {

    'unhandledRequest': "Ej hanterad fr�ga retur ${statusText}",

    'permalink': "Permal�nk",

    'overlays': "Kartlager",

    'baseLayer': "Bakgrundskarta",

    'sameProjection':
        "�versiktskartan fungerar endast n�r den har samma projektion som huvudkartan",

    'readNotImplemented': "L�sning ej implementerad.",

    'writeNotImplemented': "Skrivning ej implementerad.",

    'noFID': "Kan ej uppdatera feature (objekt) f�r vilket FID saknas.",

    'errorLoadingGML': "Fel i laddning av GML-fil ${url}",

    'browserNotSupported':
        "Din webbl�sare st�der inte vektorvisning. F�r n�rvarande st�ds f�ljande visning:\n${renderers}",

    'componentShouldBe': "addFeatures : komponenten skall vara en ${geomType}",

    // console message
    'getFeatureError':
        "getFeatureFromEvent anropad f�r lager utan utritning. Detta betyder oftast att man " +
        "raderat ett lager, men inte en hanterare som �r knuten till lagret.",

    // console message
    'minZoomLevelError':
        "Egenskapen minZoomLevel �r endast avsedd att anv�ndas " +
        "med lager med FixedZoomLevels. Att detta WFS-lager " +
        "kontrollerar minZoomLevel �r en relik fr�n �ldre versioner. " +
        "Vi kan dock inte ta bort det utan att riskera att " +
        "OL-baserade till�mpningar som anv�nder detta slutar " +
        "fungera. D�rf�r �r det satt som deprecated, minZoomLevel " +
        "kommer att tas bort i version 3.0. Anv�nd i st�llet " +
        "inst�llning av min/max resolution som beskrivs h�r: " +
        "http://trac.openlayers.org/wiki/SettingZoomLevels",

    'commitSuccess': "WFS-transaktion: LYCKADES ${response}",

    'commitFailed': "WFS-transaktion: MISSLYCKADES ${response}",

    'googleWarning':
        "Google-lagret kunde inte laddas korrekt.<br><br>" + 
        "F�r att slippa detta meddelande, v�lj en annan bakgrundskarta " +
        "i lagerv�ljaren i �vre h�gra h�rnet.<br><br>" +
        "Sannolikt beror felet p� att Google Maps-biblioteket " + 
        "inte �r inkluderat p� webbsidan eller p� att sidan " +
        "inte anger korrekt API-nyckel f�r webbplatsen.<br><br>" +
        "Utvecklare: hj�lp f�r att �tg�rda detta, " +
        "<a href='http://trac.openlayers.org/wiki/Google' " +
        "target='_blank'>klicka h�r</a>.",

    'getLayerWarning':
        "${layerType}-lagret kunde inte laddas korrekt.<br><br>" + 
        "F�r att slippa detta meddelande, v�lj en annan bakgrundskarta " +
        "i lagerv�ljaren i �vre h�gra h�rnet.<br><br>" +
        "Sannolikt beror felet p� att ${layerLib}-biblioteket " + 
        "inte �r inkluderat p� webbsidan.<br><br>" +
        "Utvecklare: hj�lp f�r att �tg�rda detta, " +
        "<a href='http://trac.openlayers.org/wiki/${layerLib}' " +
        "target='_blank'>klicka h�r</a>.",

    'scale': "<strong>Skala</strong> 1 : ${scaleDenom}",

    // console message
    'layerAlreadyAdded':
        "Du f�rs�kte l�gga till lagret: ${layerName} p� kartan, men det har lagts till tidigare",

    // console message
    'reprojectDeprecated':
        "Du anv�nder inst�llningen 'reproject' p� lagret ${layerName}. " +
        "Denna inst�llning markerad som deprecated: den var avsedd " +
        "att anv�ndas f�r att st�dja visning av kartdata p� kommersiella " +
        "bakgrundskartor, men nu b�r man i st�llet " +
        "anv�nda Spherical Mercator-st�d f�r den funktionaliteten. " +
        "Mer information finns " +   
        "p� http://trac.openlayers.org/wiki/SphericalMercator.",

    // console message
    'methodDeprecated':
        "Denna metod �r markerad som deprecated och kommer att tas bort i 3.0. " +
        "Anv�nd ${newMethod} i st�llet.",

    // console message
    'boundsAddError': "Du m�ste skicka b�de x- och y-v�rde till funktionen add.",

    // console message
    'lonlatAddError': "Du m�ste skicka b�de lon- och lat-v�rde till funktionen add.",

    // console message
    'pixelAddError': "Du m�ste skicka b�de x- och y-v�rde till funktionen add.",

    // console message
    'unsupportedGeometryType': "St�d saknas f�r geometritypen: ${geomType}",

    // console message
    'pagePositionFailed':
        "OpenLayers.Util.pagePosition misslyckades: elementet med id ${elemId} kan placeras fel.",
                    
    'end': ''
};
