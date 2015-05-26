window.app = window.app || {}
window.app.LibraryView = Backbone.View.extend
  el: '#books'
  initialize: (initialBooks)->
    this.collection = new app.Library initialBooks
    this.collection.fetch reset: true
    this.render()

    this.listenTo this.collection, 'add', this.renderBook
    this.listenTo this.collection, 'reset', this.render

  events:
    'click #add': 'addBook'

  render: ->
    this.collection.each(
      (item)->
        this.renderBook item
    , this)

  renderBook: (item)->
    bookView = new app.BookView
      model: item
    this.$el.append bookView.render().el

  addBook: (e)->
    e.preventDefault()
    formData = {}
    $('#addBook div').children('input').each (i, el)->
      if $(el).val() != ''
        if el.id == 'keywords'
          formData[el.id] = []
          _.each $(el).val().split(' '), (keyword)->
            formData[el.id].push keyword: keyword
        else if el.id == 'releaseDate'
          formData[el.id] = $('#releaseDate').datepicker('getDate').getTime()
        else
          formData[el.id] = $(el).val()

    this.collection.create formData
