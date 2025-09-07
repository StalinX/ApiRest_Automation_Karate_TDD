function() {
  return function(modifiedBody, field) {
    var pathMap = {
      id: 'id',
      category_id: 'category.id',
      category_name: 'category.name',
      name: 'name',
      photoUrls: 'photoUrls',
      tags_id: 'tags.id',
      tags_name: 'tags.name',
      status: 'status'
    };

    var path = pathMap[field];
    if (!path) return modifiedBody;

    var keys = path.split('.');
    var obj = modifiedBody;

    for (var i = 0; i < keys.length - 1; i++) {
      if (!obj[keys[i]]) return modifiedBody; // ruta no existe
      obj = obj[keys[i]];
    }

    delete obj[keys[keys.length - 1]];
    return modifiedBody;
  }
}
