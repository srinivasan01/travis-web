`import { test, moduleForComponent } from 'ember-qunit'`

moduleForComponent 'repo-actions', 'RepoActionsComponent', {
  # specify the other units that are required for this test
  needs: ['component:build-repo-actions', 'component:job-repo-actions']
}

test 'it displays code climate if the repo language is ruby', ->
  # creates the component instance
  repo = Ember.Object.create(githubLanguage: 'Ruby')

  component = @subject(repo: repo)
  @append()

  ok component.get('displayCodeClimate'), 'component should try to display code climate'
  ok component.$('a[name=code-climate]').length, 'component should render a code climate button'

test 'it doesn\'t display code climate for other languages', ->
  repo = Ember.Object.create(githubLanguage: 'Go')

  component = @subject(repo: repo)
  @append()

  ok !component.get('displayCodeClimate'), 'component should not try to display code climate'
  ok !component.$('a[name=code-climate]').length, 'component should not render a code climate button'
