class Gitlab::Client
  module Services
    # Create/Edit service
    # Full service params documentation: https://github.com/gitlabhq/gitlabhq/blob/master/doc/api/services.md
    #
    # @example
    #   Gitlab.change_service(42, :redmine, { new_issue_url: 'https://example.com/projects/test_project/issues/new',
    #                                         project_url: 'https://example.com/projects/test_project/issues',
    #                                         issues_url: 'https://example.com/issues/:id' })
    #
    # @param  [Integer] project The ID of a project.
    # @param  [String] service A service code name.
    # @param  [Hash] params A service parameters.
    # @return [Boolean]
    def change_service(project, service, params)
      put("/projects/#{project}/services/#{correct_service_name(service)}", body: params)
    end

    # Delete service
    #
    # @example
    #   Gitlab.delete_service(42, :redmine)
    #
    # @param  [Integer] project The ID of a project.
    # @param  [String] service A service code name.
    # @return [Boolean]
    def delete_service(project, service)
      delete("/projects/#{project}/services/#{correct_service_name(service)}")
    end

    # Get service
    #
    # @example
    #   Gitlab.service(42, :redmine)
    #
    # @param  [Integer] project The ID of a project.
    # @param  [String] service A service code name.
    # @return [Gitlab::ObjectifiedHash]
    def service(project, service)
      get("/projects/#{project}/services/#{correct_service_name(service)}")
    end

    private
    def correct_service_name(service)
      service.to_s.gsub('_', '-')
    end
  end
end
