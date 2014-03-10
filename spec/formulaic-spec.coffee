{$, WorkspaceView, View}  = require 'atom'
Formulaic = require '../lib/formulaic'

# Use the command `window:run-package-specs` (cmd-alt-ctrl-p) to run specs.
#
# To run a specific `it` or `describe` block add an `f` to the front (e.g. `fit`
# or `fdescribe`). Remove the `f` to unfocus the block.

describe "Formulaic", ->
  activationPromise = null

  beforeEach ->
    atom.workspaceView = new WorkspaceView
    activationPromise = atom.packages.activatePackage('formulaic')

  describe "when the formulaic:eval event is triggered", ->
    fit "attaches and then detaches the view", ->
      expect(atom.workspaceView.find('.formulaic')).not.toExist()

      # This is an activation event, triggering it will cause the package to be
      # activated.
      atom.workspaceView.trigger 'formulaic:evaluate'

      waitsForPromise ->
        activationPromise

      runs ->
        expect(atom.workspaceView.find('.formulaic')).toExist()
        atom.workspaceView.trigger 'formulaic:evaluate'
        expect(atom.workspaceView.find('.formulaic')).not.toExist()
