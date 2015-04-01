var BuildingView = Backbone.View.extend({
	tagName: 'li',
	className: 'building',
	initialize: function(){
		this.render();
	},
	render: function(){
		this.$el.text(this.model.get('building_name'))
	}
})	