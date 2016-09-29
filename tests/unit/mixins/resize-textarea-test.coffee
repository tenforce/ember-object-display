`import Ember from 'ember'`
`import ResizeTextareaMixin from '../../../mixins/resize-textarea'`
`import { module, test } from 'qunit'`

module 'Unit | Mixin | resize textarea'

# Replace this with your real tests.
test 'it works', (assert) ->
  ResizeTextareaObject = Ember.Object.extend ResizeTextareaMixin
  subject = ResizeTextareaObject.create()
  assert.ok subject
