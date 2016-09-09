`import { test, moduleForComponent } from 'ember-qunit'`
`import hbs from 'htmlbars-inline-precompile'`

moduleForComponent 'headings-display', 'Integration | Component | headings display', {
  integration: true
}

test 'it renders', (assert) ->
  assert.expect 2

  # Set any properties with @set 'myProperty', 'value'
  # Handle any actions with @on 'myAction', (val) ->

  @render hbs """{{headings-display}}"""

  assert.equal @$().text().trim(), ''

  # Template block usage:
  @render hbs """
    {{#headings-display}}
      template block text
    {{/headings-display}}
  """

  assert.equal @$().text().trim(), 'template block text'
