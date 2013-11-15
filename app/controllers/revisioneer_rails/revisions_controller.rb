module RevisioneerRails
  class RevisionsController < ApplicationController
    def index

    end

    protected
    def deployments
      @deployments ||= ::RevisioneerRails::Deployment.load
    end
    helper_method :deployments
  end
end