/*
 Leaflet, a JavaScript library for mobile-friendly interactive maps. http://leafletjs.com
 (c) 2010-2013, Vladimir Agafonkin
 (c) 2010-2011, CloudMade
*/
(function (window, document, undefined) {
var oldL = window.L,
    L = {};

L.version = '0.6.4';

// define Leaflet for Node module pattern loaders, including Browserify
if (typeof module === 'object' && typeof module.exports === 'object') {
  module.exports = L;

// define Leaflet as an AMD module
} else if (typeof define === 'function' && define.amd) {
  define(L);
}

// define Leaflet as a global L variable, saving the original L to restore later if needed

L.noConflict = function () {
  window.L = oldL;
  return this;
};

window.L = L;


/*
 * L.Util contains various utility functions used throughout Leaflet code.
 */

L.Util = {
  extend: function (dest) { // (Object[, Object, ...]) ->
    var sources = Array.prototype.slice.call(arguments, 1),
        i, j, len, src;

    for (j = 0, len = sources.length; j < len; j++) {
      src = sources[j] || {};
      for (i in src) {
        if (src.hasOwnProperty(i)) {
          dest[i] = src[i];
        }
      }
    }
    return dest;
  },

  bind: function (fn, obj) { // (Function, Object) -> Function
    var args = arguments.length > 2 ? Array.prototype.slice.call(arguments, 2) : null;
    return function () {
      return fn.apply(obj, args || arguments);
    };
  },

  stamp: (function () {
    var lastId = 0,
        key = '_leaflet_id';
    return function (obj) {
      obj[key] = obj[key] || ++lastId;
      return obj[key];
    };
  }()),

  invokeEach: function (obj, method, context) {
    var i, args;

    if (typeof obj === 'object') {
      args = Array.prototype.slice.call(arguments, 3);

      for (i in obj) {
        method.apply(context, [i, obj[i]].concat(args));
      }
      return true;
    }

    return false;
  },

  limitExecByInterval: function (fn, time, context) {
    var lock, execOnUnlock;

    return function wrapperFn() {
      var args = arguments;

      if (lock) {
        execOnUnlock = true;
        return;
      }

      lock = true;