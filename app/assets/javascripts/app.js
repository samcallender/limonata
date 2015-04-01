$(function(){
  var buildings = window.buildings = new BuildingCollection();
  buildings.fetch({
    success: function(){
      var buildingsView = new BuildingCollectionView({
        collection: buildings
      })
    } 
  });
})