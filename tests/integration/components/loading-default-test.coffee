`import { test, moduleForComponent } from 'ember-qunit'`
`import hbs from 'htmlbars-inline-precompile'`

moduleForComponent 'loading-default', 'Integration | Component | loading default', {
  integration: true
}

test 'it renders', (assert) ->
  assert.expect 2

  # Set any properties with @set 'myProperty', 'value'
  # Handle any actions with @on 'myAction', (val) ->

  @render hbs """{{loading-default}}"""

  assert.equal @$().text().trim(), ''

  # Template block usage:
  @render hbs """
    {{#loading-default}}
      template block text
    {{/loading-default}}
  """

  assert.equal @$().text().trim(), 'template block text'
