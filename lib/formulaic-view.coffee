{View} = require 'atom'
mathjs = require('mathjs')
math = mathjs();

module.exports =
class FormulaicView extends View
  @content: ->
    @div class: 'formulaic overlay from-top', =>
      @div "The Formulaic package is Alive! It's ALIVE!", class: "message"

  initialize: (serializeState) ->
    atom.workspaceView.command "formulaic:evaluate", => @evaluate()

  # Returns an object that can be retrieved when package is activated
  serialize: ->

  # Tear down any state and detach
  destroy: ->
    @detach()

  evaluate: ->
    editor = atom.workspace.activePaneItem
    selection = editor.getSelection()
    text = selection.getText().split("\n").join(" ")
    if text
      selection.insertText(math.eval(text).toString())
      console.log "FormulaicView was evaluated!: #{math.eval(text).toString()}"
    @detach()
