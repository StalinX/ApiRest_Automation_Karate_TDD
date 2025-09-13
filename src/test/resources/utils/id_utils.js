// helpers/id-utils.js
function fn() {
  var gen = {};

  // 1) UUID string (recomendado para unicidad real)
  gen.uuid = function(prefix) {
    return (prefix || '') + karate.uuid();
  };

  // 2) Entero aleatorio (si tu API exige number)
  gen.int = function(min, max) {
    min = (typeof min === 'number') ? min : 1000;      // 6 dígitos
    max = (typeof max === 'number') ? max : 20000;  // 9 dígitos
    return Math.floor(Math.random() * (max - min + 1)) + min;
  };

  // 3) ID corto (string) a partir de un UUID
  gen.short = function(len) {
    var s = karate.uuid().replace(/-/g, '');
    return s.substring(0, (typeof len === 'number') ? len : 12);
  };

  // 4) Nano (timestamp + random) útil para trazabilidad
  gen.nano = function(prefix) {
    var t = new Date().getTime();
    var r = Math.floor(Math.random() * 1e6);
    return (prefix || '') + t + '-' + r;
  };

  return gen;
}


