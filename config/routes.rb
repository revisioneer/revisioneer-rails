RevisioneerRails::Engine.routes.draw do
  get '/', to: 'revisioneer_rails/revisions#index', as: :revisions
end