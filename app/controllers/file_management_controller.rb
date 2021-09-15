class FileManagementController < ApplicationController
  before_action :authenticate_admin!

  def index
    find_admin
  end

  def delete_from_storage
    ActiveStorage::Attachment.find(params[:sound_file_id]).purge
    redirect_back(fallback_location: file_management_index_path)
  end
end
