# frozen_string_literal: true

class ProjectsController < ApplicationController
  skip_forgery_protection

  rescue_from ActiveRecord::RecordNotFound do
    redirect_to projects_path
  end

  def index
    @projects = Project.slim.visible.select(:created_at).order(created_at: :desc)
    set_meta_tags description: "A comprehensive, curated list of open-source Ruby on Rails applications."
    render layout: "projects"
  end

  def show
    @project = Projects::ShowDecorator.new(
      Project.friendly.visible.find(params[:slug])
    )

    set_meta_tags description: @project.github_about, title: @project.name,
      og: {title: "#{@project.name} on OpenSourceRails.dev"}

    set_meta_tags og: {image: cdn_image_url(@project.primary_image)} if @project.primary_image.present?

    ahoy.track "$viewed_project", slug: params[:slug]
  end

  def update
    if params[:api_key] == ENV["API_KEY"]
      @project = Project.friendly.visible.find(params[:slug])
      @project.primary_image.attach(params.permit(:primary_image)[:primary_image])
      head :ok
    end
  end

  def feed
    @projects = Project.latest

    return head :no_content unless (first = @projects.first)

    @feed_cache_key = "feed/rss-#{first.id}-#{first.updated_at.to_i}"

    feed_xml = Rails.cache.fetch(@feed_cache_key, expires_in: 3.hours) do
      render_to_string layout: false, formats: [:xml]
    end

    render xml: feed_xml
  end
end
