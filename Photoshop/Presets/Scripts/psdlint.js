/*
 * Script para checkear un psd
 * Warnings:
 * - tipo pequeña
 * - capas con opacidad
 * - cantidad de tipografías / colores / tamaños
 * - tipo con tamaño decimal
 * Molaría:
 * - distancia mínima entre capas
 * - distancia "rara" entre capas
 */

var psd = function () {
    this.foo = "";
};

var psdlint = function () {
    this.version = "0.1";
    this.layers = [];
    this.lint = {
        "typo":{
            "min_size":"12",
            "max_size":"99",
            "allowFloat":false
        }
    };
};

psdlint.prototype.allowFloat = function(set) {
    this.lint.typo.allowFloat = set;
};

psdlint.prototype.setMinFontSize = function(size) {
    this.lint.typo.min_size = size;
};

psdlint.prototype.setMaxFontSize = function(size) {
    this.lint.typo.max_size = size;
};

psdlint.prototype.isTransparent = function(layer){
    if (layer.opacity < 1.0) {
        return true;
    } else {
        return false;
    }
};

psdlint.prototype.numberIsFloat = function(n) {
    return n === +n && n !== (n|0);
};

psdlint.prototype.isSmall = function(textLayer) {
    if (textLayer.textItem.size < this.lint.typo.min_size) {
        return true;
    } else {
        return false;
    }
};

psdlint.prototype.isFloat = function(textLayer) {
    if (this.numberIsFloat(textLayer.textItem.size)) {
        return true;
    } else {
        return false;
    } 
};

psdlint.prototype.rgbaSum = function (color1, color2) {

};

psdlint.prototype.colorBase = function(red, green, blue, alpha) {
    return {
        r:red,
        g:greem,
        b:blue,
        a:alpha
    };
};

psdlint.prototype.converColorBaseTo256 = function (colorObject) {
    colorObject.r = 255 * colorObject.r;
    colorObject.g = 255 * colorObject.g;
    colorObject.b = 255 * colorObject.b;
};

psdlint.prototype.converColor256ToBase = function (colorObject) {
    colorObject.r = colorObject.r / 255;
    colorObject.g = colorObject.g / 255;
    colorObject.b = colorObject.b / 255;
};

psdlint.prototype.rgbaSum = function(color1, color2){
    var a = color1.a + color2.a*(1-color1.a);
    return {
        r: (color1.r * color1.a  + color2.r * color2.a * (1 - color1.a)) / a,
        g: (color1.g * color1.a  + color2.g * color2.a * (1 - color1.a)) / a,
        b: (color1.b * color1.a  + color2.b * color2.a * (1 - color1.a)) / a,
        a: a
    };
};

psd.prototype.getVisibleTextLayers = function(root, layersArray) {
    var lenLayers = root.layers.length;
    
    for (var i=0; i<lenLayers; i++) {
        var theLayer = root.layers[i];
        
        if (theLayer.visible) {
            if (theLayer.typename == "LayerSet") {
                this.getVisibleLayers(theLayer, layersArray);
            } else if (this.isTextLayer(theLayer)) {
                layersArray.push(theLayer);
            }
        }
    }
};

psd.prototype.isTextLayer = function (layer) {
    if (layer.typename == "ArtLayer") {
        if (layer.kind == "LayerKind.TEXT") {
            return true;
        }
    }
    return false;
};

var Doc = app.activeDocument;
var TheLayers = [];

var psdlint = new psdlint();
var psd = new psd();

// Full TheLayers array with visible text layers
psd.getVisibleTextLayers(Doc, TheLayers);

// Pasamos por las text layers para ver los warnings
var len = TheLayers.length;
for (var i=0; i<len; i++) {
    //alert(psdlint.isSmall(TheLayers[i]));
    //alert(psdlint.isFloat(TheLayers[i]));

    var textLayer = TheLayers[i];
    
    if (psdlint.isSmall(textLayer)) {
        alert("WARN: Small Text : " + textLayer.name);
    }
    
}
