module ApplicationHelper
  def human_boolean(boolean)
    boolean ? t('helpers.yes') : t('helpers.no')
  end
end
