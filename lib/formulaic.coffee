FormulaicView = require './formulaic-view'

module.exports =
  formulaicView: null

  activate: (state) ->
    @formulaicView = new FormulaicView(state.formulaicViewState)

  deactivate: ->
    @formulaicView.destroy()

  serialize: ->
    formulaicViewState: @formulaicView.serialize()
