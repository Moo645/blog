# frozen_string_literal: true

class TurboModal::TurboModalComponent < ViewComponent::Base
  include Turbo::FramesHelper

  def initialize(title:)
    @title = title
    @actions = actions
  end

  private

  def actions
    {
      modal: [
        'turbo:submit-end->turbo-modal--turbo-modal#submitEndClose',
        'click@window->turbo-modal--turbo-modal#clickOutsideClose'
      ].join(' '),
      button: 'turbo-modal--turbo-modal#closeModal'
    }
  end
end
