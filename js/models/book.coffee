window.app = window.app || {}
window.app.Book = Backbone.Model.extend
  defaults:
    coverImage: 'img/placeholder.png'
    title: 'No title'
    author: 'Unknown'
    releaseDate: 'Unknown'
    keywords: 'None'

  parse: (response)->
    response.id = response._id
    return response
