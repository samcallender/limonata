var BuildingCollectionView = Backbone.View.extend({
	tagName: 'ul',
	className: 'buildings',
	render: function(){
		this.$el.empty();
		$('body').append(this.$el);
		var thisBuildingCollectionView = this;
		this.collection.models.forEach(function(model){
			var newView = new BuildingView({model: model});
				thisBuildingCollectionView.$el.append(newView.$el);
		})
	},
	initialize: function(){
		this.render();
	}
})