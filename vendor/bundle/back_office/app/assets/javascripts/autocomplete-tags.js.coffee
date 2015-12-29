class @AutoCompleteTags
  constructor: () ->
    tag_select = $(".tags-select")
    placeholder = tag_select.data("placeholder")
    url = tag_select.data("url")

    tag_select.select2
      tags: true
      language: 'ru'
      placeholder: placeholder
      minimumInputLength: 3
      tokenSeparators: [',', ' ']
      ajax:
        url: '/admin/autocomplete_tags'
        cache: true
        dataType: "json"
        data: (term) ->
          q: term

        processResults: (data) ->
          results: $.map(data, (item) ->
            text: item.name
            id: item.id
          )

      createSearchChoice: (term, data) ->
        if $(data).filter(->
          @name.localeCompare(term) is 0
        ).length is 0
          id: term
          name: term

      formatResult: (item, page) ->
        item.name

      formatSelection: (item, page) ->
        item.name

