/* Copyright (c) 2006-2008 MetaCarta, Inc., published under the Clear BSD
 * license.  See http://svn.openlayers.org/trunk/openlayers/license.txt for the
 * full text of the license. */

/**
 * @requires OpenLayers/Lang.js
 */

/**
 * Namespace: OpenLayers.Lang["ca"]
 * Dictionary for Catalan, UTF8 encoding. Keys for entries are used in calls to
 *     <OpenLayers.Lang.translate>.  Entry bodies are normal strings or
 *     strings formatted for use with <OpenLayers.String.format> calls.
 */
OpenLayers.Lang.ca = {

    'unhandledRequest': "Resposta a petici� no gestionada ${statusText}",

    'permalink': "Enlla� permanent",

    'overlays': "Capes addicionals",

    'baseLayer': "Capa Base",

    'sameProjection':
        "El mapa de refer�ncia nom�s funciona si t� la mateixa projecci� que el mapa principal",

    'readNotImplemented': "Lectura no implementada.",

    'writeNotImplemented': "Escriptura no implementada.",

    'noFID': "No es pot actualitzar un element per al que no existeix FID.",

    'errorLoadingGML': "Error caregant el fitxer GML ${url}",

    'browserNotSupported':
        "El seu navegador no suporta renderitzaci� vectorial. Els renderitzadors suportats actualmente s�n:\n${renderers}",

    'componentShouldBe': "addFeatures : el component ha de ser de tipus ${geomType}",

    // console message
    'getFeatureError':
        "getFeatureFromEvent ha estat cridat a una capa sense renderizador. Aix� normalment vol dir que " +
        "s'ha eliminat una capa, per� no el handler associat a ella.",

    // console message
    'minZoomLevelError':
        "La propietat minZoomLevel s'ha d'utilitzar nom�s " +
        "amb les capes que tenen FixedZoomLevels. El fet que " +
        "una capa wfs comprovi minZoomLevel �s una reliquia del " +
        "passat. No podem, per�, eliminar-la sense trencar " +
        "les aplicacions d'OpenLayers que en puguin dependre. " +
        "Aix� doncs estem fent-la obsoleta -- la comprovaci� " +
        "minZoomLevel s'eliminar� a la versi� 3.0. Feu servir " +
        "els par�metres min/max resolution en substituci�, tal com es descriu aqu�: " +
        "http://trac.openlayers.org/wiki/SettingZoomLevels",

    'commitSuccess': "Transacci� WFS: CORRECTA ${response}",

    'commitFailed': "Transacci� WFS: HA FALLAT ${response}",

    'googleWarning':
        "La capa Google no s'ha pogut carregar correctament.<br><br>" +
        "Per evitar aquest missatge, sel�leccioneu una nova Capa Base " +
        "al gestor de capes de la cantonada superior dreta.<br><br>" +
        "Probablement aix� �s degut a que l'script de la biblioteca de " +
    "Google Maps no ha estat incl�s a la vostra p�gina, o no " +
    "cont� la clau de l'API correcta per a la vostra adre�a.<br><br>" +
        "Desenvolupadors: Per obtenir consells sobre com fer anar aix�, " +
        "<a href='http://trac.openlayers.org/wiki/Google' " +
        "target='_blank'>f�u clic aqu�</a>",

    'getLayerWarning':
        "Per evitar aquest missatge, sel�leccioneu una nova Capa Base " +
        "al gestor de capes de la cantonada superior dreta.<br><br>" +
        "Probablement aix� �s degut a que l'script de la biblioteca " +
        "${layerLib} " +
        "no ha estat incl�s a la vostra p�gina.<br><br>" +
        "Desenvolupadors: Per obtenir consells sobre com fer anar aix�, " +
        "<a href='http://trac.openlayers.org/wiki/${layerLib}' " +
        "target='_blank'>f�u clic aqu�</a>",

    'scale': "Escala = 1 : ${scaleDenom}",

    // console message
    'layerAlreadyAdded':
        "Heu intentat afegir la capa: ${layerName} al mapa, pero ja ha estat afegida anteriorment",

    // console message
    'reprojectDeprecated':
        "Esteu fent servir l'opci� 'reproject' a la capa " +
        "${layerName}. Aquesta opci� �s obsoleta: el seu �s fou concebut " +
        "per suportar la visualitzaci� de dades sobre mapes base comercials, " + 
        "per� aquesta funcionalitat s'hauria d'assolir ara mitjan�ant el suport " +
        "de la projecci� Spherical Mercator. M�s informaci� disponible a " +
        "http://trac.openlayers.org/wiki/SphericalMercator.",

    // console message
    'methodDeprecated':
        "Aquest m�tode �s obsolet i s'eliminar� a la versi� 3.0. " +
        "Si us plau feu servir em m�tode alternatiu ${newMethod}.",

    // console message
    'boundsAddError': "Ha de proporcionar els valors x i y a la funci� add.",

    // console message
    'lonlatAddError': "Ha de proporcionar els valors lon i lat a la funci� add.",

    // console message
    'pixelAddError': "Ha de proporcionar els valors x i y a la funci� add.",

    // console message
    'unsupportedGeometryType': "Tipus de geometria no suportada: ${geomType}",

    // console message
    'pagePositionFailed':
        "OpenLayers.Util.pagePosition ha fallat: l'element amb id ${elemId} pot estar fora de lloc.",
                    
    // console message
    'filterEvaluateNotImplemented': "evaluate no est� implementat per aquest tipus de filtre.",

    'end': ''

};
