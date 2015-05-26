window.app = window.app || {}
window.app.BookView = Backbone.View.extend
  tagName: 'div'
  className: 'bookContainer'
  template: _.template $('#bookTemplate').html()
  render: ->
    this.$el.html this.template(this.model.toJSON())
    this

  events:
    'click .delete': 'deleteBook'

  deleteBook: ->
    this.model.destroy()
    this.remove()