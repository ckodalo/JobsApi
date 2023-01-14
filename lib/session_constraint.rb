class SessionConstraint
    def matches?
      Session.where(submit: request.path_parameters[:submit]).exists?
    end
  end