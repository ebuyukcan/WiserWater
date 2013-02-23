class Templates
  # Hash of preloaded templates for the app
  templates: {}
  
  # Recursively pre-load all the templates for the app.
  # This implementation should be changed in a production environment. All the template files should be
  # concatenated in a single file.
  
  loadTemplates: (names, callback) ->
    # Hack to get around Access-Control-Allow-Origin -- Not loading any templates
    callback()
    return @
    
    unless debug
      callback()
      return @

    loadTemplate = (index) =>
      name = names[index]
      $.get @parseTemplateName(name), (data) =>
        @templates[name] = data
        index++
        if index < names.length
          loadTemplate index
        else
          callback()

    loadTemplate 0

  # Get template by name from hash of preloaded templates
  get: (name) ->
    unless @templates[name]
        throw "Template Error - Cannot find " + @parseTemplateName(name)
    @templates[name]
  
  parseTemplateName: (name) ->
    static_prefix + "templates/" + name + ".html"
