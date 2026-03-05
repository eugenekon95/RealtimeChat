module AuthFormHelper
  def auth_label_class
    "block mb-2 text-sm font-medium text-gray-900 dark:text-gray-300"
  end

  def auth_input_class
    "w-full rounded-lg border border-gray-300 bg-gray-50 p-2.5 text-sm text-gray-900
     focus:border-blue-500 focus:ring-2 focus:ring-blue-500 focus:outline-none
     dark:bg-gray-700 dark:border-gray-600 dark:text-white
     dark:focus:border-blue-500 dark:focus:ring-blue-500"
  end

  def auth_checkbox_class
    "w-4 h-4 text-blue-600 bg-gray-100 border-gray-300 rounded
     focus:ring-blue-500 dark:focus:ring-blue-600
     dark:ring-offset-gray-800 dark:bg-gray-700 dark:border-gray-600"
  end

  def auth_submit_class
    "w-full px-5 py-2.5 text-sm font-medium text-white bg-blue-700
     hover:bg-blue-800 focus:ring-4 focus:outline-none focus:ring-blue-300
     rounded-lg text-center
     dark:bg-blue-600 dark:hover:bg-blue-700 dark:focus:ring-blue-800"
  end

  def auth_form_wrapper_class
    "py-3 px-3 max-w-md mx-auto"
  end

  def auth_title_class
    "mb-6 text-3xl font-extrabold tracking-tight text-gray-900 dark:text-white"
  end

  def auth_links_wrapper_class
    "mt-6 pt-6 border-t border-gray-200 dark:border-gray-700 text-center space-y-2"
  end

  def auth_link_class
    "block text-sm text-gray-600 hover:text-blue-600 transition-colors
   dark:text-gray-400 dark:hover:text-blue-400"
  end

  def auth_primary_link_class
    "block text-sm font-medium text-blue-600 hover:text-blue-700 transition-colors
   dark:text-blue-400 dark:hover:text-blue-300"
  end
end