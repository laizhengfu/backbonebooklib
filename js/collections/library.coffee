window.app = window.app || {}
window.app.Library = Backbone.Collection.extend
  model: app.Book
  url: '/api/books'