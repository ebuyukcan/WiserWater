# Views duties: 
# 1 - Listen to events thrown by the DOM and models/collections. 
# 2 - Represent the application’s state and data model to the user
View = Backbone.view.extend(
  tagName: "div" #tag of the generated element. If we dont add anything div will be default
  className: "item" #class of the generated element
  id: "home" #id of the generated element
  el: $("#homeContainer") #reference to the DOM element 
  
  #function for rendering the view
  render: ->
    @el.innerHTML = "SOMETHING"
    this
)
v = new View() #Instantiate a view
v.el # DOM element of the view
v.$el #Cached jQuery object for the view's element
v.render() #Renders the view into the element
v.render().el #DOM element of the rendered view

# INSERTING A VIEW IN THE DOM
itemView = Backbone.View.extend(
  tagName: "li"
  className: "item"
  render: ->
    @el.innerHTML = "Hello"
    this #return this
)

# TEST IT IN CONSOLE
i = new itemView()
i.el
i.render()
i.el
$("#articlesList").html i.render().el # Assumes that element with id #articlesList exists
# I believe this will insert: <li class="item">Hello</li> in the element #articlesList

# Attaching the view to an EXISTING DOM
itemView1 = Backbone.View.extend(
  el: $()
  render: ->
    $(@el).html()
    this
)
i1 = new itemView1()
i1.render()
itemView2 = Backbone.View.extend(
  el: $()
  render: ->
    $(@el).html()
    this
)
i2 = new itemView2()
i2.render()
i2.$el.html()
i1.render()
i2.render()