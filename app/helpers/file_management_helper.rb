module FileManagementHelper
  def path_to_file(x)
    Rails.application.routes.url_helpers.rails_blob_path(x, only_path: true)
  end

  def delete_file(x)
    button_to 'Delete',
              delete_from_storage_file_management_index_path(sound_file_id: x.id),
              data: { confirm: 'Are you sure?' },
              class: 'btn btn-outline-danger'
  end

  def download(x)
    link_to x.filename.to_s, x
  end

  def creation_time(x)
    x.created_at.strftime('%d of %B %Y, %A, %T')
  end
end
